package com.tanghsk.mock.admin.exam.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.tanghsk.mock.admin.exam.domain.ExamOptions;
@Repository("optionsMapper")
public interface ExamOptionsMapper {
    /**
     * 根据主键删除
     * 参数:主键
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    int deleteOption(String opt_id);


    /**
     * 插入，空属性不会插入
     * 参数:pojo对象
     * 返回:删除个数
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    int saveOptions(ExamOptions options);

    /**
     * 根据主键查询
     * 参数:查询条件,主键值
     * 返回:对象
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    ExamOptions getOptionsById(ExamOptions option);
    /**
     * 根据试题id查询
     * @param ques_id 试题id
     * @return 集合
     */
    List<ExamOptions> getOptionsByQuesId(String ques_id);

    /**
     * 根据主键修改，空值条件不会修改成null
     * 参数:1.要修改成的值
     * 返回:成功修改个数
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    int updateOption(ExamOptions option);

}