package com.tanghsk.mock.admin.exam.domain;

import java.io.Serializable;
import java.util.Date;

public class ExamPaperPublish implements Serializable {
    /**
     * exam_paper_publish.publish_id (发布ID)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String publishId;

    /**
     * exam_paper_publish.paper_id (试卷ID)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String paperId;

    /**
     * exam_paper_publish.paper_pub_status_id
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String paperPubStatusId;

    /**
     * exam_paper_publish.publish_name (发布名称，对于单张试卷默认试卷名称)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String publishName;

    /**
     * exam_paper_publish.publish_paper_price (试卷价格，继承自科目中的参考价格，可以自行修改)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Float publishPaperPrice;

    /**
     * exam_paper_publish.publish_time (发布时间)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Date publishTime;

    /**
     * exam_paper_publish.publish_type (发布类型（01-单张试卷，02-打包试卷）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String publishType;

    /**
     * exam_paper_publish.publish_have_parse (是否有解析（01-无，02-是）)
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String publishHaveParse;

    /**
     * exam_paper_publish.publish_have_read
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String publishHaveRead;

    /**
     * exam_paper_publish.publish_point_num
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer publishPointNum;

    /**
     * exam_paper_publish.publish_buy_times
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private Integer publishBuyTimes;

    /**
     * exam_paper_publish.publish_remark
     * @ibatorgenerated 2012-02-09 15:16:52
     */
    private String publishRemark;

    public String getPublishId() {
        return publishId;
    }

    public void setPublishId(String publishId) {
        this.publishId = publishId;
    }

    public String getPaperId() {
        return paperId;
    }

    public void setPaperId(String paperId) {
        this.paperId = paperId;
    }

    public String getPaperPubStatusId() {
        return paperPubStatusId;
    }

    public void setPaperPubStatusId(String paperPubStatusId) {
        this.paperPubStatusId = paperPubStatusId;
    }

    public String getPublishName() {
        return publishName;
    }

    public void setPublishName(String publishName) {
        this.publishName = publishName;
    }

    public Float getPublishPaperPrice() {
        return publishPaperPrice;
    }

    public void setPublishPaperPrice(Float publishPaperPrice) {
        this.publishPaperPrice = publishPaperPrice;
    }

    public Date getPublishTime() {
        return publishTime;
    }

    public void setPublishTime(Date publishTime) {
        this.publishTime = publishTime;
    }

    public String getPublishType() {
        return publishType;
    }

    public void setPublishType(String publishType) {
        this.publishType = publishType;
    }

    public String getPublishHaveParse() {
        return publishHaveParse;
    }

    public void setPublishHaveParse(String publishHaveParse) {
        this.publishHaveParse = publishHaveParse;
    }

    public String getPublishHaveRead() {
        return publishHaveRead;
    }

    public void setPublishHaveRead(String publishHaveRead) {
        this.publishHaveRead = publishHaveRead;
    }

    public Integer getPublishPointNum() {
        return publishPointNum;
    }

    public void setPublishPointNum(Integer publishPointNum) {
        this.publishPointNum = publishPointNum;
    }

    public Integer getPublishBuyTimes() {
        return publishBuyTimes;
    }

    public void setPublishBuyTimes(Integer publishBuyTimes) {
        this.publishBuyTimes = publishBuyTimes;
    }

    public String getPublishRemark() {
        return publishRemark;
    }

    public void setPublishRemark(String publishRemark) {
        this.publishRemark = publishRemark;
    }
}