/**
 * Administrator
 * 2011-2-22
 */
package cuijingtao.grid.domain;

import org.apache.struts.action.ActionForm;

/**
 * @author Administrator
 *
 */
public class CardInfo extends ActionForm {
	private String cardno;
	private String cardname;
	private String cardfrom;
	private int parentid;
	private int cardstate;
	private int currPage;
	private int pageSize;
	
	
	public String getCardno() {
		return cardno;
	}
	public void setCardno(String cardno) {
		this.cardno = cardno;
	}
	public String getCardname() {
		return cardname;
	}
	public void setCardname(String cardname) {
		this.cardname = cardname;
	}
	public String getCardfrom() {
		return cardfrom;
	}
	public void setCardfrom(String cardfrom) {
		this.cardfrom = cardfrom;
	}
	public int getParentid() {
		return parentid;
	}
	public void setParentid(int parentid) {
		this.parentid = parentid;
	}
	public int getCurrPage() {
		return currPage;
	}
	public void setCurrPage(int currPage) {
		this.currPage = currPage;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getCardstate() {
		return cardstate;
	}
	public void setCardstate(int cardstate) {
		this.cardstate = cardstate;
	}
	
	

}
