<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户信息</title>
</head>
<body>
<s:a href="userOprAction!logout.action">退出</s:a>
<br>
会员卡号码：
<s:property value="#session.userinfo.userid"></s:property>
<br>
用户名：
<s:property value="#session.userinfo.username"></s:property>
<br>
电子邮箱：
<s:property value="#session.userinfo.email"></s:property>
<br>
真实姓名：
<s:property value="#session.userinfo.truename"></s:property>
<br>
手机号码：
<s:property value="#session.userinfo.phone"></s:property>
<br>
</body>
</html>
