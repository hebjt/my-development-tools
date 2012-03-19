package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;
import java.util.Date;

public class ExamPaper implements Serializable {
    /**
     * exam_paper.paper_id (试卷ID)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private String paperId;

    /**
     * exam_paper.subject_id (科目编码)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private ExamSubject subject;

    /**
     * exam_paper.paper_name (试卷名称)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private String paperName;

    /**
     * exam_paper.paper_listening_file (听力文件)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private String paperListeningFile;

    /**
     * exam_paper.paper_create_time (创建时间)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private Date paperCreateTime;

    /**
     * exam_paper.paper_question_num (试题数量)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private Integer paperQuestionNum;

    /**
     * exam_paper.paper_exam_time (答题时间)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private Integer paperExamTime;

    /**
     * exam_paper.paper_notice (注意事项)
     * @ibatorgenerated 2012-01-16 14:50:06
     */
    private String paperNotice;

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    

    public ExamSubject getSubject() {
		return subject;
	}

	public void setSubject(ExamSubject subject) {
		this.subject = subject;
	}

	public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public String getPaperListeningFile() {
        return paperListeningFile;
    }

    public void setPaperListeningFile(String paperListeningFile) {
        this.paperListeningFile = paperListeningFile;
    }

    public Date getPaperCreateTime() {
        return paperCreateTime;
    }

    public void setPaperCreateTime(Date paperCreateTime) {
        this.paperCreateTime = paperCreateTime;
    }

    public Integer getPaperQuestionNum() {
        return paperQuestionNum;
    }

    public void setPaperQuestionNum(Integer paperQuestionNum) {
        this.paperQuestionNum = paperQuestionNum;
    }

    public Integer getPaperExamTime() {
        return paperExamTime;
    }

    public void setPaperExamTime(Integer paperExamTime) {
        this.paperExamTime = paperExamTime;
    }

    public String getPaperNotice() {
        return paperNotice;
    }

    public void setPaperNotice(String paperNotice) {
        this.paperNotice = paperNotice;
    }
}