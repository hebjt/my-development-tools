package com.tanghsk.mock.admin.right.domain;
import java.io.Serializable;

public class ExamResource implements Serializable {
    /**
     * exam_resource.res_id (资源id)
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    private String resId;

    /**
     * exam_resource.res_type (资源类型)
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    private String resType;

    /**
     * exam_resource.res_value (资源值)
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    private String resValue;

    /**
     * exam_resource.res_desc (资源描述)
     * @ibatorgenerated 2012-02-09 15:16:51
     */
    private String resDesc;

    public String getResId() {
        return resId;
    }

    public void setResId(String resId) {
        this.resId = resId;
    }

    public String getResType() {
        return resType;
    }

    public void setResType(String resType) {
        this.resType = resType;
    }

    public String getResValue() {
        return resValue;
    }

    public void setResValue(String resValue) {
        this.resValue = resValue;
    }

    public String getResDesc() {
        return resDesc;
    }

    public void setResDesc(String resDesc) {
        this.resDesc = resDesc;
    }
}