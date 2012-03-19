<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加科目</title>
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/validation/jquery.validate.min.js" type="text/javascript"></script>
<script src="../js/validation/messages_cn.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	$.ajax({
		type: "POST",
		async:false,
		url: "initSubContent.action",
		data: "",
		context: document.body,
		success: function(data){
			str_opt = "";
            $.each(data, function(i,item){
                str_opt += "<option value='" + item.subject_id + "' class='d_add' title='" + item.subject_name + "'>" + item.subject_name + "</option>";
            });
            $("#subject_name").append(str_opt);
            
		}
	});
	$("#subject_name").val("${paper.subject.subject_id}");//
	$("#paperNotice").val("${paper.paperNotice}");
	$("#form1").validate({
		rules: {
			paperName: "required",
			paperQuestionNum: {
				required: true,
				digits: true
			},
			paperExamTime: {
				required: true,
				digits: true
			}
			
		},
		messages: {
			paperName: "不能为空",

			paperQuestionNum: {
				required: "不能为空",
				digits: "请输入整数！"
			},
			paperExamTime: {
				required: "不能为空",
				digits: "请输入整数！"
			}
		}
	});
	
});
</script>
</head>
<body>
<div id="outFrame">
	<div id="view">
		<div id="title">修改试卷</div>
		<form action="update_paper.action" name="form1" id="form1" method="POST" enctype="multipart/form-data">
		<input type="hidden" name="paperId" id="paperId" value="${paper.paperId}">
		<table>
			<tr>
				<th>试卷名称：</th><td><input type="text" name="paperName" id="paperName" size="43" value="${paper.paperName}" /></td>
			</tr>
			<tr>
				<th>科目名称：</th>
				<td>
				<select id="subject_name" name="subject_name">
				</select>
				</td>
			</tr>
			<tr>
				<th>听力文件：</th>
				<td><input type="text" size="30" value="${paper.paperListeningFile}"><input type="file" name="ListeningFile" id="ListeningFile" onchange="this.previousSibling.value=this.value" style="width:78px;" /></td>
			</tr>
			<tr>
				<th>试题数量：</th>
				<td><input type="text" name="paperQuestionNum" id="paperQuestionNum" size="43" value="${paper.paperQuestionNum}" /></td>
			</tr>
			<tr>
				<th>答题时间：</th>
				<td><input type="text" name="paperExamTime" id="paperExamTime" size="43" value="${paper.paperExamTime}" /></td>
			</tr>
			<tr>
				<th>注意事项：</th>
				<td>
					<textarea rows="5" cols="34" name="paperNotice" id="paperNotice"></textarea>
				</td>
			</tr>
		</table>
		
		<div id="bottomBar">
			<input class="button" type="submit" name="btn_submit" value="提交" />
			<input class="button" type="reset" name="btn_reset" value="重置" />
		</div>
		</form>
	</div>
</div>
</body>
</html>