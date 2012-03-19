<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<title>添加考试科目类型</title>
	<link rel="stylesheet" href="../css/admin.css">
	<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
	<script type="text/javascript">
	    $(document).ready(function(){ 
			$("#btn_submit").click(function(){
				submit_check();
			});

			$("#btn_reset").click(function(){
				form_subType.reset();
			});	
	    });
	    
		function submit_check(){
			if($("#sub_type_id").val() == ""){
				alert("科目类型编码不能为空！");
				$("#sub_type_id").focus();
				return;
			}
			if($("#sub_type_name").val() == ""){
				alert("科目类型名称必须填写！");
				$("#sub_type_name").focus();
				return;
			}
			
			//ajax查重判断
			var formData = $("#form_subType").serialize();
			$.ajax({
				type: "POST",
				async:false,
				url: "findDupSubType.action?findType=add",
				data: formData,
				context: document.body,
				success: function(msg){
					if("yes"==$.trim(msg)){
						alert("科目类型ID或则会科目类型名称重复！");
						return;
					}else if("no"==$.trim(msg)){
						form_subType.submit();
					}
				}
			});
		}
		
	
	</script>
</head>
<body>
<div id="outFrame">
	<div id="view">
		<div id="title">添加考试科目类型</div>
		<form action="save_subType.action" name="form_subType" id="form_subType" method="POST">
		<table>
			<tr>
				<th>科目类型编码：</th>
				<td><input type="text" name="sub_type_id" id="sub_type_id" size="10" /></td>
			</tr>
			<tr>
				<th>科目类型名称：</th>
				<td>
					<input type="text" name="sub_type_name" id="sub_type_name" size="70" />
				</td>
			</tr>
			<tr>
				<th>科目类型备注：</th>
				<td>
					<textarea rows="20" cols="60" name="sub_type_remark" id="sub_type_remark"></textarea>
				</td>
			</tr>			
		</table>
		</form>
		<div id="bottomBar">
			<input class="button" type="submit" name="btn_submit" id="btn_submit" value="提交" />
			<input class="button" type="reset" name="btn_reset" id="btn_reset" value="重置" />
		</div>
	</div>
</div>
</body>
</html>