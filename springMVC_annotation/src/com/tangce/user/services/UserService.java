package com.tangce.user.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tangce.user.domain.User;
import com.tangce.user.mappers.UserMapper;
@Service
public class UserService {
	@Autowired
	private UserMapper userMapper;
	public Map getAllUser(){
		Map<String,Object> map = new HashMap<String, Object>(2);
		User user = new User();
		user.setCurrPage(new Integer(0));
		user.setPageSize(new Integer(10));
		List<User> userList = userMapper.findAllUser(user);
		map.put("ResultSet", userList);
		int count = userMapper.findCountAllUser();
		map.put("RowCount", count);
		//return userDao.findAllUser();
		return map;
	}
	
	public void delUserById(User user){
		userMapper.delUserById(user);
	}
	
	public User findUserById(User user){
		return userMapper.findUserById(user);
	}
	public void updateUser(User user){
		userMapper.updateUser(user);
	}

}
