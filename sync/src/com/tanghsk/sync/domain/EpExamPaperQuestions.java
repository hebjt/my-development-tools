package com.tanghsk.sync.domain;

import java.io.Serializable;

public class EpExamPaperQuestions implements Serializable {
    /**
     * ep_exam_paper_questions.id (编码)
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    private String id;

    /**
     * ep_exam_paper_questions.que_id (题干id)
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    private String queId;

    /**
     * ep_exam_paper_questions.struc_id (试卷结构id)
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    private String strucId;

    /**
     * ep_exam_paper_questions.seq_num (顺序)
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    private Integer seqNum;

    /**
     * ep_exam_paper_questions.exam_con (是否转换(00不转�?01单行,02多行))
     * @ibatorgenerated 2012-12-05 14:44:22
     */
    private String examCon;

    private ElQuestions elQuestionsQueId;

    private EpExamPaperStrut epExamPaperStrutStrucId;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getQueId() {
        return queId;
    }

    public void setQueId(String queId) {
        this.queId = queId;
    }

    public String getStrucId() {
        return strucId;
    }

    public void setStrucId(String strucId) {
        this.strucId = strucId;
    }

    public Integer getSeqNum() {
        return seqNum;
    }

    public void setSeqNum(Integer seqNum) {
        this.seqNum = seqNum;
    }

    public String getExamCon() {
        return examCon;
    }

    public void setExamCon(String examCon) {
        this.examCon = examCon;
    }

    public void setElQuestionsQueId(ElQuestions elQuestionsQueId) {
        this.elQuestionsQueId=elQuestionsQueId;
    }

    public ElQuestions getElQuestionsQueId() {
        return elQuestionsQueId;
    }

    public void setEpExamPaperStrutStrucId(EpExamPaperStrut epExamPaperStrutStrucId) {
        this.epExamPaperStrutStrucId=epExamPaperStrutStrucId;
    }

    public EpExamPaperStrut getEpExamPaperStrutStrucId() {
        return epExamPaperStrutStrucId;
    }
}