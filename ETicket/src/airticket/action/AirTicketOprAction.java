package airticket.action;

import java.io.UnsupportedEncodingException;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import airticket.po.*;
import airticket.service.AirTicketOprService;

import com.opensymphony.xwork2.ActionSupport;

public class AirTicketOprAction extends ActionSupport {

	private static final long serialVersionUID = 1L;

	/**
	 * @author guoyan 国内机票action
	 */

	private AirTicketOprService airTicketOprService;

	// 查询明细-接受隐藏域参数

	private String fromCityHide;

	private String toCityHide;

	private String airCoHide;

	private String airNumberHide;

	private String airDateHide;

	private String airTimeHide;

	private String seatHide;

	private String orderID;

	// this.getText("tbi.password"), fromCityHide, toCityHide,
	// airDateHide, airTimeHide, airCoHide + airNumberHide, seatHide,

	private static final Log log = LogFactory.getLog(AirTicketOprAction.class);

	// 生成订单
	public String orderTickets() throws UnsupportedEncodingException {
		/*
		 * hashMap.put("seat", seat); hashMap.put("fromCity", fromCity);
		 * hashMap.put("toCity", toCity); hashMap.put("fromDate", fromDate);
		 * hashMap.put("fromTime", fromTime); hashMap.put("airNumber",
		 * airNumber);
		 */

		orderID = airTicketOprService.orderTickets(this.getText("tbi.username"),
				this.getText("tbi.password"), fromCityHide, toCityHide,
				airDateHide, airTimeHide, airCoHide + airNumberHide, seatHide,
				"小明", "12345", "13888888888", "无", "vip");
		log.info(orderID);

		if (orderID == null || orderID.indexOf("-") == -1) {
			log.info(orderID.indexOf("-"));
			return "order";
		}

		// 首先判断是否登陆，可用拦截器实现，暂时不考虑
		Airorder airOrder = new Airorder();
		AirorderId airOrderId = new AirorderId();
		airOrderId.setOrderid(orderID);
		// airOrderId.setOrderid("123");
		// 暂时写死，测试使用
		airOrderId.setName("21212");
		airOrder.setId(airOrderId);
		Userinfo userInfo = new Userinfo();
		// write a constant for test
		userInfo.setUserid(1L);
		airOrder.setUserinfo(userInfo);
		airOrder.setPnr("人");
		airTicketOprService.saveAirOrder(airOrder);
		// log.info("===="+airTicketService.findAirOrder(airOrderId).getPnr()+"====");
		return "order";
	}

	
	
	public String getAirCoHide() {
		return airCoHide;
	}

	public void setAirCoHide(String airCoHide) {
		this.airCoHide = airCoHide;
	}

	public String getAirDateHide() {
		return airDateHide;
	}

	public void setAirDateHide(String airDateHide) {
		this.airDateHide = airDateHide;
	}

	public String getAirNumberHide() {
		return airNumberHide;
	}

	public void setAirNumberHide(String airNumberHide) {
		this.airNumberHide = airNumberHide;
	}


	public String getAirTimeHide() {
		return airTimeHide;
	}

	public void setAirTimeHide(String airTimeHide) {
		this.airTimeHide = airTimeHide;
	}

	public String getFromCityHide() {
		return fromCityHide;
	}

	public void setFromCityHide(String fromCityHide) {
		this.fromCityHide = fromCityHide;
	}

	public String getOrderID() {
		return orderID;
	}

	public void setOrderID(String orderID) {
		this.orderID = orderID;
	}

	public String getSeatHide() {
		return seatHide;
	}

	public void setSeatHide(String seatHide) {
		this.seatHide = seatHide;
	}

	public String getToCityHide() {
		return toCityHide;
	}

	public void setToCityHide(String toCityHide) {
		this.toCityHide = toCityHide;
	}



	public AirTicketOprService getAirTicketOprService() {
		return airTicketOprService;
	}



	public void setAirTicketOprService(AirTicketOprService airTicketOprService) {
		this.airTicketOprService = airTicketOprService;
	}



}
