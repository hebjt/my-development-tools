package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamSubjectLevel;
import com.tanghsk.util.Page;
@Repository("levelMapper")
public interface ExamSubjectLevelMapper {
	/**
	 * 获取所有科目级别数据
	 * @param page
	 * @return
	 */
	List<ExamSubjectLevel> getListPage(Page page);
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    int deleteByPrimaryKey(String subjectLevelId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    int insert(ExamSubjectLevel record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    int insertSelective(ExamSubjectLevel record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    ExamSubjectLevel getLevleById(String subjectLevelId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    int updateByPrimaryKeySelective(ExamSubjectLevel record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    int updateByPrimaryKey(ExamSubjectLevel record);
}