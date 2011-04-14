<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><s:text name="airticket.title"></s:text></title>
<script language="javascript">
function detail(fromCity,toCity,airCo,airNumber,airDate,airTime,seat){
	var form = document.getElementById("detailTicket");
//	form.action = "airTicketAction!detailTicket.action?fromCity="+fromCity+"&toCity="+toCity+"&airCo="+airCo+"&airNumber="+airNumber+"&airDate="+airDate+"&airTime="+airTime+"&seat="+seat;
	document.getElementById("fromCityHide").value = fromCity;	
	document.getElementById("toCityHide").value = toCity;	
	document.getElementById("airCoHide").value = airCo;	
	document.getElementById("airNumberHide").value = airNumber;	
	document.getElementById("airDateHide").value = airDate;	
	document.getElementById("airTimeHide").value = airTime;	
	document.getElementById("seatHide").value = seat;	
	form.target = "_detail";
//	alert(airDate);
	form.submit();
//	form.action = "airTicketAction!detailTicket";
	//detailTicket
	//selectAirTickets
//	window.
	
}
</script>
</head>
<body>

<s:form action="airTicketListAction!detailTicket" id="detailTicket"
	method="POST">
	<s:set name="index" value="0"></s:set>
	<table border="1">
		<tr>
			<!--td>航班号</td>
<td>飞机型号</td>
<td>航班起飞日期</td>
<td>航班起飞时间</td>
<td>航班到达时间</td>
<td>航空公司</td>
<td>舱位</td>
<td>出发城市</td>
<td>到达城市</td>
<td>是否经停</td>
<td>是否饭食</td>
<td>是否支持电子客票</td-->
			<td>序号</td>
			<td><s:text name="airticket.airnumber" /></td>
			<td><s:text name="airticket.flighttype" /></td>
			<td><s:text name="airticket.airdate" /></td>
			<td><s:text name="airticket.gotime" /></td>
			<td><s:text name="airticket.totime" /></td>
			<td><s:text name="airticket.airco" /></td>
			<td><s:text name="airticket.seat" /></td>
			<td><s:text name="airticket.fromcity" /></td>
			<td><s:text name="airticket.tocity" /></td>
			<td><s:text name="airticket.stop" /></td>
			<td><s:text name="airticket.food" /></td>
			<td><s:text name="airticket.et" /></td>
			<td>明细</td>
		</tr>
		<s:iterator value="ticketsList" id="hashMap">
			<s:set name="index" value="#index+1"></s:set>
			<tr>
				<td><s:property value="#index" /></td>
				<td><s:property value="#hashMap.AirNumber" />&nbsp</td>
				<td><s:property value="#hashMap.FlightType" />&nbsp</td>
				<!--td><s:property value="#hashMap.AirDate" />&nbsp</td-->
				<td><s:property value="airDate" />&nbsp</td>
				<td><s:property value="#hashMap.goTime" />&nbsp</td>
				<td><s:property value="#hashMap.toTime" />&nbsp</td>
				<td><s:property value="#hashMap.AirCo" />&nbsp</td>
				<td><s:property value="#hashMap.Seat" />&nbsp</td>
				<td><s:property value="#hashMap.FromCity" />&nbsp</td>
				<td><s:property value="#hashMap.ToCity" />&nbsp</td>
				<td><s:property value="#hashMap.Stop" />&nbsp</td>
				<td><s:property value="#hashMap.Foot" />&nbsp</td>
				<td><s:property value="#hashMap.ET" />&nbsp</td>

				<td><!--a onMouseOver='window.status="http://www.colorstar.com";
return true;' onMouseOut='window.status="Done"; return true;'
 href='./airTicketAction!detailTicket.action?fromCity=${hashMap.FromCity}&toCity=${hashMap.FromCity}&airCo=${hashMap.AirCo}&airNumber=${hashMap.AirNumber}&airDate=${hashMap.AirDate}&airTime=${hashMap.goTime}&seat=${hashMap.Seat}' target="_blank">明细</a-->
				
				
				<!-- input type="button" value="明细"
					onclick="detail('${hashMap.FromCity}','${hashMap.ToCity}','${hashMap.AirCo}','${hashMap.AirNumber}','${hashMap.AirDate}','${hashMap.goTime}','${hashMap.Seat}')" /-->
				
				<input type="button" value="明细"
					onclick="detail('${hashMap.FromCity}','${hashMap.ToCity}','${hashMap.AirCo}','${hashMap.AirNumber}','<s:property value="airDate" />','${hashMap.goTime}','${hashMap.Seat}')" />
				
				</td>
			</tr>
		</s:iterator>
	</table>
	<s:hidden name="fromCityHide" id="fromCityHide"></s:hidden>
	<s:hidden name="toCityHide" id="toCityHide"></s:hidden>
	<s:hidden name="airCoHide" id="airCoHide"></s:hidden>
	<s:hidden name="airNumberHide" id="airNumberHide"></s:hidden>
	<s:hidden name="airDateHide" id="airDateHide"></s:hidden>
	<s:hidden name="airTimeHide" id="airTimeHide"></s:hidden>
	<s:hidden name="seatHide" id="seatHide"></s:hidden>
</s:form>
<!--div id="blockWait" style="display:none;">正在处理，请稍候...</div-->
<iframe name="_detail" id="win_main" width="100%" height="300"></iframe>
</body>
</html>
