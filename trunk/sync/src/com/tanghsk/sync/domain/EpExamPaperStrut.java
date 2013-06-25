package com.tanghsk.sync.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class EpExamPaperStrut implements Serializable {
    /**
     * ep_exam_paper_strut.id (id)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String id;

    /**
     * ep_exam_paper_strut.paper_id (试卷id)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String paperId;

    /**
     * ep_exam_paper_strut.parent_id (父id)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String parentId;

    /**
     * ep_exam_paper_strut.struc_name (试卷结构名称)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String strucName;

    /**
     * ep_exam_paper_strut.content (显示内容)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String content;

    /**
     * ep_exam_paper_strut.test_num (包含试题数目)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private Integer testNum;

    /**
     * ep_exam_paper_strut.exam_time (答题时间)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private Integer examTime;

    /**
     * ep_exam_paper_strut.seq_num (序号)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private Integer seqNum;

    /**
     * ep_exam_paper_strut.struc_id
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String strucId;

    /**
     * ep_exam_paper_strut.subject_id
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String subjectId;

    private Set<EpExamPaperQuestions> epExamPaperQuestionssStrucId = new HashSet(0);;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getStrucName() {
        return strucName;
    }

    public void setStrucName(String strucName) {
        this.strucName = strucName;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getTestNum() {
        return testNum;
    }

    public void setTestNum(Integer testNum) {
        this.testNum = testNum;
    }

    public Integer getExamTime() {
        return examTime;
    }

    public void setExamTime(Integer examTime) {
        this.examTime = examTime;
    }

    public Integer getSeqNum() {
        return seqNum;
    }

    public void setSeqNum(Integer seqNum) {
        this.seqNum = seqNum;
    }

    public String getStrucId() {
        return strucId;
    }

    public void setStrucId(String strucId) {
        this.strucId = strucId;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public void setEpExamPaperQuestionssStrucId(Set epExamPaperQuestionssStrucId) {
        this.epExamPaperQuestionssStrucId=epExamPaperQuestionssStrucId;
    }

    public Set<EpExamPaperQuestions> getEpExamPaperQuestionssStrucId() {
        return epExamPaperQuestionssStrucId;
    }
}