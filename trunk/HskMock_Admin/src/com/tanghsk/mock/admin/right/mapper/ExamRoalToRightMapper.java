package com.tanghsk.mock.admin.right.mapper;

import com.tanghsk.mock.admin.right.domain.ExamRoalToRightKey;

public interface ExamRoalToRightMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:55
     */
    int deleteByPrimaryKey(ExamRoalToRightKey key);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:55
     */
    int insert(ExamRoalToRightKey record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:55
     */
    int insertSelective(ExamRoalToRightKey record);
}