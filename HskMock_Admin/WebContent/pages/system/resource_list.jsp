<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="../css/admin.css">
<title>Insert title here</title>
 <script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
 <script src="../js/jquery.blockUI.js" type="text/javascript"></script>
 <script src="../js/common.js" type="text/javascript"></script>
 <script type="text/javascript">
	 $(document).ready(function(){ 
	 	
	 });
 </script>
<title>Insert title here</title>
</head>
<body>
<div id="outFrame">
	<div id="list">
		<div id="title" style="background-color:white;">HSKMock模拟考试-系统资源列表－[ 共 ${RowCount} 条记录 ]</div>
		<div id="topBar">
			<span id="right"><input type="button" name="add_paper" id="add_paper" value="添加" /></span>
		</div>
		<table cellspacing="0">
			<tr>
				<th>资源序号</th>
				<th>资源类型</th>
				<th>资源值</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${res}" var="item">
				<tr>
					<td><c:out value="${item.resId}"></c:out></td>
					<td><c:out value="${item.resType}"></c:out></td>
					<td><c:out value="${item.resValue}"></c:out></td>
					<td>
						<a href="#" onclick="operate('paper_edit','${item.resId}')">修改</a>
						<a href="#" onclick="operate('paper_del','${item.resId}')">删除</a>
					</td>
				</tr>
			</c:forEach>
		</table>
		<div id="TbottomBar">
			<span id="right" class="page_and_btn">${page.pageStr }</span>			
		</div>
	</div>
</div>
</body>
</html>