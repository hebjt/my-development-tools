package com.tanghsk.sync.mapper;

import com.tanghsk.sync.domain.ElQuestions;



public interface ElQuestionsMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    int deleteByPrimaryKey(String id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    int insert(ElQuestions record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    int insertSelective(ElQuestions record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    ElQuestions selectByPrimaryKey(String id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    int updateByPrimaryKeySelective(ElQuestions record);

    /**
     * 根据主键修改，空值条件会修改成null,支持大字段类型
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    int updateByPrimaryKeyWithBLOBs(ElQuestions record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    int updateByPrimaryKey(ElQuestions record);
}