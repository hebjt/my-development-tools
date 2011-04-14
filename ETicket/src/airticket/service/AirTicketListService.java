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
import airticket.dao.DromeCodeDAO;
import airticket.po.Airorder;
import airticket.po.AirorderId;
import airticket.po.DromeCode;
import airticket.po.Userinfo;

import util.ETicketException;
import webservicesclient.GetFlightDataSetResponseGetFlightDataSetResult;
import webservicesclient._ServiceSoapProxy;

public class AirTicketListService {

	/**
	 * @author guoyan
	 * @throws Exception
	 */
	private static final Log log = LogFactory
			.getLog(AirTicketListService.class);

	private _ServiceSoapProxy serviceSoapProxy;

	private AirorderDAO airOrderDAO;

	private DromeCodeDAO dromeCodeDAO;

	public DromeCodeDAO getDromeCodeDAO() {
		return dromeCodeDAO;
	}

	public void setDromeCodeDAO(DromeCodeDAO dromeCodeDAO) {
		this.dromeCodeDAO = dromeCodeDAO;
	}

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

	// 获得机场列表
	public HashMap<String, String> findCityMap() {
		HashMap<String, String> cityMap = new HashMap<String, String>();

		ArrayList<DromeCode> dromeCodeList = (ArrayList<DromeCode>) dromeCodeDAO
				.findAll();
		for (DromeCode dromeCode : dromeCodeList) {
			cityMap.put(dromeCode.getId().getDromeCode(), dromeCode.getId()
					.getAirDrome());
		}
		return cityMap;
	}


	public ArrayList<HashMap> selectAirTickets(String name, String pwd,
			String fromcity, String tocity, String airdate, String airtime,
			String airco, boolean isdirect, boolean ishideshared) {

		ArrayList<HashMap> ticketsList = new ArrayList<HashMap>();

		// _ServiceSoapProxy proxy = new _ServiceSoapProxy();
		GetFlightDataSetResponseGetFlightDataSetResult result = null;
		try {
			result = serviceSoapProxy
			// .getFlightDataSet("test1", "12345AB", "HGH", "DLC",
					// "2008-07-28", "00:00", "", true, true);
					.getFlightDataSet(name, pwd, fromcity, tocity, airdate,
							airtime, airco, isdirect, ishideshared);
		} catch (RemoteException e) {
			// TODO 自动生成 catch 块
			// e.printStackTrace();
			throw new ETicketException("查询机票机票异常！--TBI接口getFlightDataSet方法异常！",
					e);
		}

		// getFlightDataSet接口返回null时候,直接返回
		if (result == null) {
			return ticketsList;
		}
		MessageElement root = result.get_any()[1];

		log.info(root.toString());
		NodeList diffgram = root.getChildNodes();
		NodeList data = null;
		NodeList flight = null;
		Node flightNode = null;

		// 进行xml分析处理时候返回null,则直接返回
		if (diffgram == null) {
			return ticketsList;
		}
		for (int i = 0; i < diffgram.getLength(); ++i) {
			data = diffgram.item(i).getChildNodes();
			for (int j = 0; j < data.getLength(); ++j) {
				flight = data.item(j).getChildNodes();

				// 每条记录存放在一个新的Map中
				HashMap<String, String> hashMap = new HashMap<String, String>();

				// 无航班信息时返回长度为1，此时则不对返回信息进行处理
				if (flight.getLength() <= 1) {
					return ticketsList;
				}

				for (int k = 1; k <= flight.getLength(); ++k) {
					flightNode = flight.item(k);
					if (flightNode != null) {

						// 选择一个过期时间测试时候
						// flightNode.getChildNodes().item(0).getNodeValue()会抛出异常

						log.info(flightNode.getNodeName()
								+ ":"
								+ flightNode.getChildNodes().item(0)
										.getNodeValue());

						hashMap.put(flightNode.getNodeName(), flightNode
								.getChildNodes().item(0).getNodeValue());
					}

				}

				// 把每个Map放到存放到List中去
				ticketsList.add(hashMap);
				//分割线
				log.info("################################################");
			}
		}

		log.info("共查询 " + data.getLength() + " 个航班!");

		return ticketsList;

	}

	// 查询机票明细
	public ArrayList<HashMap> detailAirTicket(String userName, String passWord,
			String fromCity, String toCity, String carrier, String airNumber,
			String fromDate, String fromTime, String[] seatArr) {
		// _ServiceSoapProxy proxy = new _ServiceSoapProxy();
		// 利用fromDate和fromTime字符串构造Calendar类型参数
		Calendar airDate = Calendar.getInstance();
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-ddhh:mm");
		Date date = null;
		try {
			date = format.parse(fromDate + fromTime);
		} catch (ParseException e) {
			// TODO 自动生成 catch 块
			// e.printStackTrace();
			throw new ETicketException("查询机票机票明细异常！--时间显示格式化异常！", e);
		}
		airDate.setTime(date);
		// 机票详细信息结果集
		ArrayList<HashMap> detailList = new ArrayList<HashMap>();

		for (String seat : seatArr) {

			String tempResult = null;
			try {
				tempResult = serviceSoapProxy.getFlightFare(userName, passWord,
						fromCity, toCity, carrier, airNumber, airDate, seat);
			} catch (RemoteException e) {
				// TODO 自动生成 catch 块
				// e.printStackTrace();
				throw new ETicketException(
						"查询机票机票明细异常！--TBI接口getFlightFare方法异常！", e);
			}
			if (tempResult != null) {

				HashMap<String, String> hashMap = new HashMap<String, String>();

				hashMap.put("seat", seat);
				hashMap.put("fromCity", fromCity);
				hashMap.put("toCity", toCity);
				hashMap.put("airDate", fromDate);
				hashMap.put("airTime", fromTime);
				hashMap.put("airNumber", airNumber);
				// 航空公司和承运人是一个概念
				hashMap.put("airCo", carrier);

				String[] tempArr = tempResult.split("\\|");
				for (int i = 0; i < tempArr.length; ++i) {

					switch (i) {
					case 0:
						// 特价
						hashMap.put("specialOffer", tempArr[i]);
						break;
					case 1:
						// 价格
						hashMap.put("price", tempArr[i]);
						break;
					case 2:
						// 优惠价
						hashMap.put("preferentialPrice", tempArr[i]);
						break;
					case 3:
						// 返点
						hashMap.put("returnPoint", tempArr[i]);
						break;
					case 4:
						// 留钱
						hashMap.put("remainMoney", tempArr[i]);
						break;
					case 5:
						// 使用说明
						hashMap.put("direction", tempArr[i]);
						break;
					case 6:
						// 发布人
						hashMap.put("releaseMan", tempArr[i]);
						break;

					}
					// hashMap.put("seat", seat);
					// hashMap.put("specialOffer", tempStr);

				}
				// detailMap.put(seat, hashMap);
				detailList.add(hashMap);

			}

		}

		// return proxy.getFlightFare(userName, passWord, fromCity, toCity,
		// carrier, airNumber, airDate, seat);
		return detailList;
	}

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
	
//	public void test(Userinfo transientInstance){
//		airOrderDAO.save(transientInstance);
//	}
	
	

}
