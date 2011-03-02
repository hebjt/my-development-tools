package cuijingtao.grid.domain;

import org.apache.struts.action.ActionForm;

public class Page extends ActionForm {
	private int records;
	private int pageCount;
	public int getRecords() {
		return records;
	}
	public void setRecords(int records) {
		this.records = records;
	}
	public int getPageCount() {
		return pageCount;
	}
	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}
	

}
