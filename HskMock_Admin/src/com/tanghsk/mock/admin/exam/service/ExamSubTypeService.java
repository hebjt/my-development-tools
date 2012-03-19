package com.tanghsk.mock.admin.exam.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tanghsk.mock.admin.exam.domain.ExamSubType;
import com.tanghsk.mock.admin.exam.domain.ExamSubject;
import com.tanghsk.mock.admin.exam.mapper.ExamSubTypeMapper;

@Service("subTypeService")
public class ExamSubTypeService {
	@Autowired
	private ExamSubTypeMapper subTypeMapper;
	
	/**
	 * 获取所有科目类型
	 * @return
	 */
	public List<ExamSubType> getAllSubType(){
		List<ExamSubType> subTypeList = subTypeMapper.getAllSubType();
		return subTypeList;
	}
	
	/**
	 * 按照ID查找科目类型
	 * @param subType_id
	 * @return
	 */
	public ExamSubType findSubTypeById(String subType_id){
		return subTypeMapper.findSubTypeById(subType_id);
	}
	
	/**
	 * 按照名称查找科目类型
	 * @param subType_name
	 * @return
	 */
	public ExamSubType findSubTypeByName(String subType_name){
		return subTypeMapper.findSubTypeByName(subType_name);
	}
	
	public List<ExamSubType> findDupSubType(ExamSubType subType,String findType){
		return subTypeMapper.findDupSubType(subType,findType);
	}
	
	/**
	 * 添加科目类型
	 * @param subType
	 */
	public void addSubType(ExamSubType subType){
		subTypeMapper.addSubType(subType);
	}
	
	/**
	 * 编辑科目类型
	 * @param subType
	 */
	public void editSubType(ExamSubType subType){
		subTypeMapper.editSubType(subType);
	}
	
	/**
	 * 删除科目类型
	 * @param subType
	 */
	public void delSubType(ExamSubType subType){
		subTypeMapper.delSubType(subType);
	}
	
	/**
	 * 按照科目类别查找科目
	 * @param subType
	 * @return
	 */
	public List<ExamSubject> findSubjectByType(ExamSubType subType){
		return subTypeMapper.findSubjectByType(subType);
	}
}
