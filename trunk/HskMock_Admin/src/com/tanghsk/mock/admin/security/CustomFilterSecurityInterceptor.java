package com.tanghsk.mock.admin.security;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
/**
 * 
 *    整个程序执行的过程如下：
	* 1、容器启动(CustomInvocationSecurityMetadataSource：loadResourceDefine加载系统资源与权限列表)
	* 2、用户发出请求
	* 3、过滤器拦截(CustomFilterSecurityInterceptor:doFilter)
	* 4、取得请求资源所需权限(CustomInvocationSecurityMetadataSource:getAttributes)
	* 5、匹配用户拥有权限和请求权限(CustomAccessDecisionManager:decide)，如果用户没有相应的权限，执行第6步，否则执行第7步
	* 6、登录
	* 7、验证并授权(CustomUserDetailService:loadUserByUsername)
	* 8、重复4,5

 * 
 * 核心的是InterceptorStatusToken token = super.beforeInvocation(fi);
 * 会调用我们定义的accessDecisionManager:decide(Object object)和securityMetadataSource:getAttributes(Object object)方法
 * @author cuijingtao
 *
 */
public class CustomFilterSecurityInterceptor extends
		AbstractSecurityInterceptor implements Filter {
	
	private FilterInvocationSecurityMetadataSource securityMetadataSource;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub

	}

	public FilterInvocationSecurityMetadataSource getSecurityMetadataSource() {
		return this.securityMetadataSource;
	}

	public void setSecurityMetadataSource(FilterInvocationSecurityMetadataSource securityMetadataSource) {
		this.securityMetadataSource = securityMetadataSource;
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		invoke(fi);

	}

	@Override
	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method stub

	}

	@Override
	public Class<?> getSecureObjectClass() {
		return FilterInvocation.class;
	}

	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return this.securityMetadataSource;
	}

	public void invoke(FilterInvocation fi) throws IOException,
			ServletException {
		//调用我们定义的CustomAccessDecisionManager:decide(Object object)和
		//CustomInvocationSecurityMetadataSource:getAttributes(Object object)方法
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} finally {
			super.afterInvocation(token, null);
		}
	}

}
