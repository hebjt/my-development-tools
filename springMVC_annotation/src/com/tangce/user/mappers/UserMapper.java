package com.tangce.user.mappers;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tangce.user.domain.User;
@Repository("userMapper")
public interface UserMapper {
	List<User> findAllUser(User user);
	int findCountAllUser();
	void delUserById(User user);
	User findUserById(User user);
	void updateUser(User user);
}
