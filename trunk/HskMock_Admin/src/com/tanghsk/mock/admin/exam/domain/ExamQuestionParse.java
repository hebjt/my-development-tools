package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;

public class ExamQuestionParse implements Serializable {
    /**
     * exam_question_parse.parse_id (试题解析ID)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private String parseId;

    /**
     * exam_question_parse.ques_id
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private String quesId;

    /**
     * exam_question_parse.parse_type (解析类别（video和txt）)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private String parseType;

    /**
     * exam_question_parse.parse_content (文字解析内容)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private String parseContent;

    /**
     * exam_question_parse.parse_file (视频解析文件（视频文件存放路径）)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private String parseFile;

    /**
     * exam_question_parse.parse_width (视频宽度（像素）)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private Integer parseWidth;

    /**
     * exam_question_parse.parse_height (视频高度（像素）)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private Integer parseHeight;

    /**
     * exam_question_parse.parse_state (解析的状态（00-普通发布状态；01-停用状态；02-标记删除状态）)
     * @ibatorgenerated 2012-02-09 15:16:53
     */
    private String parseState;
    /**
     * 试卷编码
     */
    private String paperId;
    /**
     * 科目结构编码
     */
    private String structId;
    

    public String getParseId() {
        return parseId;
    }

    public void setParseId(String parseId) {
        this.parseId = parseId;
    }

    public String getQuesId() {
        return quesId;
    }

    public void setQuesId(String quesId) {
        this.quesId = quesId;
    }

    public String getParseType() {
        return parseType;
    }

    public void setParseType(String parseType) {
        this.parseType = parseType;
    }

    public String getParseContent() {
        return parseContent;
    }

    public void setParseContent(String parseContent) {
        this.parseContent = parseContent;
    }

    public String getParseFile() {
        return parseFile;
    }

    public void setParseFile(String parseFile) {
        this.parseFile = parseFile;
    }

    public Integer getParseWidth() {
        return parseWidth;
    }

    public void setParseWidth(Integer parseWidth) {
        this.parseWidth = parseWidth;
    }

    public Integer getParseHeight() {
        return parseHeight;
    }

    public void setParseHeight(Integer parseHeight) {
        this.parseHeight = parseHeight;
    }

    public String getParseState() {
        return parseState;
    }

    public void setParseState(String parseState) {
        this.parseState = parseState;
    }

	public String getPaperId() {
		return paperId;
	}

	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}

	public String getStructId() {
		return structId;
	}

	public void setStructId(String structId) {
		this.structId = structId;
	}
    
}