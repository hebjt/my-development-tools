package com.tanghsk.mock.admin.right.domain;
import java.io.Serializable;

public class ExamRole implements Serializable {
    /**
     * exam_role.role_id (角色编号)
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    private String roleId;

    /**
     * exam_role.role_name (角色名称)
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    private String roleName;

    /**
     * exam_role.role_desc (角色描述)
     * @ibatorgenerated 2012-02-09 15:16:58
     */
    private String roleDesc;

    public String getRoleId() {
        return roleId;
    }

    public void setRoleId(String roleId) {
        this.roleId = roleId;
    }

    public String getRoleName() {
        return roleName;
    }

    public void setRoleName(String roleName) {
        this.roleName = roleName;
    }

    public String getRoleDesc() {
        return roleDesc;
    }

    public void setRoleDesc(String roleDesc) {
        this.roleDesc = roleDesc;
    }
}