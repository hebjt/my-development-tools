<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title><s:text name="airticket.title"></s:text></title>
</head>
<body>
<s:form action="airTicketListAction!selectAirTickets" method="POST"
	id="selectTicket">
	<s:actionmessage />
	<s:select list="cityMap" label="%{getText('airticket.fromcity')}"
		name="fromCity"></s:select>
	<s:select list="cityMap" label="%{getText('airticket.tocity')}"
		name="toCity"></s:select>
	<s:textfield name="airDate" label="%{getText('airticket.airdate')}"></s:textfield>
	<s:textfield name="airTime" label="%{getText('airticket.airtime')}"></s:textfield>
	<s:textfield name="airCo" label="%{getText('airticket.airco')}"></s:textfield>
	<s:select list="boolMap" name="isDirect"
		label="%{getText('airticket.isdirect')}"></s:select>
	<s:select list="boolMap" name="isHideShared"
		label="%{getText('airticket.ishideshared')}"></s:select>

	<s:submit value="%{getText('airticket.select')}"></s:submit>
</s:form>
</body>
</html>
