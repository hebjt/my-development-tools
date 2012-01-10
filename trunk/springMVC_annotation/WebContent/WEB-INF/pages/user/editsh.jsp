<%@ page language="java" contentType="text/html; charset=GB18030"
    pageEncoding="GB18030"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GB18030">
<title>Insert title here</title>
</head>
<body>
<form action="editSave.action" name="form">
<table cellspacing="0" class="dataview">
		<tr>

			
			<td>name</td>
			<td>password</td>
			<td>state</td>
			
		</tr>
		<tr>
			<td><input type="hidden" name="id" id="id" value="${user.id}"/></td>
			<td><input type="text" name="name" id="name" value="${user.name}"/></td>
			<td><input type="text" value="${user.password}" name="password" id="password" /></td>
			<td><input type="text" name="state" id="state" value="${user.state}" /></td>
		</tr>
		<tr>
			<td colspan="3" align="center">
				<input type="submit" name="edsub" id="edsub" value="保存"/>
				<input type="reset" name="reset1" id="reset2" value="重置"/>
			</td>
			
		</tr>

</table>
</form>
</body>
</html>