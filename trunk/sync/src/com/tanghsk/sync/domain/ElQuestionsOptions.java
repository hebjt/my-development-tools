package com.tanghsk.sync.domain;

import java.io.Serializable;

public class ElQuestionsOptions implements Serializable {
    /**
     * el_questions_options.id (id)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String id;

    /**
     * el_questions_options.que_id (题干id)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String queId;

    /**
     * el_questions_options.seq_num (序号)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String seqNum;

    /**
     * el_questions_options.content (选项内容)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String content;

    private ElQuestions elQuestionsQueId;

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

    public String getSeqNum() {
        return seqNum;
    }

    public void setSeqNum(String seqNum) {
        this.seqNum = seqNum;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public void setElQuestionsQueId(ElQuestions elQuestionsQueId) {
        this.elQuestionsQueId=elQuestionsQueId;
    }

    public ElQuestions getElQuestionsQueId() {
        return elQuestionsQueId;
    }
}