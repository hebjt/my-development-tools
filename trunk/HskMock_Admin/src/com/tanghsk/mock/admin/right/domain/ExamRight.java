package com.tanghsk.mock.admin.right.domain;
import java.io.Serializable;

public class ExamRight implements Serializable {
    /**
     * exam_right.right_id
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    private String rightId;

    /**
     * exam_right.right_name
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    private String rightName;

    /**
     * exam_right.right_desc
     * @ibatorgenerated 2012-02-09 15:16:54
     */
    private String rightDesc;

    public String getRightId() {
        return rightId;
    }

    public void setRightId(String rightId) {
        this.rightId = rightId;
    }

    public String getRightName() {
        return rightName;
    }

    public void setRightName(String rightName) {
        this.rightName = rightName;
    }

    public String getRightDesc() {
        return rightDesc;
    }

    public void setRightDesc(String rightDesc) {
        this.rightDesc = rightDesc;
    }
}