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
<title>学生管理</title>
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function(){ 
    	
    });
    </script>
</head>
<body>
<div id="outFrame">
	<div id="view">
		
		<div id="topBar">添加学生信息</div>
		<form action="save_user.action" name="form1" method="POST">
		<table cellspacing="0" border="1">
			<tr>
				<th>ID</th><td><c:out value="${item.user_id}"></c:out></td></tr>
			<tr>
				<th>用户名</th><td><input type="text" name="user_name" id="user_name" value="${item.user_name}"/></td></tr>
			<tr>
				<th>真实姓名</th><td><input type="text" name="user_realname" id="user_realname" value="${item.user_realname}"/></td></tr>
			<tr>
				<th>英文名Family Name</th><td><input type="text" name="user_family_name" id="user_family_name" value="${item.user_first_name}"/></td></tr>
			<tr>
				<th>英文名First Name</th><td><input type="text" name="user_first_name" id="user_first_name" value="${item.user_last_name}"/></td></tr>
			
			<tr>
				<th>中文名</th><td><input type="text" name="user_cn_name" id="user_cn_name" value="${item.user_cn_name}"/></td></tr>
			<tr>
				<th>性别</th><td><input type="text" name="user_sex" id="user_sex" value="${item.user_sex}"/></td></tr>
			<tr>
				<th>生日</th><td><input type="text" name="user_birthday" id="user_birthday" value="${item.user_birthday}"/> </td></tr>
			<tr>
				<th>固定电话</th><td><input type="text" name="user_phone" id="user_phone" value="${item.user_phone}"/></td></tr>
			<tr>
				<th>移动电话</th><td><input type="text" name="user_cellphone" id="user_cellphone" value="${item.user_cellphone}"/></td></tr>
			
			<tr>
				<th>邮箱</th><td><input type="text" name="user_email" id="user_email" value="${item.user_email}"/></td></tr>
			<tr>
				<th>地址</th><td><input type="text" name="user_address" id="user_address" value="${item.user_address}"/></td></tr>
			<tr>
				<th>详细地址</th><td><input type="text" name="user_address_detail" id="user_address_detail" value="${item.user_address_detail}"/></td></tr>
			<tr>
				<th>邮编</th><td><input type="text" name="user_zip" id="user_zip" value="${item.user_zip}"/></td></tr>
			
			
		</table>
	    
		<div id="bottomBar">
			<input class="button" type="submit" name="btn_submit" value="提交" />
			<input class="button" type="button" name="btn_reset" value="返回" onclick="javascript:history.back()" />
		</div>	</form>
	</div>

</div>
</body>
</html>