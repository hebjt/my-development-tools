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
	$('textarea.editor').ckeditor();
	
	$('textarea.editor').val('${options.optContent}');
	
	$("#save").click(function(){
        var form_data = $("#form1").serialize()+'&time='+Math.random();
    	if(validate.form()){
	        $.ajax({ 
	            url: 'update_option.action', 
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
			optSeqNum:{
				required:true,
				az:true,
				stringMaxLength:1
			} 
		},
		messages: {
			optSeqNum: {
				required:"<span><font color='red'>不能为空</font></span>",
				az:"<span><font color='red'>只能输入英文字符A-Z</font></span>",
				stringMaxLength:"<span><font color='red'>字符长度不能大于1</font></span>"
			}
		}
	});
	
});
</script>
</head>
<body>
<!-- 添加选项 -->
<div id="create_zhhe" style="display:block; cursor: default">
<form id="form1" name="form1" id="form1" method="post">
	<input type="hidden" name="optId" id="optId" value="${options.optId}" />
	<input type="hidden" name="quesId" id="quesId" value="${options.quesId}" />
	<div id="outFrame">
	
		<div id="list">
		<div id="title" style="background-color:white; text-align:center;">修改选项</div>

				<table border="0" width="100%"  cellspacing="0">
					<tr>
						<td>
							题号：
						</td>
					
						<td>
							<input name="optSeqNum" id="optSeqNum" value="${options.optSeqNum}"/>
						</td>
					</tr>
					
					<tr>					
						<td>
							选项内容：
						</td>
						
						<td>
							<textarea cols="80" id="optContent" name="optContent" rows="5" class="editor">
							</textarea>
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