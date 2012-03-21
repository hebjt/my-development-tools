package com.tanghsk.mock.admin.right.mapper;

import com.tanghsk.mock.admin.right.domain.ExamRole;

public interface ExamRoleMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    int deleteByPrimaryKey(String roleId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    int insert(ExamRole record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    int insertSelective(ExamRole record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    ExamRole selectByPrimaryKey(String roleId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    int updateByPrimaryKeySelective(ExamRole record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    int updateByPrimaryKey(ExamRole record);
}