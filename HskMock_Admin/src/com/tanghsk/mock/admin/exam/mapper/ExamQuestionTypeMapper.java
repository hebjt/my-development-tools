package com.tanghsk.mock.admin.exam.mapper;

import com.tanghsk.mock.admin.exam.domain.ExamQuestionType;

public interface ExamQuestionTypeMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    int deleteByPrimaryKey(String quesTypeId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    int insert(ExamQuestionType record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    int insertSelective(ExamQuestionType record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    ExamQuestionType selectByPrimaryKey(String quesTypeId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    int updateByPrimaryKeySelective(ExamQuestionType record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    int updateByPrimaryKey(ExamQuestionType record);
}