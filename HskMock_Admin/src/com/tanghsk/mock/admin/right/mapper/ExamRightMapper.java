package com.tanghsk.mock.admin.right.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.right.domain.ExamRight;
import com.tanghsk.util.Page;
@Repository("rightMapper")
public interface ExamRightMapper {
	/**
	 * 获取所有权限 ---不分页
	 * @return
	 */
	List<ExamRight> getAllRight();
	/**
	 * 加载所有权限数据
	 * @param page 分页参数
	 * @return list
	 *
	 */
	List<ExamRight> loadRightListPageAll(Page page);
	/**
	 * 加载一个用户的所有权限
	 * @param map 封装username
	 * @return
	 *
	 */
	List<ExamRight>loadUserAuthorities(Map<String,String> map);
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    int deleteByPrimaryKey(String rightId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    int insert(ExamRight record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    int insertSelective(ExamRight record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    ExamRight selectByPrimaryKey(String rightId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    int updateByPrimaryKeySelective(ExamRight record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    int updateByPrimaryKey(ExamRight record);
}