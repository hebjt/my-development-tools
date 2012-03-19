<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>科目类型列表管理</title>
	<link rel="stylesheet" href="../css/admin.css">
    <script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
    <script type="text/javascript">
	    $(document).ready(function(){ 
	    	$("#add_subType").click(function(){
	    		window.location.href="add_subType.action";
	    	});
	    	
	    	$(".btn_del").click(function(){
	    		var delUrl = this.href;
				var urlArray = delUrl.split("?");
				if (confirm("确认要删除此科目类型？")){
		    		$.ajax({
						type: "POST",
						async:false,
						url: "findSubjectByType.action?",
						data: urlArray[1],
						context: document.body,
						success: function(msg){
							if("yes"==$.trim(msg)){
								alert("还有使用此科目类型的科目信息！");
								return;
							}else if("no"==$.trim(msg)){
								window.location.href=delUrl;
							}
						}
					});
	    		}
	    		return false;
	    	});
	    });
    </script>
</head>
<body>
<div id="outFrame">
	<div id="list">
		<div id="title">HSKMock 考试科目类型维护－[ 共  ${list_number} 条订单 ]</div>
		<div id="topBar">
			<span id="right"><input type="button" name="add_subType" id="add_subType" value="添 加" /></span>
		</div>
		<table cellspacing="0" border="0">
			<tr>
				<th>科目类型编码</th>
				<th>科目类型名称</th>
				<th colspan="2">操作</th>
			</tr>
			<c:forEach items="${type_list}" var="item">
				<tr>
					<td><c:out value="${item.sub_type_id}"></c:out></td>
					<td><c:out value="${item.sub_type_name}"></c:out></td>
					<td><a href="showEdit_subType.action?subType_id=${item.sub_type_id}">修改</a></td>
					<td><a href="del_subType.action?sub_type_id=${item.sub_type_id}" class="btn_del">删除</a></td>
				</tr>
			</c:forEach>
		</table>
	</div>
	<div id="TbottomBar">
		<span id="right">&nbsp;</span>
	</div>
</div>
</body>
</html>