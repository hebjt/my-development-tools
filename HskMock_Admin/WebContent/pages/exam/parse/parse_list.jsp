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
<title>解析列表</title>
<style type="text/css">

body {
	background-image: url(../images/rightbg.jpg);
}

.STYLE1 {
	color: #FF0000
}

fieldset {
    padding:5px;
    margin:5px;
    width:97%;
    color:#333; 
    border:#06c groove 2px;
    /*border:#06c dashed 1px;虚线*/
} 
fieldset.inner{
    padding:5px;
    margin:5px;
    width:95%;
    color:#333; 
    border:#06c dashed 2px;
    

}
legend {
    color:#06c;
    font-weight:800; 
    background:#fff;
} 
/* 字体带边框*/
legend.grooveborder{
	width:80px;
	border:2px groove #06c;
	background-color:#fff;
	text-align:center;
	font-family:arial;
	padding:2px;
	margin:2px;
	font-weight:bold;

}
/*虚线边框*/
legend.dashedborder{
	width:80px;
	border:2px dashed #06c;
	background-color:#fff;
	text-align:center;
	font-family:arial;
	padding:2px;
	margin:2px;
	font-weight:bold;

}


ul {
    list-style-type: none;
    margin:8px 0 4px 0;
} 
li {
    margin-top:4px;
}


</style>
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/jquery.blockUI.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
<script src="../js/common.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//添加分类
        $('#save_zhhe_cancle').click(function() { 
            $.unblockUI(); 
            return false; 
        });
 

	});
		function isInteger(str){
			if(/^-?\d+$/.test(str)){
				return true;
			}
			return false;
		}
	
		function operate(str, id, sign) {
			if (str == 'parse_add') {
				//新增
				var paperId = $("#paperId").val();
				var structId=$("#structId").val();
				var url="quesId=" + id+"&paperId="+paperId+"&structId="+structId;
				wopen("parse_add.action?"+url,"", 800, 600);
			} else if (str == "parse_edit") {
				//修改
				var url="parseId=" + id;
				wopen("parse_edit.action?"+url,"", 800, 600);
			} else if (str == "parse_del") {
				//删除
				var r = confirm("确定要删除这条数据吗?");
				if(r){
					$.ajax({ 
		                url: 'del_parse.action', 
		                type:'POST',
		                data:{parseId:id,time:Math.random()},
		                success: function(data) { 
		                    //alert(data);
		                    if(data=="success"){
		                    	reQuery();
		                    }		
		                } 
		            });
				}
			} else if(str=="parse_detail"){
				var url="parseId=" + id;
				if(sign=='txt'){
					wopen("parse_detail.action?"+url,"", 800, 550);
				}else{
					//parse_video
					wopen("parse_video.action?"+url,"", 480, 380);
					//alert("video");
				}
				
			}
		}
		function reQuery() {
			window.location.reload();
		}

	</script>
</head>

<body style="overflow-x: hidden">
<form name="form1" id="form1">
<input type="hidden" name="paperId" id="paperId" value="${paperId}" />
<input type="hidden" name="structId" id="structId" value="${structId}" />
<c:if test="${level==3}">
<div>
<fieldset>
<legend class="grooveborder">试卷解析</legend>
	<label></label>
	<c:forEach items="${treeNode}" var="item">
		<fieldset class="inner">
			<legend class="dashedborder">试题</legend>
				<table cellpadding="0" cellspacing="0" border="0">
						<c:set value="${item.quesContent}" var="target"></c:set>
						<c:set value="<p>" var="obj"></c:set>
						<tr><td align="left">${item.quesNum}${fn:replace(target,obj,'')}</td></tr>
						<tr>
							<td align="left">
								<input type="button" value="添加解析" onclick="operate('parse_add','${item.quesId}')" />
							</td>
						</tr>
						<tr>
							<td align="left">
							<div id="outFrame">
							<div id="list">
								<table cellspacing="0">
									<tr>
										<th>解析类别</th>
										<th>查看详细</th>
										<th>编辑</th>
									</tr>
										<c:set value="${item.questionParse}" var="parseLength"/>
										<c:forEach items="${item.questionParse}" var="parse">
										
											<c:choose>
												<c:when test="${fn:length(parseLength)>0 and parse.parseId!=null}">
													<tr>
														<c:if test="${parse.parseType=='txt'}"><td>文字</td></c:if>
														<c:if test="${parse.parseType=='video'}"><td>视频</td></c:if>
														<td><a href="#" onclick="operate('parse_detail','${parse.parseId}','${parse.parseType}')">查看</a></td>
														<td>
															<input type="button" value="修改" onclick="operate('parse_edit','${parse.parseId}')" />
															<input type="button" value="删除" onclick="operate('parse_del','${parse.parseId}')" />
														</td>
													</tr>
												</c:when>
												<c:otherwise>
													<tr>
														<td colspan="3">无数据</td>
													</tr>
												</c:otherwise>
											</c:choose>
										</c:forEach>
								</table>
							</div>
							</div>
						</td>
					</tr>
				</table>
		</fieldset>
	</c:forEach>
</fieldset>
</div>	
</c:if>
</form>			
</body>


</html>