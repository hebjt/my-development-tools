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
    	$("#add_paper").click(function(){
    		window.location.href="add_paper.action";
    	});
    	
    });
    function operate(str, id, sign) {
    	if (str == 'paper_edit') {
    		window.location.href="edit_paper.action?paper_id="+id;
    		//alert(id);
    	}else if(str=='paper_del'){
    		var r = confirm("确定要删除这个试卷吗?");
    		if(r){
        		$.ajax({
        			type: "POST",
        			async:false,
        			url: "del_paper.action?paper_id="+id+"&time="+Math.random(),
        			data: "",
        			context: document.body,
        			success: function(data){
        	            if(data=="success"){
        	            	window.location.reload();
        	            }else{
        	            	alert("不能删除此试卷！");
        	            }
        			}
        		});
    			
    		}
    	}else if(str=='paper_publish_paper'){
    		window.location.href="paper_publish.action?paper_id="+id;
    		//wopen("paper_publish.action?paper_id="+id,"", 800, 600);	
    	}else if(str=='paper_xml'){
    		$.blockUI({ message: "<h1>正在生成...</h1>" });
    		$.ajax({
    			type: "POST",
    			async:false,
    			url: "paper_xml.action?paper_id="+id+"&time="+Math.random(),
    			data: "",
    			context: document.body,
    			success: function(data){
    	            if(data=="success"){
    	            	$.unblockUI();
    	            	alert("生成成功！");
    	            }else{
    	            	$.unblockUI();
    	            	alert("生成失败！");
    	            }
    			}
    		});
    		 
    	}
    	
    }
	function reQuery() {
		window.location.reload();
	}
    </script>
</head>
<body>
<div id="outFrame">
	<div id="list">
		<div id="title" style="background-color:white;">HSKMock模拟考试-试卷列表－[ 共 ${RowCount} 条记录 ]</div>
		<div id="topBar">
			<span id="right"><input type="button" name="add_paper" id="add_paper" value="添加" /></span>
		</div>
		<table cellspacing="0">
			<tr>
				<th>科目名称</th>
				<th>试卷名称</th>
				<th>听力文件</th>
				<th>创建时间</th>
				<th>试题数量</th>
				<th>答题时间</th>
				<th>试卷试题</th>
				<th>发布</th>
				<th>生成XML</th>
				<th>操作</th>
			</tr>
			<c:forEach items="${paperList}" var="item">
				<c:set value="${item.paperListeningFile}" var="target"></c:set>
				<c:set value="${fn:split(target,'/')}" var="obj"></c:set>
				<tr>
					<td><c:out value="${item.subject.subject_name}"></c:out></td>
					<td><c:out value="${item.paperName}"></c:out></td>
					<td><div title="${item.paperListeningFile}"><c:out value="${obj[5]}"></c:out></div></td>
					<td><fmt:formatDate value="${item.paperCreateTime}" type="date"></fmt:formatDate></td>
					<td><c:out value="${item.paperQuestionNum}"></c:out></td>
					<td><c:out value="${item.paperExamTime}"></c:out></td>
					<td><a href="questions_index.action?subject_id=${item.subject.subject_id}&paper_id=${item.paperId}"><img src="../images/ico4.gif" border="0" /></a></td>
					<td><a href="#" onclick="operate('paper_publish_paper','${item.paperId}')">发布</a></td>
					<td><a href="#" onclick="operate('paper_xml','${item.paperId}')">生成</a></td>
					<td colspan="2">
						<a href="#" onclick="operate('paper_edit','${item.paperId}')">修改</a>
						<a href="#" onclick="operate('paper_del','${item.paperId}')">删除</a>
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