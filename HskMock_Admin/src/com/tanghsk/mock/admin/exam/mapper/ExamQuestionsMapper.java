package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamQuestions;
@Repository("questionsMapper")
public interface ExamQuestionsMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    int deleteByQuesId(String ques_id);

    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    int saveQuestions(ExamQuestions questions);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    ExamQuestions getQuestionById(String quesId);
    /**
     * 根据试题id加载所有子集合
     * @param ques_id
     * @return
     */
    List<ExamQuestions> getQuestionByParentId(String ques_id);
    /**
     * 根据科目结构Id加载
     * @param subjectStructId 科目结构Id
     * @return：List
     */
    List<ExamQuestions> getListObjectByStructId(Map<String,String> map);
    

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    int updateQuestion(ExamQuestions quesion);
    /**
     * 获取批量添加的试题id号
     * @param map
     * @return
     */
    List<ExamQuestions> getIdForBatData(Map<String,String> map);
    /**
     * 解析列表
     * @param ques
     * @return
     */
    List<ExamQuestions> getQuestionParse(ExamQuestions ques);

}