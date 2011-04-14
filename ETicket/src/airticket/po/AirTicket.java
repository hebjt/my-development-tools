package airticket.po;

/**
 * @author guoyan
 * vo直接放到po包中，不另外建包
 */
public class AirTicket {

	private String airDate;
	private String goTime;
	private String toTime;
	private String airCo;
	private String airNumber;
	private String seat;
	private String fromCity;
	private String toCity;
	private String flightType;
	private String stop;
	private String food;
	private String et;
	private String isShared;
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
	public String getAirNumber() {
		return airNumber;
	}
	public void setAirNumber(String airNumber) {
		this.airNumber = airNumber;
	}
	public String getEt() {
		return et;
	}
	public void setEt(String et) {
		this.et = et;
	}
	public String getFlightType() {
		return flightType;
	}
	public void setFlightType(String flightType) {
		this.flightType = flightType;
	}
	public String getFood() {
		return food;
	}
	public void setFood(String food) {
		this.food = food;
	}
	public String getFromCity() {
		return fromCity;
	}
	public void setFromCity(String fromCity) {
		this.fromCity = fromCity;
	}
	public String getGoTime() {
		return goTime;
	}
	public void setGoTime(String goTime) {
		this.goTime = goTime;
	}
	public String getIsShared() {
		return isShared;
	}
	public void setIsShared(String isShared) {
		this.isShared = isShared;
	}
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	public String getStop() {
		return stop;
	}
	public void setStop(String stop) {
		this.stop = stop;
	}
	public String getToCity() {
		return toCity;
	}
	public void setToCity(String toCity) {
		this.toCity = toCity;
	}
	public String getToTime() {
		return toTime;
	}
	public void setToTime(String toTime) {
		this.toTime = toTime;
	}
	
}
