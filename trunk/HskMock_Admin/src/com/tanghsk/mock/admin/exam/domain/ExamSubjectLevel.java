package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;

public class ExamSubjectLevel implements Serializable {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
     * exam_subject_level.subject_level_id (科目级别ID)
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    private String subjectLevelId;

    /**
     * exam_subject_level.subject_level_name (科目级别名称)
     * @ibatorgenerated 2012-03-15 16:56:03
     */
    private String subjectLevelName;

    public String getSubjectLevelId() {
        return subjectLevelId;
    }

    public void setSubjectLevelId(String subjectLevelId) {
        this.subjectLevelId = subjectLevelId;
    }

    public String getSubjectLevelName() {
        return subjectLevelName;
    }

    public void setSubjectLevelName(String subjectLevelName) {
        this.subjectLevelName = subjectLevelName;
    }
}