package com.tanghsk.mock.admin.exam.domain;

import javax.servlet.http.HttpServletRequest;

import com.tanghsk.util.Page;

/**
 * 试卷科目
 * @author Administrator
 *
 */
public class ExamSubject extends Page{

	public ExamSubject() {
		
	}
	private String subject_id;
	private String exam_status_id;
	private String subject_name;
	private ExamSubType subjectType;
	private int subject_question_num;
	private int subject_paper_num;
	private String subject_remark;
	private ExamSubjectLevel subjectLevel;
    /**
     * exam_subject.subject_level_id (科目级别ID)
     * @ibatorgenerated 2012-03-15 16:59:01
     */
    
	public String getSubject_id() {
		return subject_id;
	}
	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}
	public String getExam_status_id() {
		return exam_status_id;
	}
	public void setExam_status_id(String exam_status_id) {
		this.exam_status_id = exam_status_id;
	}
	public String getSubject_name() {
		return subject_name;
	}
	public void setSubject_name(String subject_name) {
		this.subject_name = subject_name;
	}

	public ExamSubType getSubjectType() {
		return subjectType;
	}
	public void setSubjectType(ExamSubType subjectType) {
		this.subjectType = subjectType;
	}
	public int getSubject_question_num() {
		return subject_question_num;
	}
	public void setSubject_question_num(int subject_question_num) {
		this.subject_question_num = subject_question_num;
	}
	public int getSubject_paper_num() {
		return subject_paper_num;
	}
	public void setSubject_paper_num(int subject_paper_num) {
		this.subject_paper_num = subject_paper_num;
	}
	public String getSubject_remark() {
		return subject_remark;
	}
	public void setSubject_remark(String subject_remark) {
		this.subject_remark = subject_remark;
	}
	public ExamSubjectLevel getSubjectLevel() {
		return subjectLevel;
	}
	public void setSubjectLevel(ExamSubjectLevel subjectLevel) {
		this.subjectLevel = subjectLevel;
	}
	

}
