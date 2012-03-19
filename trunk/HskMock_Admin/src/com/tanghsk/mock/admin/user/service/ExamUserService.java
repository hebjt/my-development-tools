package com.tanghsk.mock.admin.user.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.tanghsk.mock.admin.user.domain.ExamUser;
import com.tanghsk.mock.admin.user.mapper.ExamUserMapper;
import com.tanghsk.util.Page;

@Service("userService")
public class ExamUserService {
	@Autowired
	private ExamUserMapper userMapper;
	
	public List<ExamUser> findAll(Page page){


		List<ExamUser> userList = userMapper.getListPageUser(page);
		return userList;
	}
	
	public void addUser(ExamUser user){
		userMapper.addUser(user);
	}
	
	public void delUser(ExamUser user){
		userMapper.delUser(user);
	}
	
	public void updateUser(ExamUser user){
		userMapper.updateUser(user);
	}
	
	public ExamUser findUserById(String user){
		return userMapper.findUserById(user);
	}
	
	public ExamUser findUserByModel(ExamUser user){
		return userMapper.findUserByModel(user);
	}
}
