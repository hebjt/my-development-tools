package com.tanghsk.mock.admin.security;

import java.io.Reader;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.Configuration;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

import com.tanghsk.mock.admin.right.domain.ExamResource;
import com.tanghsk.mock.admin.right.domain.ExamRight;
import com.tanghsk.mock.admin.right.service.ExamRightService;
import com.tanghsk.mock.admin.security.tools.AntUrlPathMatcher;
import com.tanghsk.mock.admin.security.tools.UrlMatcher;
import com.tanghsk.util.Page;

/**
 * 对于资源的访问权限的定义，我们通过实现FilterInvocationSecurityMetadataSource这个接口来初始化数据。
 * 看看loadResourceDefine方法，我在这里，假定/examPaper/**这个资源，需要ROLE_USER角色的用户才能访问,
 * /subject/**这个资源，需要ROLE_NO角色的用户才能访问。这个类中，还有一个最核心的地方，
 * 就是提供某个资源对应的权限定义，即getAttributes方法返回的结果。注意， 例子中使用的是AntUrlPathMatcher这个path
 * matcher来检查URL是否与资源定义匹配， 事实上你还要用正则的方式来匹配，或者自己实现一个matcher。这里的角色和资源都可以从数据库中获取，
 * 建议通过我们封装的平台级持久层管理类获取和管理
 * 
 * @author cuijingtao
 * 
 */
public class CustomInvocationSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {
	@Autowired
	private ExamRightService rightService;

	private UrlMatcher urlMatcher = new AntUrlPathMatcher();
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;

	public CustomInvocationSecurityMetadataSource() throws Exception {
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

	private void loadResourceDefine() throws Exception{
		
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-application.xml");  
        ExamRightService rightService0 = (ExamRightService)context.getBean("rightServiceCreat");  
        Page page = new Page();
        List<ExamRight> right = rightService0.loadRightListPageAll(page); 

		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		for (ExamRight auth : right) {
			ConfigAttribute ca = new SecurityConfig(auth.getRightId());
			//加载资源表与此权限相关的资源

			List<ExamResource> resList = rightService0.getAllResource(auth.getRightId());

			for (ExamResource res : resList) {
				String url = res.getResValue();
				
				/*
				 * 判断资源文件和权限的对应关系，如果已经存在相关的资源url，
				 * 则要通过该url为key提取出权限集合，将权限增加到权限集合中。
				 * sparta
				 */
				if (resourceMap.containsKey(url)) {

					Collection<ConfigAttribute> value = resourceMap.get(url);
					value.add(ca);
					resourceMap.put(url, value);
				} else {
					Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
					atts.add(ca);
					resourceMap.put(url, atts);
				}

			}

		}

	}

}
