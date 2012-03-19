package com.tanghsk.mock.admin.user.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamSubject;
import com.tanghsk.mock.admin.user.domain.ExamUser;
import com.tanghsk.util.Page;

@Repository("userMapper")
public interface ExamUserMapper {
	ExamUser findUserById(String userName);
	
	List<ExamUser> selectByExample(ExamUser example);
	
	/**
	 * 获取记录列表
	 * @param user
	 * @return
	 */
	List<ExamUser> getListPageUser(Page page);
	/**
	 * 获取记录条数
	 * @return
	 */
	int getCountAllUser();
	void addUser(ExamUser user);
	void delUser(ExamUser user);
	void updateUser(ExamUser user);
	ExamUser findUserByModel(ExamUser user);
}
