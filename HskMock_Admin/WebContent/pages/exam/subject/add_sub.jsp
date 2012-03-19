<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加科目</title>
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	$.ajax({
		type: "POST",
		async:false,
		url: "initSubject.action?time="+Math.random(),
		data: "",
		context: document.body,
		success: function(data){
			str_opt = "";
            $.each(data, function(i,item){
                str_opt += "<option value='" + item.sub_type_id + "' class='d_add' title='" + item.sub_type_name + "'>" + item.sub_type_name + "</option>";
            });
            $("#subject_type").append(str_opt);
            
		}
	});
	//科目级别
	$.ajax({
		type: "POST",
		async:false,
		url: "initLevel.action?time="+Math.random(),
		data: "",
		context: document.body,
		success: function(data){
			str_opt = "";
            $.each(data, function(i,item){
                str_opt += "<option value='" + item.subjectLevelId + "' class='d_add' title='" + item.subjectLevelName + "'>" + item.subjectLevelName + "</option>";
            });
            $("#subject_level").append(str_opt);
            
		}
	});
	
});
</script>
</head>
<body>
<div id="outFrame">
	<div id="view">
		<div id="title">添加考试科目</div>
		<form action="save_sub.action" name="form1" method="POST">
		<table>
			<tr>
				<th>科目名称：</th><td><input type="text" name="subject_name" id="subject_name" size="70" /></td>
			</tr>
			<tr>
				<th>科目类型：</th>
				<td>
					<select name="subject_type" id="subject_type">

					</select>
				</td>
			</tr>
			<tr>
				<th>科目级别：</th>
				<td>
					<select name="subject_level" id="subject_level">

					</select>
				</td>
			</tr>
			<tr>
				<th>科目状态：</th>
				<td>
					<select name="exam_status_id" id="exam_status_id">
						<option value="1">启用</option>
						<option value="0">禁用</option>
					</select>
				</td>
			</tr>
			<tr>
				<th>科目备注：</th>
				<td>
					<textarea rows="10" cols="52" name="subject_remark" id="subject_remark"></textarea>
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