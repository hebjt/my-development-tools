<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>用户登陆</title>
</head>
<body>
<h1>登陆</h1>
<s:form action="userOprAction!login" method="POST">
	<s:textfield name="username" label="%{getText('username')}"></s:textfield>
	<s:password name="pasword" label="%{getText('password')}"></s:password>
	<s:submit></s:submit>
</s:form>
<!--div id="blockWait" style="display:none;">正在处理，请稍候...</div-->
<!--iframe src="select_type.htm" id="win_main" width="100%" height="600"></iframe-->
</body>
</html>