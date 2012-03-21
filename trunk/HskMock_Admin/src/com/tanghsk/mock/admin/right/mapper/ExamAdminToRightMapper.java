package com.tanghsk.mock.admin.right.mapper;

import com.tanghsk.mock.admin.right.domain.ExamAdminToRightKey;


public interface ExamAdminToRightMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    int deleteByPrimaryKey(ExamAdminToRightKey key);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    int insert(ExamAdminToRightKey record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    int insertSelective(ExamAdminToRightKey record);
}