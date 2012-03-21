package com.tanghsk.mock.admin.right.domain;

import java.io.Serializable;

public class ExamAdminstrator implements Serializable {
    /**
     * exam_adminstrator.admin_id
     * @ibatorgenerated 2012-02-09 15:16:57
     */
    private String adminId;

    /**
     * exam_adminstrator.user_id (用户id)
     * @ibatorgenerated 2012-02-09 15:16:57
     */
    private String userId;

    /**
     * exam_adminstrator.admin_title
     * @ibatorgenerated 2012-02-09 15:16:57
     */
    private String adminTitle;

    /**
     * exam_adminstrator.admin_remark
     * @ibatorgenerated 2012-02-09 15:16:57
     */
    private String adminRemark;

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getAdminTitle() {
        return adminTitle;
    }

    public void setAdminTitle(String adminTitle) {
        this.adminTitle = adminTitle;
    }

    public String getAdminRemark() {
        return adminRemark;
    }

    public void setAdminRemark(String adminRemark) {
        this.adminRemark = adminRemark;
    }
}