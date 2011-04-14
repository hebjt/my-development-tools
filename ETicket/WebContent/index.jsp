<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title><s:text name="title"></s:text></title>
</head>
<body>
<s:a href="airTicketListAction!queryPage.action">机票查询</s:a>
<s:a href="userOprAction.action">注册</s:a>
<s:a href="userOprAction!loginPage.action">登陆</s:a>
<s:form action="testAction" method="POST">
	<s:actionmessage />
	<s:textfield name="id" label="%{getText('id')}"></s:textfield>
	<s:textfield name="name" label="%{getText('name')}"></s:textfield>
	<s:submit></s:submit>
</s:form>
</body>
</html>