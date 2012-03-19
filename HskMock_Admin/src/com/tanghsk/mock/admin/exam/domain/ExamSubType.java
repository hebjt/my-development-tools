package com.tanghsk.mock.admin.exam.domain;

/**
 * 科目类型
 * @author pig
 * 2012-1-13
 */
public class ExamSubType {
	private String sub_type_id;
	private String sub_type_name;
	private String sub_type_remark;
	public String getSub_type_id() {
		return sub_type_id;
	}
	public void setSub_type_id(String sub_type_id) {
		this.sub_type_id = sub_type_id;
	}
	public String getSub_type_name() {
		return sub_type_name;
	}
	public void setSub_type_name(String sub_type_name) {
		this.sub_type_name = sub_type_name;
	}
	public String getSub_type_remark() {
		return sub_type_remark;
	}
	public void setSub_type_remark(String sub_type_remark) {
		this.sub_type_remark = sub_type_remark;
	}
	
	@Override
	public String toString() {
		return "ExamSubType [sub_type_id=" + sub_type_id + ", sub_type_name="
				+ sub_type_name + ", sub_type_remark=" + sub_type_remark + "]";
	}
}
