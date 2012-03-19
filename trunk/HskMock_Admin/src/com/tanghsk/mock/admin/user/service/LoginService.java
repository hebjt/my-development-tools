package com.tanghsk.mock.admin.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.tanghsk.mock.admin.user.domain.ExamUser;
import com.tanghsk.mock.admin.user.mapper.ExamUserMapper;
@Service("loginService")
public class LoginService {
	@Autowired
	private ExamUserMapper userMapper;
	public ExamUser findUserById(String userName){
		return userMapper.findUserById(userName);
	}

}
