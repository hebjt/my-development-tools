package com.tanghsk.mock.admin.right.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.right.domain.ExamResource;
import com.tanghsk.util.Page;
@Repository("resourceMapper")
public interface ExamResourceMapper {
	/**
	 * 获取某个权限下的所有资源
	 * @param rightId 权限id
	 * @return list
	 *
	 */
	List<ExamResource> getAllResource(String rightId);
	/**
	 * 获取系统内所有的资源列表
	 * @return
	 */
	List<ExamResource> getListPageResource(Page page);
	
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    int deleteByPrimaryKey(String resId);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    int insert(ExamResource record);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    int insertSelective(ExamResource record);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    ExamResource selectByPrimaryKey(String resId);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    int updateByPrimaryKeySelective(ExamResource record);

    /**
     * 根据主键修改，空值条件会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    int updateByPrimaryKey(ExamResource record);
}