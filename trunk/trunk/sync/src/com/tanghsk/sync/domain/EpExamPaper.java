package com.tanghsk.sync.domain;

import java.io.Serializable;
import java.util.Date;

public class EpExamPaper implements Serializable {
    /**
     * ep_exam_paper.id (试卷ID)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String id;

    /**
     * ep_exam_paper.subject_id (科目id)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String subjectId;

    /**
     * ep_exam_paper.status (状�?)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String status;

    /**
     * ep_exam_paper.paper_name (试卷名称)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String paperName;

    /**
     * ep_exam_paper.listening_file (听力文件名（带路径）)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String listeningFile;

    /**
     * ep_exam_paper.create_time (创建时间)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private Date createTime;

    /**
     * ep_exam_paper.test_num (试题数目)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private Integer testNum;

    /**
     * ep_exam_paper.exam_time (答题时间)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private Integer examTime;

    /**
     * ep_exam_paper.notice (注意事项)
     * @ibatorgenerated 2012-12-05 14:44:21
     */
    private String notice;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSubjectId() {
        return subjectId;
    }

    public void setSubjectId(String subjectId) {
        this.subjectId = subjectId;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getPaperName() {
        return paperName;
    }

    public void setPaperName(String paperName) {
        this.paperName = paperName;
    }

    public String getListeningFile() {
        return listeningFile;
    }

    public void setListeningFile(String listeningFile) {
        this.listeningFile = listeningFile;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
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

    public String getNotice() {
        return notice;
    }

    public void setNotice(String notice) {
        this.notice = notice;
    }
}