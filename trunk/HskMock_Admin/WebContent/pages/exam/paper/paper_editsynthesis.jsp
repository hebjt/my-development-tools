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
<link rel="stylesheet" href="../css/main.css">
<style type="text/css">
div#outFrame a:hover {
	color: #30559c;
	border-bottom: 0px solid #ff6000;
}
div#list table td{
	padding:3px;
	border-left:#eee solid 1px;
	border-top:#eee solid 1px;
	text-align:left;
	line-height:20px;
	font-size: 14px;
}
</style>
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/validation/jquery.validate.min.js" type="text/javascript"></script>
<script src="../js/validation/validate.ex.js" type="text/javascript"></script>
<script src="../js/validation/messages_cn.js" type="text/javascript"></script>
<script src="../js/jquery.blockUI.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
<script type="text/javascript">
var paper_id="${paperId}";
//config.filebrowserImageUploadUrl = 'upload.action?type=Images&paper_id=${paperId}';
$(document).ready(function() {
	//是否例题
	var example = "${ques.quesExampleSign}";
	if(example=='0'){
		//alert("0");
		$("#quesExampleSign0").attr("checked",true);
	}else{
		//alert("1");
		$("#quesExampleSign1").attr("checked",true);
	}
	//是否拖拽
	var drag = "${ques.quesDragSign}";
	if(drag=='00'){
		$("#quesDragSign00").attr("checked",true);
	}else if(drag=='01'){
		$("#quesDragSign01").attr("checked",true);
	}else{
		$("#quesDragSign11").attr("checked",true);
	}
	
	$('textarea.editor').ckeditor();
	$('textarea.editor').val('${ques.quesContent}');
	var sign = "${ques.quesType}";
	if(sign=="01"){
		$("#title").html("修改综合题");
	}else if(sign=="02"){
		$("#title").html("修改选择题");
	}else{
		$("#title").html("修改填空题");
	}
	$("#save").click(function(){
        var form_data = $("#form1").serialize()+'&time='+Math.random();
        //window.close();
        if(validate.form()){
	        $.ajax({ 
	            url: 'update_questions.action', 
	            type:'POST',
	            data:form_data,
	            complete: function() { 
	                //alert(data);
	        		window.close();
	        		opener.reQuery();
	            } 
	        });
        }
	});
	$("#save_cancle").click(function(){
		window.close();
	});
	var validate = $("#form1").validate({
		rules: {
			quesNum: {
				required:true
				//nd:true
				
			},
			quesListenUrl_2: {
				required: true
			},
			quesReadTime: {
				number:true
			},
			quesAnswerTime: {
				number:true
			}
		},
		messages: {
			quesNum: {
				required:"<span><font color='red'>不能为空</font></span>"
				//nd:"<span><font color='red'>只能输入数字！</font></span>"
			},

			quesListenUrl_2: {
				required: "<span><font color='red'>不能为空</font></span>"
				
			},
			quesReadTime: {
				number: "<span><font color='red'>请输入合法数字    </font></span>"
			},
			quesAnswerTime: {
				number: "<span><font color='red'>请输入合法数字    </font></span>"
			}
		}
		});
	
});
</script>
</head>
<body>
<!-- 添加综合 -->
<div id="create_zhhe" style="display:block; cursor: default">
<form id="form1" name="form1" id="form1" action="" method="post">
	<input type="hidden" name="paperId" id="paperId" value="${ques.paperId}" />
	<input type="hidden" name="quesType" id="quesType" value="${ques.quesType}" />
	<input type="hidden" name="quesTypeId" id="quesTypeId" value="${ques.quesTypeId}" />
	<input type="hidden" name="subjectStructId" id="subjectStructId" value="${ques.subjectStructId}" />
	<input type="hidden" name="quesId" id="quesId" value="${ques.quesId}" />
	<input type="hidden" name="quesListenUrl_1" id="quesListenUrl_1" value="${listenUrl}" />
	<div id="outFrame">
	
		<div id="list">
		<div id="title" style="background-color:white; text-align:center;"></div>

				<table border="0" width="100%"  cellspacing="0">
					<tr>
						<td>
							题号：
						</td>
					
						<td>
							<input name="quesNum" id="quesNum" value="${ques.quesNum}" />
						</td>
					</tr>
					
					<tr>					
						<td>
							题干内容：
						</td>
						
						<td>
							<textarea cols="80" id="quesContent" name="quesContent" rows="5" class="editor">
							</textarea>
						</td>
					</tr>
					<tr>
						<td>
							是否例题：
						</td>
						
						<td>
							<input type="radio" name="quesExampleSign" id="quesExampleSign1" value="1">是&nbsp;
							<input type="radio" name="quesExampleSign" id="quesExampleSign0" value="0">否
						</td>
					</tr>
					<tr>
						<td>
							是否拖拽：
						</td>
						
						<td>
							<input type="radio" name="quesDragSign" id="quesDragSign00" value="00">不拖拽&nbsp;
							<input type="radio" name="quesDragSign" id="quesDragSign01" value="01">部分拖拽&nbsp;
							<input type="radio" name="quesDragSign" id="quesDragSign11" value="11">全部拖拽
						</td>
					</tr>
					<tr style="display: ${listenstyle}">
						<td>
							听力文件名称：
						</td>
						
						<td>
							<input name="quesListenUrl_2" id="quesListenUrl_2" value="${listenName}"/>
							
						</td>
					</tr>

					<tr style="display: ${writestyle}">
						<td align="right" width="100">
							看题时间：
						</td>
					
						<td>
							<input name="quesReadTime" id="quesReadTime" value="${ques.quesReadTime}"/>分钟
						</td>
					</tr>
					<tr style="display: ${writestyle}">
						<td>
							答题时间：
						</td>
						
						<td>
							<input name="quesAnswerTime" id="quesAnswerTime" value="${ques.quesAnswerTime}" />分钟
						</td>
					</tr>
					<tr>
						<td>
							试题答案：
						</td>
						
						<td>
							<input name="quesAnswer" id="quesAnswer" value="${ques.quesAnswer}"/>
						</td>
					</tr>
				</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="保存"  id="save" />
			</span> 
			<span id="center">
				<input type="button" class="button" value="返回" id="save_cancle" />
			</span>
		</div>

	</div>
	
</form>
</div>		
</body>
</html>