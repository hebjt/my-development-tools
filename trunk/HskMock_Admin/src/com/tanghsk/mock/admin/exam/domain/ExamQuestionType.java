package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;

public class ExamQuestionType implements Serializable {
    /**
     * exam_question_type.ques_type_id
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    private String quesTypeId;

    /**
     * exam_question_type.ques_type_name
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    private String quesTypeName;

    /**
     * exam_question_type.ques_type_remark
     * @ibatorgenerated 2012-02-09 15:16:59
     */
    private String quesTypeRemark;

    public String getQuesTypeId() {
        return quesTypeId;
    }

    public void setQuesTypeId(String quesTypeId) {
        this.quesTypeId = quesTypeId;
    }

    public String getQuesTypeName() {
        return quesTypeName;
    }

    public void setQuesTypeName(String quesTypeName) {
        this.quesTypeName = quesTypeName;
    }

    public String getQuesTypeRemark() {
        return quesTypeRemark;
    }

    public void setQuesTypeRemark(String quesTypeRemark) {
        this.quesTypeRemark = quesTypeRemark;
    }
}