package com.tanghsk.util;

public interface Constants {
	/**
	 * 空格
	 */
	String WHITE_SPACE = "";

	/**
	 * 每页显示的数据量
	 */
	int PAGE_SIZE = 10;

	/**
	 * 当前页面属性名
	 */
	String CURR_PAGE_NAME = "currPage";

	/**
	 * 当前
	 */
	String PAGE_SIZE_NAME = "pageSize";

	/**
	 * 要排序的属性名
	 */
	String ORDER_NAME = "orderName";

	/**
	 * 要排序的方式
	 */
	String ORDER_FLAG = "orderFlag";

	/**
	 * 看是否为数字
	 */
	String NUMBER_REGEX = "^[1-9]\\d*$";

	/**
	 * 默认为第一页
	 */
	int FIRST_PAGE = 1;
}
