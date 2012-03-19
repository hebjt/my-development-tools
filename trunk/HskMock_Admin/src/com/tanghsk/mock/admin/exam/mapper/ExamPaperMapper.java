package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamPaper;
import com.tanghsk.util.Page;
@Repository("examPaperMapper")
public interface ExamPaperMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    void delExamPaperById(String paper_id);

    /**
     * 插入，空属性也会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    int addExamPaper(ExamPaper record);


    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    ExamPaper findExamPaperById(String paperId);
    /**
     * 加载试卷对象
     * @param paper_id
     * @return
     */
    ExamPaper findEPById(String paper_id);
    /**
     * 查询出所有
     * 
     * @return 列表
     */
    List<ExamPaper> findListPageAll(Page page);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    int updateExamPaper(ExamPaper paper);

}