<%@ page contentType="text/html; charset=GBK"%>
<%@taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>��ҵ����J2EE������</title>
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
�������û�������������½<br>
<s:actionerror cssClass="error"/>
<s:form action="processLogin.action">
	<s:textfield name="username" label="�û���"/>
	<s:textfield name="password"  label="����"/>
	<s:textfield name="vercode" label="��֤��"/>
	<s:submit/>
</s:form>
��֤�룺<img name="checkImg" id="checkImg" src="authImg">������?<a href="#" onClick="refresh()">ˢ��</a>
</td>
</tr>
</table>
</center>
</body>
</html>