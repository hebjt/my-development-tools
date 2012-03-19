package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;

public class ExamSubjectStruct implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * exam_subject_struct.subject_struct_id(科目结构编码)
     */
    private String subject_struct_id;
    
    /**
     * exam_subject_struct.subject_id (科目编码)
     */
    private String subject_id;

    /**
     * exam_subject_struct.subject_struct_name（科目结构名称）
     */
    private String subject_struct_name;

    /**
     * exam_subject_struct.subject_struct_parent_id（科目结构父id）
     */
    private String subject_struct_parent_id;
    
    /**
     * exam_subject_struct.subject_struct_root_id（科目结构根id）
     */
    private String subject_struct_root_id;
    
    /**
     * exam_subject_struct.subject_struct_question_num(科目结构试题数量)
     */
    private Integer subject_struct_question_num;

    /**
     * exam_subject_struct.subject_struct_answer_time（科目结构答题时长）
     */
    private Integer subject_struct_answer_time;

    /**
     * exam_subject_struct.subject_struct_seq_num（科目结构排序序号）
     */
    private Integer subject_struct_seq_num;
    
    /**
     * exam_subject_struct.subject_struct_level（科目结构层级）
     */
    private Integer subject_struct_level;
    
    /**
     * exam_subject_struct.subject_struct_child_num（科目子节点数量）
     */
    private Integer subject_struct_child_num;

	public String getSubject_struct_id() {
		return subject_struct_id;
	}

	public void setSubject_struct_id(String subject_struct_id) {
		this.subject_struct_id = subject_struct_id;
	}

	public String getSubject_id() {
		return subject_id;
	}

	public void setSubject_id(String subject_id) {
		this.subject_id = subject_id;
	}

	public String getSubject_struct_name() {
		return subject_struct_name;
	}

	public void setSubject_struct_name(String subject_struct_name) {
		this.subject_struct_name = subject_struct_name;
	}

	public String getSubject_struct_parent_id() {
		return subject_struct_parent_id;
	}

	public void setSubject_struct_parent_id(String subject_struct_parent_id) {
		this.subject_struct_parent_id = subject_struct_parent_id;
	}

	public String getSubject_struct_root_id() {
		return subject_struct_root_id;
	}

	public void setSubject_struct_root_id(String subject_struct_root_id) {
		this.subject_struct_root_id = subject_struct_root_id;
	}

	public Integer getSubject_struct_question_num() {
		return subject_struct_question_num;
	}

	public void setSubject_struct_question_num(Integer subject_struct_question_num) {
		this.subject_struct_question_num = subject_struct_question_num;
	}

	public Integer getSubject_struct_answer_time() {
		return subject_struct_answer_time;
	}

	public void setSubject_struct_answer_time(Integer subject_struct_answer_time) {
		this.subject_struct_answer_time = subject_struct_answer_time;
	}

	public Integer getSubject_struct_seq_num() {
		return subject_struct_seq_num;
	}

	public void setSubject_struct_seq_num(Integer subject_struct_seq_num) {
		this.subject_struct_seq_num = subject_struct_seq_num;
	}

	public Integer getSubject_struct_level() {
		return subject_struct_level;
	}

	public void setSubject_struct_level(Integer subject_struct_level) {
		this.subject_struct_level = subject_struct_level;
	}

	public Integer getSubject_struct_child_num() {
		return subject_struct_child_num;
	}

	public void setSubject_struct_child_num(Integer subject_struct_child_num) {
		this.subject_struct_child_num = subject_struct_child_num;
	}
}