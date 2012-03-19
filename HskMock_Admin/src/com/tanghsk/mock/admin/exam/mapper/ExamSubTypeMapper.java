package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import com.tanghsk.mock.admin.exam.domain.ExamSubType;
import com.tanghsk.mock.admin.exam.domain.ExamSubject;

/**
 * 科目类型
 * @author pig
 * 2012-1-13
 */
@Repository("subTypeMapper")
public interface ExamSubTypeMapper {
	/**
	 * 获取所有科目类型
	 * @param subType
	 * @return
	 */
	List<ExamSubType> getAllSubType();
	
	/**
	 * 添加科目类型
	 * @param subType
	 */
	void addSubType(ExamSubType subType);
	
	/**
	 * 按照ID查找科目类型
	 * @param subType
	 * @return
	 */
	ExamSubType findSubTypeById(String subType_id);
	
	/**
	 * 按照名称查找科目类型
	 * @param subType_name
	 * @return
	 */
	ExamSubType findSubTypeByName(String subType_name);
	
	/**
	 * 修改科目类型
	 * @param subType
	 */
	void editSubType(ExamSubType subType);
	
	/**
	 * 按照名称或者ID查找科目类型
	 * @param subType
	 * @return
	 */
	List<ExamSubType> findDupSubType(@Param(value="subType")ExamSubType subType,@Param(value="findType") String findType);
	
	/**
	 * 删除科目类型
	 * @param subType
	 */
	void delSubType(ExamSubType subType);
	
	/**
	 * 查找科目类型是否使用
	 * @param subType
	 * @return
	 */
	List<ExamSubject> findSubjectByType(ExamSubType subType);
}
