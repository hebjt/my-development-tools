<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/main.css">
<title>学生管理</title>
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function(){ 
    	$("#edit_user").click(function(){
    		window.location.href="user_edit.action";
    	});
    });
    </script>
</head>
<body>
<div id="outFrame">
	<div id="list">
		<div id="title" style="background-color:white;">HSKMock 学生管理</div>
		<div id="topBar"><a href="add_user.action">添加</a></div>
		<table cellspacing="0" border="1">
			<tr>
				<th>ID</th>
				<th>用户名</th>
				<th>真实姓名</th>
				<th>性别</th>
				<th>生日</th>
				<th>电话</th>
				<th>邮箱</th>
				<th>地址</th>
				<th>详细地址</th>
				<th>邮编</th>
				<th>注册日期</th>

				<th colspan="2">操作</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td><c:out value="${item.user_id}"></c:out></td>
					<td><c:out value="${item.user_name}"></c:out></td>
					<td><c:out value="${item.user_realname}"></c:out></td>
				<td><c:out value="${item.user_sex}"></c:out></td>
				<td><fmt:formatDate value="${item.user_birthday}" type="date"/> </td>
				<td><c:out value="${item.user_phone}"></c:out></td>
				<td><c:out value="${item.user_email}"></c:out></td>
				<td><c:out value="${item.user_address}"></c:out></td>
				<td><c:out value="${item.user_address_detail}"></c:out></td>
				<td><c:out value="${item.user_zip}"></c:out></td>
				<td><fmt:formatDate value="${item.user_regtime}" type="both"/></td>
					<td><a href="user_edit.action?user_id=${item.user_id}">修改</a></td>
					<td><a href="user_del.action?user_id=${item.user_id}">删除</a></td>
				</tr>
			</c:forEach>
		</table>
		<div class="page_and_btn">
			${page.pageStr }
		</div>
	</div>
	
	 
</div>
</body>
</html>