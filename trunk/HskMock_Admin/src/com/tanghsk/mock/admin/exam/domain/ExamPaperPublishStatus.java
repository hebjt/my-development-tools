package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;

public class ExamPaperPublishStatus implements Serializable {
    /**
     * exam_paper_publish_status.paper_pub_status_id
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    private String paperPubStatusId;

    /**
     * exam_paper_publish_status.paper_pub_status_name
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    private String paperPubStatusName;

    /**
     * exam_paper_publish_status.paper_pub_status_remark
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    private String paperPubStatusRemark;

    public String getPaperPubStatusId() {
        return paperPubStatusId;
    }

    public void setPaperPubStatusId(String paperPubStatusId) {
        this.paperPubStatusId = paperPubStatusId;
    }

    public String getPaperPubStatusName() {
        return paperPubStatusName;
    }

    public void setPaperPubStatusName(String paperPubStatusName) {
        this.paperPubStatusName = paperPubStatusName;
    }

    public String getPaperPubStatusRemark() {
        return paperPubStatusRemark;
    }

    public void setPaperPubStatusRemark(String paperPubStatusRemark) {
        this.paperPubStatusRemark = paperPubStatusRemark;
    }
}