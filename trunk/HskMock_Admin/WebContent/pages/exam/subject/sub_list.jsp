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
<link rel="stylesheet" href="../css/admin.css">
<style type="text/css">

</style>
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function(){ 
    	$("#add_sub").click(function(){
    		window.location.href="add_sub.action";
    	});
    });
    function operate(str,id){
        if(str=="create"){
        	window.location.href="struct_create.action?subject_id="+id;
        	//wopen("struct_create.action","",800,400);    	
        }else if(str=="delete"){
        	document.listform.action="../subject/subject_delete.action";
    	    document.listform.submit();
        }else if(str=="edit"){
        	wopen("../subject/subject_edit.action?id="+id,"",800,400);  
        }else if(str=="list"){ 
        	document.listform.start.value=1;
        	document.listform.action = "../subject/subject_list.action";
    		document.listform.submit();
        }else if(str=="substrut_list"){
        	document.listform.action="../substrut/substrut_list.action?subject_id="+id;
        	document.listform.submit();
        }else if(str=="disable"){
        	//停用
        	document.listform.action="../subject/subject_disable.action";
        	document.listform.submit();
        }else if(str=="enabled"){
        	//启用
        	document.listform.action="../subject/subject_enabled.action";
        	document.listform.submit();
        }else if(str=="read"){
        	wopen("../subject/subject_read.action?id="+id,"",800,400);
        }
    }

</script>
</head>
<body>
<div id="outFrame">
	<div id="list">
		<div id="title" style="background-color:white;">HSKMock 考试科目维护－[ 共 ${RowCount} 条订单 ]</div>
		<div id="topBar">
			<span id="right"><input type="button" name="add_sub" id="add_sub" value="添加" /></span>		
		</div>
		<table cellspacing="0" border="0">
			<tr>
				<th>科目编码</th>
				<th>科目名称</th>
				<th>科目类型</th>
				<th>科目状态</th>
				<th>科目结构</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${list}" var="item">
				<tr>
					<td><c:out value="${item.subject_id}"></c:out></td>
					<td><c:out value="${item.subject_name}"></c:out></td>
					<td><c:out value="${item.subjectType.sub_type_name}"></c:out></td>
					<c:if test="${item.exam_status_id==0}">
						<td>禁用</td>
					</c:if>
					<c:if test="${item.exam_status_id==1}">
						<td>启用</td>
					</c:if>
					<td><a href="javascript:operate('create','${item.subject_id}')"><img src="../images/ico.gif" border="0" /></a></td>
					<td><a href="edit_sub.action?subject_id=${item.subject_id}">修改</a>
					<a href="del_sub.action?subject_id=${item.subject_id}">删除</a></td>
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