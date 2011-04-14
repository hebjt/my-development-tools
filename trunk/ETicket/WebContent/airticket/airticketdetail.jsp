<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>机票详细信息</title>
<script language="javascript">
	function orderTickets(fromCity,toCity,airNumber,airDate,airTime,seat,airCo){
		var form = document.forms[0];
		document.getElementById("fromCityHide").value = fromCity;	
		document.getElementById("toCityHide").value = toCity;	
		document.getElementById("airNumberHide").value = airNumber;	
		document.getElementById("airDateHide").value = airDate;	
		document.getElementById("airTimeHide").value = airTime;	
		document.getElementById("seatHide").value = seat;	
		document.getElementById("airCoHide").value = airCo;	
//		form.target = "_order";
		form.submit();
	}
	
</script>
</head>
<body>
<s:form action="airTicketOprAction!orderTickets" method="POST">
<table border="1">
	<tr>
		<td>舱位</td>
		<td>特价</td>
		<td>价格</td>
		<td>优惠价</td>
		<td>返点</td>
		<td>留钱</td>
		<td>使用说明</td>
		<td>发布人</td>
		<td>订票</td>

		<!--td><s:text name="airticket.airnumber"/></td>
<td><s:text name="airticket.flighttype"/></td>
<td><s:text name="airticket.airdate"/></td>
<td><s:text name="airticket.gotime"/></td>
<td><s:text name="airticket.totime"/></td>
<td><s:text name="airticket.airco"/></td>
<td><s:text name="airticket.seat"/></td>
<td><s:text name="airticket.fromcity"/></td>
<td><s:text name="airticket.tocity"/></td>
<td><s:text name="airticket.stop"/></td>
<td><s:text name="airticket.food"/></td>
<td><s:text name="airticket.et"/></td-->
	</tr>
	<s:iterator value="detailList" id="hashMap">
		<tr>
			<td><s:property value="#hashMap.seat" />&nbsp</td>
			<td><s:property value="#hashMap.specialOffer" />&nbsp</td>
			<td><s:property value="#hashMap.price" />&nbsp</td>
			<td><s:property value="#hashMap.preferentialPrice" />&nbsp</td>
			<td><s:property value="#hashMap.returnPoint" />&nbsp</td>
			<td><s:property value="#hashMap.remainMoney" />&nbsp</td>
			<td><s:property value="#hashMap.direction" />&nbsp</td>
			<td><s:property value="#hashMap.releaseMan" />&nbsp</td>
			<td><input type="button" value="订票" onclick="orderTickets('${hashMap.fromCity}','${hashMap.toCity}','${hashMap.airNumber}','${hashMap.airDate}','${hashMap.airTime}','${hashMap.seat}','${hashMap.airCo}')" />&nbsp</td>
		</tr>
	</s:iterator>

</table>
	<s:hidden name="fromCityHide" id="fromCityHide"></s:hidden>
	<s:hidden name="toCityHide" id="toCityHide"></s:hidden>
	<s:hidden name="airNumberHide" id="airNumberHide"></s:hidden>
	<s:hidden name="airDateHide" id="airDateHide"></s:hidden>
	<s:hidden name="airTimeHide" id="airTimeHide"></s:hidden>
	<s:hidden name="seatHide" id="seatHide"></s:hidden>
	<s:hidden name="airCoHide" id="airCoHide"></s:hidden>
	<s:hidden name="fromCity" id="fromCity" value="大连"></s:hidden>
	
</s:form>
<!--div id="blockWait" style="display:none;">正在处理，请稍候...</div-->
<!--iframe src="select_type.htm" id="win_main" width="100%" height="600"></iframe-->
</body>
</html>
