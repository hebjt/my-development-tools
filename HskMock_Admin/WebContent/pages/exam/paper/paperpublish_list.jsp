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
    <script src="../js/common.js" type="text/javascript"></script>
    <script type="text/javascript">
    $(document).ready(function(){ 
    
    	
    });
    function operate(str, id, sign) {
    	if (str == 'publish_edit') {
			var url="publishId=" + id;
			wopen("publish_edit.action?"+url,"", 800, 600);
    	}else if(str=='publish_del'){
    		var r = confirm("确定要删除这个试卷吗?");
    		if(r){
        		$.ajax({
        			type: "POST",
        			async:false,
        			url: "publish_del.action?publish_id="+id+"&time="+Math.random(),
        			data: "",
        			context: document.body,
        			success: function(data){
        	            if(data=="success"){
        	            	reQuery();
        	            }else{
        	            	alert("不能删除此试卷！");
        	            }
        			}
        		});
    			
    		}

    		
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
		<div id="title" style="background-color:white;">HSKMock模拟考试-试卷发布列表－[ 共 ${RowCount} 条记录 ]</div>
		<div id="topBar">
			<span id="right"></span>
		</div>
		<table cellspacing="0">
			<tr>
				<th>发布名称</th>
				<th>试题价格</th>
				<th>创建时间</th>
				<th>解析</th>
				<th>阅卷</th>
				<th>状态</th>
				<th>修改</th>
			</tr>
			<c:forEach items="${publish}" var="item">
				<tr>
					<td><c:out value="${item.publishName}"></c:out></td>
					<td><c:out value="${item.publishPaperPrice}"></c:out></td>
					<td><fmt:formatDate value="${item.publishTime}" type="date"></fmt:formatDate></td>
					<c:choose>
					<c:when test="${item.publishHaveParse=='1'}">
						<td>有</td>
					</c:when>
					<c:otherwise>
						<td>无</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${item.publishHaveRead=='1'}">
						<td>有</td>
					</c:when>
					<c:otherwise>
						<td>无</td>
					</c:otherwise>
					</c:choose>
					<c:choose>
					<c:when test="${item.paperPubStatusId=='1'}">
						<td>启用</td>
					</c:when>
					<c:otherwise>
						<td>禁用</td>
					</c:otherwise>
					</c:choose>
					<td>
						<input type="button" name="" id="" value="修改" onclick="operate('publish_edit','${item.publishId}')"/>
						<%-- <input type="button" name="" id="" value="删除" onclick="operate('publish_del','${item.publishId}')"/> --%>
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