package airticket.action;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;

import airticket.service.AirTicketListService;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author guoyan 查询机票处理
 */
@SuppressWarnings("serial")
public class AirTicketListAction extends ActionSupport {

	private AirTicketListService airTicketListService;

	private HashMap<String, String> cityMap = new HashMap<String, String>();

	private HashMap<String, String> boolMap = new HashMap<String, String>();

	private String isDirect;

	private String isHideShared;

	private ArrayList<HashMap> ticketsList;

	private String fromCity;

	private String toCity;

	private String airDate;

	private String airTime;

	private String airCo;

	// 机票详细内容结果集
	private ArrayList<HashMap> detailList;

	// 查询明细-接受隐藏域参数

	private String fromCityHide;

	private String toCityHide;

	private String airCoHide;

	private String airNumberHide;

	private String airDateHide;

	private String airTimeHide;

	private String seatHide;

	private static final Log log = LogFactory.getLog(AirTicketOprAction.class);

	/**
	 * 初始化并返回查询条件页面
	 */
	public String queryPage() {
		//test
		log.info(this);
		log.info(airTicketListService);
		log.info(airTicketListService.getAirOrderDAO());
		cityMap = airTicketListService.findCityMap();
		boolMap.put("1", "是");
		boolMap.put("0", "否");
		return SUCCESS;
	}
	
//	public String queryPage() {
//		Userinfo user = new Userinfo();
//		Userscore score = new Userscore();
////		UserinfoDAO userDAO = new UserinfoDAO();
//		
//		user.setUserid(999L);
//		user.setUsername("999");
//		score.setScoreid("999");
//		user.getUserscores().add(score);
////		userDAO.save(user);
//		airTicketListService.test(user);
//		return SUCCESS;
//	}

	// 查询飞机票
	@SuppressWarnings("unchecked")
	public String selectAirTickets() {

		// 初始化

		boolean isDirectFlag;
		boolean isHideSharedFlag;
		if ("0".equals(isDirect))
			isDirectFlag = false;
		else
			isDirectFlag = true;
		if ("0".equals(isHideShared))
			isHideSharedFlag = false;
		else
			isHideSharedFlag = true;

		try {

			ticketsList = airTicketListService.selectAirTickets(this
					.getText("tbi.username"), this.getText("tbi.password"),
					fromCity, toCity, airDate, airTime, airCo, isDirectFlag,
					isHideSharedFlag);

		} catch (Exception e) {

			e.printStackTrace();

		}

		if (ticketsList != null)
			for (HashMap hashMap : ticketsList) {
				log.info(hashMap);
			}

		return "airticketlist";
	}

	@SuppressWarnings("unchecked")
	public String detailTicket() {

		// *无或1个数字1个
		String regex = "\\*?\\d";
		String[] seatArr = seatHide.split(regex);

		detailList = airTicketListService.detailAirTicket(this
				.getText("tbi.username"), this.getText("tbi.password"),
				fromCityHide, toCityHide, airCoHide, airNumberHide,
				airDateHide, airTimeHide, seatArr);
		log.info(detailList);

		return "detail";
	}

	@Override
	public String execute() {
		// queryPage();
		return null;
	}

	public HashMap<String, String> getCityMap() {
		return cityMap;
	}

	public void setCityMap(HashMap<String, String> cityMap) {
		this.cityMap = cityMap;
	}

	public AirTicketListService getAirTicketListService() {
		return airTicketListService;
	}

	public void setAirTicketListService(
			AirTicketListService airTicketListService) {
		this.airTicketListService = airTicketListService;
	}

	public String getAirCo() {
		return airCo;
	}

	public void setAirCo(String airCo) {
		this.airCo = airCo;
	}

	public String getAirDate() {
		return airDate;
	}

	public void setAirDate(String airDate) {
		this.airDate = airDate;
	}

	public String getAirTime() {
		return airTime;
	}

	public void setAirTime(String airTime) {
		this.airTime = airTime;
	}

	public String getFromCity() {
		return fromCity;
	}

	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}

	public String getIsDirect() {
		return isDirect;
	}

	public void setIsDirect(String isDirect) {
		this.isDirect = isDirect;
	}

	public String getIsHideShared() {
		return isHideShared;
	}

	public void setIsHideShared(String isHideShared) {
		this.isHideShared = isHideShared;
	}

	public ArrayList<HashMap> getTicketsList() {
		return ticketsList;
	}

	public void setTicketsList(ArrayList<HashMap> ticketsList) {
		this.ticketsList = ticketsList;
	}

	public String getToCity() {
		return toCity;
	}

	public void setToCity(String toCity) {
		this.toCity = toCity;
	}

	public HashMap<String, String> getBoolMap() {
		return boolMap;
	}

	public void setBoolMap(HashMap<String, String> boolMap) {
		this.boolMap = boolMap;
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

	public ArrayList<HashMap> getDetailList() {
		return detailList;
	}

	public void setDetailList(ArrayList<HashMap> detailList) {
		this.detailList = detailList;
	}

	public String getFromCityHide() {
		return fromCityHide;
	}

	public void setFromCityHide(String fromCityHide) {
		this.fromCityHide = fromCityHide;
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
}
