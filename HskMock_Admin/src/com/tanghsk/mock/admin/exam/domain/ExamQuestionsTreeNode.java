package com.tanghsk.mock.admin.exam.domain;

import java.util.List;

public class ExamQuestionsTreeNode extends ExamQuestions {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private List<ExamQuestionsTreeNode> childs;//子节点
	private ExamQuestionsTreeNode parent;//父节点
	private int level;//深度
	private boolean leaf;//是否叶子节点
	public List<ExamQuestionsTreeNode> getChilds() {
		return childs;
	}
	public void setChilds(List<ExamQuestionsTreeNode> childs) {
		this.childs = childs;
	}
	public ExamQuestionsTreeNode getParent() {
		return parent;
	}
	public void setParent(ExamQuestionsTreeNode parent) {
		this.parent = parent;
	}
	public int getLevel() {
		return level;
	}
	public void setLevel(int level) {
		this.level = level;
	}
	public boolean isLeaf() {
		return leaf;
	}
	public void setLeaf(boolean leaf) {
		this.leaf = leaf;
	}
	

}
