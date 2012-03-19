package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;

public class ExamOptions implements Serializable {
    /**
     * exam_options.opt_id (选项ID)
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    private String optId;

    /**
     * exam_options.ques_id
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    private String quesId;

    /**
     * exam_options.opt_seq_num (选项序号)
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    private String optSeqNum;

    /**
     * exam_options.opt_content (选项内容)
     * @ibatorgenerated 2012-02-09 15:16:56
     */
    private String optContent;
    /**
     * 试卷编码
     */
    private String optPaperId;
    /**
     * 科目结构编码
     */
    private String optStructId;
    /**
     * 试题类型编码
     */
    private String optTypeId;
    

    public String getOptId() {
        return optId;
    }

    public void setOptId(String optId) {
        this.optId = optId;
    }

    public String getQuesId() {
        return quesId;
    }

    public void setQuesId(String quesId) {
        this.quesId = quesId;
    }

    public String getOptSeqNum() {
        return optSeqNum;
    }

    public void setOptSeqNum(String optSeqNum) {
        this.optSeqNum = optSeqNum;
    }

    public String getOptContent() {
        return optContent;
    }

    public void setOptContent(String optContent) {
        this.optContent = optContent;
    }

	public String getOptPaperId() {
		return optPaperId;
	}

	public void setOptPaperId(String optPaperId) {
		this.optPaperId = optPaperId;
	}

	public String getOptStructId() {
		return optStructId;
	}

	public void setOptStructId(String optStructId) {
		this.optStructId = optStructId;
	}

	public String getOptTypeId() {
		return optTypeId;
	}

	public void setOptTypeId(String optTypeId) {
		this.optTypeId = optTypeId;
	}
    
}