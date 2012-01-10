<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../script/jquery-1.7.1.js"></script>
<script>
$(document).ready(function() {
	$.ajax({
		  url: "ajax",
		  context: document.body,
		  success: function(data){
		    alert(data);
		  }
	});
});
</script>
</head>
<body>

<table cellspacing="0" class="dataview">
<tr><td><input type="button" name="" id="" value="添加"/></td></tr>
	<tr>
		<th>ID</th>
		<th>Name</th>
		<th>password</th>
		<th>state</th>
		<th colspan="2">操作</th>
	</tr>
	<c:forEach items="${list}" var="item">
		<tr>

			<td><c:out value="${item.id}"></c:out></td>
			<td><c:out value="${item.name}"></c:out></td>
			<td><c:out value="${item.password}"></c:out></td>
			<td><c:out value="${item.state}"></c:out></td>
			<td><a href="edit.action?id=${item.id}">修改</a></td>
			<td><a href="del.action?id=${item.id}">删除</a></td>
		</tr>
	</c:forEach>
</table>
<img alt="" src="../images/flink_1.png" />
</body>
</html>