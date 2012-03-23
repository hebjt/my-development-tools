package com.tanghsk.mock.admin.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.tanghsk.mock.admin.right.service.ExamRightService;
import com.tanghsk.mock.admin.user.domain.ExamUser;
/**
 * 在这个类中，你就可以从数据库中读入用户的密码，
 * 角色信息，是否锁定，账号是否过期等。建议通过我们封装的平台级持久层管理类获取和管理
 * @author cuijingtao
 *
 */
public class CustomUserDetailsService implements UserDetailsService {
	
	@Autowired
	private ExamRightService rightService;

	@Override
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		Collection<GrantedAuthority> auths = new ArrayList<GrantedAuthority>();
		Map<String,String> map = new HashMap<String,String>();
		map.put("username0", username);
		map.put("username1", username);
		ApplicationContext context = new ClassPathXmlApplicationContext("spring-application.xml");  
        ExamRightService rightService0 = (ExamRightService)context.getBean("rightServiceCreat"); 
		//得到用户的权限
		auths = rightService0.loadUserAuthoritiesByName(map);
		ExamUser examUser = rightService0.findUserById(username);

		User user = new User(username, examUser.getUser_pass(), true, true, true, true, auths);
		return user;

	}
	


}
