<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加解析</title>
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
<script src="../js/jquery.blockUI.js" type="text/javascript"></script>
<script src="../js/validation/jquery.validate.min.js" type="text/javascript"></script>
<script src="../js/validation/validate.ex.js" type="text/javascript"></script>
<script src="../js/validation/messages_cn.js" type="text/javascript"></script>
<script type="text/javascript" src="../ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="../ckeditor/adapters/jquery.js"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script type="text/javascript">

var paper_id="${paperId}";
$(document).ready(function() {
	
	$('textarea.editor').ckeditor();
	var val = '${parse.parseContent}';
	$("#parseContent").val(val);

	$("#saveTxt_parse").click(function(){
		var form_data = $("#form1").serialize()+'&time='+Math.random();
        if(validate.form()){
            $.ajax({ 
                url: 'saveTxt_parse.action', 
                type:'POST',
                data:form_data,
                success: function(data) { 
                    //alert(data);
                    if(data=="success"){
                		window.close();
                		opener.reQuery();
                    }

                } 
            });
        }
	});
	$("#saveTxt_parse_cancle").click(function(){
		window.close();
	});
	
	
});
</script>
</head>
<body>
<!-- 添加解析 txt -->
<div id="add_parse">
<form id="form1" name="form1" method="post" action="">
	<div id="outFrame">
		<div id="list">
			<div id="title" style="background-color:white; text-align:center;">详细内容</div>
			<input type="hidden" name="paperId_txt" id="paperId_txt" value="${parse.paperId}" />
			<input type="hidden" name="structId_txt" id="structId_txt" value="${parse.structId}" /> 
			<input type="hidden" name="quesId_txt" id="quesId_txt" value="${parse.quesId}" /> 
			<table>

				<tr id="tr_parseContent">
					<td align="right" width="100">文字解析内容：</td>
					
					<td>
						<textarea cols="80" id="parseContent" name="parseContent" rows="5" class="editor">
						</textarea>
						
					</td>
				</tr>
				

			</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="关闭" id="saveTxt_parse_cancle" />
			</span>
		</div>

	</div>
</form>

</div>
</body>
</html>