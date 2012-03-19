package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import com.tanghsk.mock.admin.exam.domain.ExamSubjectStruct;

public interface ExamSubjectStructMapper {
	/**
	 * 获取科目下科目结构数据列表
	 * @param struct
	 * @return 科目结构数据列表
	 */
	
	
	List<ExamSubjectStruct> getStruBySubID(String subjectId);
	/**
	 * 加载对象
	 * @param struct_id
	 * @return
	 */
	ExamSubjectStruct getObjectById(String struct_id);
	
    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     */
    int addSubStru(ExamSubjectStruct struct);


    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     */
    int updateSubStru(ExamSubjectStruct struct);
    /**
     * 加载一个科目类别下的所有数据（父子层级结构）
     * @return
     */
    List<ExamSubjectStruct> getAllStructDataBySubject(String subject_id);
    /**
     * 加载某个id的所有孩子结点
     * @param struct_id
     * @return
     */
    List<ExamSubjectStruct> getChildList(String struct_id);
    /**
     * 删除数据
     * @param struct_id
     */
    void delStruct(String struct_id);
    /**
     * 根据科目结构Id加载根名称
     * @param struct_id
     * @return
     */
    ExamSubjectStruct getRootNameByid(String struct_id);
    /**
     * 加载科目类别下的所有数据
     * @param subject_id
     * @return
     */
    List<ExamSubjectStruct> getXmlPaper(ExamSubjectStruct struct);

 
}