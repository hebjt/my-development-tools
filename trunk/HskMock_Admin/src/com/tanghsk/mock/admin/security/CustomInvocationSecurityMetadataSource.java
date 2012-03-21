package com.tanghsk.mock.admin.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.tanghsk.mock.admin.security.tools.AntUrlPathMatcher;
import com.tanghsk.mock.admin.security.tools.UrlMatcher;
/**
 * 对于资源的访问权限的定义，我们通过实现FilterInvocationSecurityMetadataSource这个接口来初始化数据。
 * 看看loadResourceDefine方法，我在这里，假定index.jsp这个资源，需要ROLE_USER角色的用户才能访问,
 * other.jsp这个资源，需要ROLE_NO角色的用户才能访问。这个类中，还有一个最核心的地方，
 * 就是提供某个资源对应的权限定义，即getAttributes方法返回的结果。注意，
 * 我例子中使用的是AntUrlPathMatcher这个path matcher来检查URL是否与资源定义匹配，
 * 事实上你还要用正则的方式来匹配，或者自己实现一个matcher。这里的角色和资源都可以从数据库中获取，
 * 建议通过我们封装的平台级持久层管理类获取和管理
 * @author cuijingtao
 *
 */
public class CustomInvocationSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {
	private UrlMatcher urlMatcher = new AntUrlPathMatcher();
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	
	public CustomInvocationSecurityMetadataSource(){
		loadResourceDefine();
	}

	@Override
	public Collection<ConfigAttribute> getAllConfigAttributes() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Collection<ConfigAttribute> getAttributes(Object object)
			throws IllegalArgumentException {
		// guess object is a URL.
		String url = ((FilterInvocation) object).getRequestUrl();
		Iterator<String> ite = resourceMap.keySet().iterator();
		while (ite.hasNext()) {
			String resURL = ite.next();
			if (urlMatcher.pathMatchesUrl(resURL, url)) {
				return resourceMap.get(resURL);
			}
		}
		return null;

	}

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return true;
	}

	private void loadResourceDefine() {
		
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
		ConfigAttribute ca = new SecurityConfig("ROLE_USER");
		atts.add(ca);
		//resourceMap.put("/index.html", atts);
		resourceMap.put("/examPaper/**", atts);

		Collection<ConfigAttribute> attsno = new ArrayList<ConfigAttribute>();
		ConfigAttribute cano = new SecurityConfig("ROLE_NO");
		attsno.add(cano);
		resourceMap.put("/subject/**", attsno);
		
	}

}
