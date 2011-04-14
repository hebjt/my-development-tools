<%@ page contentType="text/html; charset=GBK"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>商业拍卖J2EE程序框架</title>
<script type="text/javascript">
	function refresh(){
		document.getElementById("checkImg").src='authImg?now='+new Date();
	}
</script>
</head>
<body>
<center>
<TABLE width="780" align="center" CELLSPACING=0 background="images/bodybg.jpg" height="560">

<tr>
<td align="center" valign="top">
请输入用户名和密码来登陆<br>
<s:actionerror cssClass="error"/>
<s:form action="processLogin.action">
	<s:textfield name="username" label="用户名"/>
	<s:textfield name="password"  label="密码"/>
	<s:textfield name="vercode" label="验证码"/>
	<s:submit/>
</s:form>
验证码：<img name="checkImg" id="checkImg" src="authImg">看不清?<a href="#" onClick="refresh()">刷新</a>
</td>
</tr>
</table>
</center>
</body>
</html>