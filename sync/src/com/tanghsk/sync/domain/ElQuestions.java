package com.tanghsk.sync.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class ElQuestions implements Serializable {
	/**
	 * el_questions.id (id)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String id;

	/**
	 * el_questions.parent_id (父id)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String parentId;

	/**
	 * el_questions.subject_id (科目id)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String subjectId;

	/**
	 * el_questions.title (题目)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String title;

	/**
	 * el_questions.struc_id (结构分类)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String strucId;

	/**
	 * el_questions.type_id (考题类型id)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String typeId;

	/**
	 * el_questions.start_time (试题�?��时间)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer startTime;

	/**
	 * el_questions.end_time (试题结束时间)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer endTime;

	/**
	 * el_questions.test_num (试题数量)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer testNum;

	/**
	 * el_questions.wma_file (听力文件名（带路径）)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String wmaFile;

	/**
	 * el_questions.test_type (题型编码�?1综合题�?02选择题�?03填空题）)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String testType;

	/**
	 * el_questions.width (显示宽度)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer width;

	/**
	 * el_questions.height (显示高度)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer height;

	/**
	 * el_questions.seq_num (序号)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String seqNum;

	/**
	 * el_questions.que_answer (答案)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String queAnswer;

	/**
	 * el_questions.sign (标识(00代表题干�?1代表试题))
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String sign;

	/**
	 * el_questions.example_sign (是否例题(00例题�?1非例�?)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String exampleSign;

	/**
	 * el_questions.read_time (看题时间)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer readTime;

	/**
	 * el_questions.answer_time (答题时间)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer answerTime;

	/**
	 * el_questions.opt_column (选项显示�?
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private Integer optColumn;

	/**
	 * el_questions.drag (填空题是否是拖拽)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String drag;

	/**
	 * el_questions.display_position (例题是否横排显示)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String displayPosition;

	/**
	 * el_questions.limit_char (限制字符)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String limitChar;

	/**
	 * el_questions.content (内容)
	 * 
	 * @ibatorgenerated 2012-12-05 14:44:22
	 */
	private String content;

	private Set<ElQuestionsOptions> elQuestionsOptionssQueId = new HashSet(0);;

	private Set<EpExamPaperQuestions> epExamPaperQuestionssQueId = new HashSet(0);;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getParentId() {
		return parentId;
	}

	public void setParentId(String parentId) {
		this.parentId = parentId;
	}

	public String getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getStrucId() {
		return strucId;
	}

	public void setStrucId(String strucId) {
		this.strucId = strucId;
	}

	public String getTypeId() {
		return typeId;
	}

	public void setTypeId(String typeId) {
		this.typeId = typeId;
	}

	public Integer getStartTime() {
		return startTime;
	}

	public void setStartTime(Integer startTime) {
		this.startTime = startTime;
	}

	public Integer getEndTime() {
		return endTime;
	}

	public void setEndTime(Integer endTime) {
		this.endTime = endTime;
	}

	public Integer getTestNum() {
		return testNum;
	}

	public void setTestNum(Integer testNum) {
		this.testNum = testNum;
	}

	public String getWmaFile() {
		return wmaFile;
	}

	public void setWmaFile(String wmaFile) {
		this.wmaFile = wmaFile;
	}

	public String getTestType() {
		return testType;
	}

	public void setTestType(String testType) {
		this.testType = testType;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

	public String getSeqNum() {
		return seqNum;
	}

	public void setSeqNum(String seqNum) {
		this.seqNum = seqNum;
	}

	public String getQueAnswer() {
		return queAnswer;
	}

	public void setQueAnswer(String queAnswer) {
		this.queAnswer = queAnswer;
	}

	public String getSign() {
		return sign;
	}

	public void setSign(String sign) {
		this.sign = sign;
	}

	public String getExampleSign() {
		return exampleSign;
	}

	public void setExampleSign(String exampleSign) {
		this.exampleSign = exampleSign;
	}

	public Integer getReadTime() {
		return readTime;
	}

	public void setReadTime(Integer readTime) {
		this.readTime = readTime;
	}

	public Integer getAnswerTime() {
		return answerTime;
	}

	public void setAnswerTime(Integer answerTime) {
		this.answerTime = answerTime;
	}

	public Integer getOptColumn() {
		return optColumn;
	}

	public void setOptColumn(Integer optColumn) {
		this.optColumn = optColumn;
	}

	public String getDrag() {
		return drag;
	}

	public void setDrag(String drag) {
		this.drag = drag;
	}

	public String getDisplayPosition() {
		return displayPosition;
	}

	public void setDisplayPosition(String displayPosition) {
		this.displayPosition = displayPosition;
	}

	public String getLimitChar() {
		return limitChar;
	}

	public void setLimitChar(String limitChar) {
		this.limitChar = limitChar;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public void setElQuestionsOptionssQueId(Set elQuestionsOptionssQueId) {
		this.elQuestionsOptionssQueId = elQuestionsOptionssQueId;
	}

	public Set<ElQuestionsOptions> getElQuestionsOptionssQueId() {
		return elQuestionsOptionssQueId;
	}

	public void setEpExamPaperQuestionssQueId(Set epExamPaperQuestionssQueId) {
		this.epExamPaperQuestionssQueId = epExamPaperQuestionssQueId;
	}

	public Set<EpExamPaperQuestions> getEpExamPaperQuestionssQueId() {
		return epExamPaperQuestionssQueId;
	}
}