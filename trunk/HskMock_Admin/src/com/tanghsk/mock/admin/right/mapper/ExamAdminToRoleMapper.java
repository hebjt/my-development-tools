package com.tanghsk.mock.admin.right.mapper;

import com.tanghsk.mock.admin.right.domain.ExamAdminToRoleKey;

public interface ExamAdminToRoleMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    int deleteByPrimaryKey(ExamAdminToRoleKey key);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    int insert(ExamAdminToRoleKey record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    int insertSelective(ExamAdminToRoleKey record);
}