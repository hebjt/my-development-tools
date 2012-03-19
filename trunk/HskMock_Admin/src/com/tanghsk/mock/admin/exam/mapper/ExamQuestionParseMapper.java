package com.tanghsk.mock.admin.exam.mapper;

import com.tanghsk.mock.admin.exam.domain.ExamQuestionParse;

public interface ExamQuestionParseMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    int deleteParse(String parseId);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    void saveParse(ExamQuestionParse parse);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    ExamQuestionParse getParseById(String parseId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    int updateByPrimaryKeySelective(ExamQuestionParse record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    int updateByPrimaryKey(ExamQuestionParse record);
}