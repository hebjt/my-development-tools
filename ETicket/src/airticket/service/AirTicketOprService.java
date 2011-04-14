package airticket.service;

import java.rmi.RemoteException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.*;

import org.apache.axis.message.MessageElement;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import airticket.dao.AirorderDAO;
import airticket.po.Airorder;
import airticket.po.AirorderId;

import util.ETicketException;
import webservicesclient.GetFlightDataSetResponseGetFlightDataSetResult;
import webservicesclient._ServiceSoapProxy;

public class AirTicketOprService {

	/**
	 * @author guoyan
	 * @throws Exception
	 */
	private static final Log log = LogFactory.getLog(AirTicketOprService.class);

	private _ServiceSoapProxy serviceSoapProxy;

	private AirorderDAO airOrderDAO;

	// 生成订单
	public String orderTickets(String userName, String passWord,
			String fromCity, String toCity, String airDate, String airTime,
			String airNo, String seat, String name, String IDNO, String tel,
			String note, String memberID) {
		// _ServiceSoapProxy proxy = new _ServiceSoapProxy();
		String orderID = null;

		try {
			orderID = serviceSoapProxy.createOrder(userName, passWord,
					fromCity, toCity, airDate, airTime, airNo, seat, name,
					IDNO, tel, note, memberID);
		} catch (RemoteException e) {
			// TODO 自动生成 catch 块
			// e.printStackTrace();
			throw new ETicketException("生成机票订单异常！--TBI接口createOrder方法异常！", e);
		}

		return orderID;
	}

	// 写入订单表
	public void saveAirOrder(Airorder airOrder) {
		try {
			airOrderDAO.save(airOrder);
		} catch (Exception e) {
			// TODO: handle exception
			throw new ETicketException(
					"写入订单表异常!--AirTicketService.saveAirOrder方法异常！", e);
		}

	}

	public Airorder findAirOrder(AirorderId airOrderId) {
		return airOrderDAO.findById(airOrderId);
	}

	// proxy.createOrder(userName, passWord, fromCity, toCity, airDate, airTime,
	// airNo, seat, name, IDNO, tel, note, memberID)

	public _ServiceSoapProxy getServiceSoapProxy() {
		return serviceSoapProxy;
	}

	public AirorderDAO getAirOrderDAO() {
		return airOrderDAO;
	}

	public void setAirOrderDAO(AirorderDAO airOrderDAO) {
		this.airOrderDAO = airOrderDAO;
	}

	public void setServiceSoapProxy(_ServiceSoapProxy serviceSoapProxy) {
		this.serviceSoapProxy = serviceSoapProxy;
	}

}
