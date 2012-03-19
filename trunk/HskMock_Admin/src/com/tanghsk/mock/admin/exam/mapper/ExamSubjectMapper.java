package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamSubject;
import com.tanghsk.util.MyException;
import com.tanghsk.util.Page;


/**
 * 
 * @author Administrator
 *2012-1-12
 */
@Repository("subjectMapper")
public interface ExamSubjectMapper {
	/**
	 * 获取记录列表
	 * @param subject
	 * @return
	 */
	List<ExamSubject> getListPageSubject(Page page);
	/**
	 * 获取记录条数
	 * @return
	 */
	int getCountAllSubject();
	void addSubject(ExamSubject subject) throws MyException;
	ExamSubject findSubjectById(ExamSubject subject);
	void delSubject(ExamSubject subject) throws MyException;
	void updateSubject(ExamSubject subject);

}
