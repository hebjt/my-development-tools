package com.tanghsk.sync.domain;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Set;

public class ViewQuestionList implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String id;
	private String parentId;
	private String subjectId;
	private String seqNum;
	private String content;
	private String testType;
	private String exampleSign;
	private String structId;
	private String strucName;
	private ViewQuestionList parentNode;
	private List<ViewQuestionList> childList; 
	private boolean leaf;
	private int level;
	private String paperId;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getParentId() {
		return parentId;
	}
	public void setParentId(String parentId) {
		this.parentId = parentId;
	}
	public String getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(String subjectId) {
		this.subjectId = subjectId;
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
	public String getTestType() {
		return testType;
	}
	public void setTestType(String testType) {
		this.testType = testType;
	}
	public String getExampleSign() {
		return exampleSign;
	}
	public void setExampleSign(String exampleSign) {
		this.exampleSign = exampleSign;
	}
	public String getStructId() {
		return structId;
	}
	public void setStructId(String structId) {
		this.structId = structId;
	}
	public String getStrucName() {
		return strucName;
	}
	public void setStrucName(String strucName) {
		this.strucName = strucName;
	}
	public String getPaperId() {
		return paperId;
	}
	public void setPaperId(String paperId) {
		this.paperId = paperId;
	}
	public ViewQuestionList getParentNode() {
		return parentNode;
	}
	public void setParentNode(ViewQuestionList parentNode) {
		this.parentNode = parentNode;
	}

	public List<ViewQuestionList> getChildList() {
		return childList;
	}
	public void setChildList(List<ViewQuestionList> childList) {
		this.childList = childList;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	

}
