package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamPaperPublish;
import com.tanghsk.util.Page;
@Repository("publishMapper")
public interface ExamPaperPublishMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    int deleteByPrimaryKey(String publishId);
    /**
     * 试卷发布分页列表
     * @return
     */
    List<ExamPaperPublish> findListPageAll(Page page);


    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    void savePlublish(ExamPaperPublish publish);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    ExamPaperPublish loadPublishById(String publishId);
    /**
     * 根据试卷Id查询
     * @param paper_id
     * @return
     */
    List<ExamPaperPublish> getPaperListByPaperId(String paper_id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    void updatePublishById(ExamPaperPublish publish);

}