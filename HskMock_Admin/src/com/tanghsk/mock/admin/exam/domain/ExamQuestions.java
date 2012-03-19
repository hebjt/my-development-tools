package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;
import java.util.List;

public class ExamQuestions implements Serializable {
    /**
     * exam_questions.ques_id(试题id)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesId;

    /**
     * exam_questions.paper_id (试卷ID)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String paperId;

    /**
     * exam_questions.ques_type_id题型编码（01综合题、02选择题、03填空题
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesTypeId;

    /**
     * exam_questions.ques_parent_id（试题父id）
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesParentId;

    /**
     * exam_questions.ques_title（试题名称）
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesTitle;

    /**
     * exam_questions.ques_start_time试题开始时间
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer quesStartTime;

    /**
     * exam_questions.ques_end_time试题结束时间
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer quesEndTime;

    /**
     * exam_questions.ques_question_num试题数量
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer quesQuestionNum;

    /**
     * exam_questions.ques_type (题型编码（01综合题、02选择题、03填空题）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesType;

    /**
     * exam_questions.ques_num试题题号
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesNum;

    /**
     * exam_questions.ques_answer (试题答案)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesAnswer;

    /**
     * exam_questions.ques_dry_sign (试题题干标志（00代表题干，01代表试题）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesDrySign;

    /**
     * exam_questions.ques_example_sign (试题例题标志（00例题，01非例题）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesExampleSign;

    /**
     * exam_questions.ques_read_time (看题时间（只针对6级缩写题）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer quesReadTime;

    /**
     * exam_questions.ques_answer_time (答题时间（只针对6级缩写题）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer quesAnswerTime;

    /**
     * exam_questions.ques_opt_column (试题选项显示列)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer quesOptColumn;

    /**
     * exam_questions.ques_drag_sign 试题拖拽标志
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesDragSign;

    /**
     * exam_questions.ques_allow_char 允许输入的字符
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesAllowChar;

    /**
     * exam_questions.ques_listen_text 试题听力原文
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesListenText;

    /**
     * exam_questions.ques_content 试题内容
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String quesContent;
    /**
     * 科目结构编码
     */
    private String subjectStructId;
    /**
     * 试题听力文件地址
     */
    private String quesListenUrl;
    /**
     * 试题解析
     */
    private List<ExamQuestionParse> questionParse;
    

    public String getQuesId() {
        return quesId;
    }

    public void setQuesId(String quesId) {
        this.quesId = quesId;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getQuesTypeId() {
        return quesTypeId;
    }

    public void setQuesTypeId(String quesTypeId) {
        this.quesTypeId = quesTypeId;
    }

    public String getQuesParentId() {
        return quesParentId;
    }

    public void setQuesParentId(String quesParentId) {
        this.quesParentId = quesParentId;
    }

    public String getQuesTitle() {
        return quesTitle;
    }

    public void setQuesTitle(String quesTitle) {
        this.quesTitle = quesTitle;
    }

    public Integer getQuesStartTime() {
        return quesStartTime;
    }

    public void setQuesStartTime(Integer quesStartTime) {
        this.quesStartTime = quesStartTime;
    }

    public Integer getQuesEndTime() {
        return quesEndTime;
    }

    public void setQuesEndTime(Integer quesEndTime) {
        this.quesEndTime = quesEndTime;
    }

    public Integer getQuesQuestionNum() {
        return quesQuestionNum;
    }

    public void setQuesQuestionNum(Integer quesQuestionNum) {
        this.quesQuestionNum = quesQuestionNum;
    }

    public String getQuesType() {
        return quesType;
    }

    public void setQuesType(String quesType) {
        this.quesType = quesType;
    }

    public String getQuesNum() {
        return quesNum;
    }

    public void setQuesNum(String quesNum) {
        this.quesNum = quesNum;
    }

    public String getQuesAnswer() {
        return quesAnswer;
    }

    public void setQuesAnswer(String quesAnswer) {
        this.quesAnswer = quesAnswer;
    }

    public String getQuesDrySign() {
        return quesDrySign;
    }

    public void setQuesDrySign(String quesDrySign) {
        this.quesDrySign = quesDrySign;
    }

    public String getQuesExampleSign() {
        return quesExampleSign;
    }

    public void setQuesExampleSign(String quesExampleSign) {
        this.quesExampleSign = quesExampleSign;
    }

    public Integer getQuesReadTime() {
        return quesReadTime;
    }

    public void setQuesReadTime(Integer quesReadTime) {
        this.quesReadTime = quesReadTime;
    }

    public Integer getQuesAnswerTime() {
        return quesAnswerTime;
    }

    public void setQuesAnswerTime(Integer quesAnswerTime) {
        this.quesAnswerTime = quesAnswerTime;
    }

    public Integer getQuesOptColumn() {
        return quesOptColumn;
    }

    public void setQuesOptColumn(Integer quesOptColumn) {
        this.quesOptColumn = quesOptColumn;
    }

    public String getQuesDragSign() {
        return quesDragSign;
    }

    public void setQuesDragSign(String quesDragSign) {
        this.quesDragSign = quesDragSign;
    }

    public String getQuesAllowChar() {
        return quesAllowChar;
    }

    public void setQuesAllowChar(String quesAllowChar) {
        this.quesAllowChar = quesAllowChar;
    }

    public String getQuesListenText() {
        return quesListenText;
    }

    public void setQuesListenText(String quesListenText) {
        this.quesListenText = quesListenText;
    }

    public String getQuesContent() {
        return quesContent;
    }

    public void setQuesContent(String quesContent) {
        this.quesContent = quesContent;
    }

	public String getSubjectStructId() {
		return subjectStructId;
	}

	public void setSubjectStructId(String subjectStructId) {
		this.subjectStructId = subjectStructId;
	}

	public String getQuesListenUrl() {
		return quesListenUrl;
	}

	public void setQuesListenUrl(String quesListenUrl) {
		this.quesListenUrl = quesListenUrl;
	}

	public List<ExamQuestionParse> getQuestionParse() {
		return questionParse;
	}

	public void setQuestionParse(List<ExamQuestionParse> questionParse) {
		this.questionParse = questionParse;
	}



	
    
}