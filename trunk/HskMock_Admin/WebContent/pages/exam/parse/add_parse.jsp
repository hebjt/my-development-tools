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
	
	$("#parseType").change(function(){
		var flag = $("#parseType").val();
		if(flag=="txt"){
			$("#form1").show();
			$("#form2").hide();
			$("#parseType_txt").val(flag);
		} 
		if(flag=="video"){
			$("#form1").hide();
			$("#form2").show();
			$("#parseType").val(flag);
		}
	});
	$("#parseType_txt").change(function(){
		var flag = $("#parseType_txt").val();
		if(flag=="txt"){
			$("#form1").show();
			$("#form2").hide();
			$("#parseType_txt").val(flag);
		}
		if(flag=="video"){
			$("#form1").hide();
			$("#form2").show();
			$("#parseType").val(flag);
		}
	});
	
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
	
	$("#saveVideo_parse").click(function(){
		var form_data = $("#form2").serialize()+'&time='+Math.random();
        if(validate.form()){
        	form2.action="saveVideo_parse.action";
        	form2.submit();
            /* $.ajax({ 
                url: 'saveVideo_parse.action', 
                type:'POST',
                data:form_data,
                success: function(data) { 
                    //alert(data);
                    if(data=="success"){
                		window.close();
                		opener.reQuery();
                    }
                } 
            }); */
        }
	});
	
	var validate = $("#form1").validate({
		errorElement:"em",
		rules: {
			parseWidth: {
				nd:true
				
			},
			parseHeight: {
				nd: true
			}
		},
		messages: {
			parseWidth: {
				
				nd:"<span><font color='red'>只能输入数字！</font></span>"
			},

			parseHeight: {
				nd:"<span><font color='red'>只能输入数字！</font></span>"
				
			}
		}
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
			<div id="title" style="background-color:white; text-align:center;">解析</div>
			<input type="hidden" name="paperId_txt" id="paperId_txt" value="${parse.paperId}" />
			<input type="hidden" name="structId_txt" id="structId_txt" value="${parse.structId}" /> 
			<input type="hidden" name="quesId_txt" id="quesId_txt" value="${parse.quesId}" /> 
			<table>
				<tr>
					<td align="right" width="100">解析类别：</td>
					
					<td align="left" width="224">
						<select name="parseType_txt" id="parseType_txt">
							<option value="txt">文字</option>
							<option value="video">视频</option>
						</select>
					</td>
				</tr>
				<tr id="tr_parseContent">
					<td align="right" width="100">文字解析内容：</td>
					
					<td>
						<textarea cols="80" id="parseContent_txt" name="parseContent_txt" rows="5" class="editor">
						</textarea>
						
					</td>
				</tr>
				
				<tr>
					<td align="right" width="100">解析状态：</td>
					
					<td align="left" width="224">
						<select name="parseState_txt" id="parseState_txt">
							<option value="00">启用</option>
							<option value="01">停用</option>
						</select>
					</td>
				</tr>

			</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="保存"  id="saveTxt_parse" />
			</span> 
			<span id="center">
				<input type="button" class="button" value="返回" id="saveTxt_parse_cancle" />
			</span>
		</div>

	</div>
</form>
<!-- video -->
<form id="form2" name="form2" method="post" action="" enctype="multipart/form-data" style="display: none">
	<div id="outFrame">
		<div id="list">
			<div id="title" style="background-color:white; text-align:center;">解析</div>
			<input type="hidden" name="paperId" id="paperId" value="${parse.paperId}" />
			<input type="hidden" name="structId" id="structId" value="${parse.structId}" /> 
			<input type="hidden" name="quesId" id="quesId" value="${parse.quesId}" /> 
			<table>
				<tr>
					<td align="right" width="100">解析类别：</td>
					
					<td align="left" width="224">
						<select name="parseType" id="parseType">
							<option value="video">视频</option>
							<option value="txt">文字</option>
							
						</select>
					</td>
				</tr>
				
				<tr id="tr_parseFile">
					<td align="right" width="100">视频解析文件：</td>
					
					<td align="left" width="224">
						<input type="file" name="parseFile_muli"  id="parseFile_muli" />
					</td>
				</tr>
				<tr id="tr_parseWidth">
					<td align="right" width="100">视频宽度：</td>
					
					<td align="left" width="224">
						<input type="text" name="parseWidth"  id="parseWidth" />
					</td>
				</tr>
				<tr id="tr_parseHeight">
					<td align="right" width="100">视频高度：</td>
					
					<td align="left" width="224">
						<input type="text" name="parseHeight" id="parseHeight" />
					</td>
				</tr>
				<tr>
					<td align="right" width="100">解析状态：</td>
					
					<td align="left" width="224">
						<select name="parseState" id="parseState">
							<option value="00">启用</option>
							<option value="01">停用</option>
						</select>
					</td>
				</tr>

			</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="保存"  id="saveVideo_parse" />
			</span> 
			<span id="center">
				<input type="button" class="button" value="返回" id="saveVideo_parse_cancle" />
			</span>
		</div>

	</div>
</form>
</div>
</body>
</html>