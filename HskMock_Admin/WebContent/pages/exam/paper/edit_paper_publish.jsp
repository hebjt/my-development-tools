<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>发布试卷</title>
<link rel="stylesheet" href="../css/admin.css">
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/validation/jquery.validate.min.js" type="text/javascript"></script>
<script src="../js/validation/messages_cn.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	var publishHaveParse="${publish.publishHaveParse}";
	var publishHaveRead="${publish.publishHaveRead}";
	$("#paperPubStatusId").val('${publish.paperPubStatusId}');
	if(publishHaveParse=='1'){
		//alert("1");
		$("#publishHaveParse").attr("checked","checked");
	}
	if(publishHaveRead=='1'){
		$("#publishHaveRead").attr("checked","checked");
	}
	$("#publishRemark").val('${publish.publishRemark}');
	
	$("#btn_submit").click(function(){
		var form_data = $("#form1").serialize()+'&time='+Math.random();
		//alert(form_data);
		if(validate.form()){
			$.ajax({
				type: "POST",
				async:false,
				url: "update_paper_publish.action",
				data: form_data,
				context: document.body,
				success: function(data){
					if(data=="success"){
						//alert(data);
						window.close();
						opener.reQuery();
					}else{
						alert("修改失败！");
					}
		            
				}
			});
			
		}
	});

	
	var validate = $("#form1").validate({
		rules: {
			publishName: "required",
			publishPaperPrice: {
				required: true,
				number:true
			},
			publishPointNum: {
				required: true,
				digits:true
			},
			publishBuyTimes: {
				required: true,
				digits:true
			}
		},
		messages: {
			errorElement:"em",
			publishName: "<span><font color='red'>不能为空</font></span>",
			publishPaperPrice: {
				required: "<span><font color='red'>不能为空</font></span>",
				number:"<span><font color='red'>请输入合法的数字</font></span>"
			},
			publishPointNum: {
				required: "<span><font color='red'>不能为空</font></span>",
				digits:"<span><font color='red'>请输入合法的整数</font></span>"
			},
			publishBuyTimes: {
				required: "<span><font color='red'>不能为空</font></span>",
				digits:"<span><font color='red'>请输入合法的整数</font></span>"
			}
		}
	});
	
	$("input[type='checkbox']").change(function(){
		var flag = this.id;
		//alert(flag);
		if(flag=='publishHaveParse'){
			var v= $("#publishHaveParse").val();
			if(v=='0'){
				$("#publishHaveParse_u").val("1");
				$("#publishHaveParse").val("1");
			}else{
				//alert("00000");
				$("#publishHaveParse_u").val("0");
				$("#publishHaveParse").val("0");
			}
			
		}
		if(flag=='publishHaveRead'){
			var v= $("#publishHaveRead").val();
			if(v=='0'){
				$("#publishHaveRead_u").val("1");
				$("#publishHaveRead").val("1");
			}else{
				//alert("00000");
				$("#publishHaveRead_u").val("0");
				$("#publishHaveRead").val("0");
			}
		}
		//alert($("#publishHaveParse").val());
	});
});
</script>
</head>
<body>
<div id="outFrame">
	<div id="view">
		<div id="topBar">修改发布</div>
		<form action="" name="form1" id="form1" method="POST">
		<input type="hidden" name="publishId" id="publishId" value="${publishId}" />
		<input type="hidden" name="publishHaveParse_u" id="publishHaveParse_u" value="${publish.publishHaveParse}" />
		<input type="hidden" name="publishHaveRead_u" id="publishHaveRead_u" value="${publish.publishHaveRead}" />
		<table>
			<tr>
				<th>发布名称：</th><td><input type="text" name="publishName" id="publishName" value="${publish.publishName}"/></td>
			</tr>
			<tr>
				<th>试卷价格：</th><td><input type="text" name="publishPaperPrice" id="publishPaperPrice" value="${publish.publishPaperPrice}" /></td>
			</tr>
			<tr>
				<th>发布状态：</th>
				<td>
				<select id="paperPubStatusId" name="paperPubStatusId">
					<option value="1">启用</option>
					<option value="0">禁用</option>
				</select>
				</td>
			</tr>
			<tr>
				<th>发布类型：</th>
				<td><input type="text" name="publishType" id="publishType" value="${publish.publishType}" /></td>
			</tr>
			<tr>
				<th>是否有解析：</th>
				<td><input type="checkbox" name="publishHaveParse" id="publishHaveParse" value="${publish.publishHaveParse}" /></td>
			</tr>
			<tr>
				<th>是否有阅卷：</th>
				<td><input type="checkbox" name="publishHaveRead" id="publishHaveRead" value="${publish.publishHaveRead}" /></td>
			</tr>
			<tr>
				<th>赠送积分数量：</th>
				<td><input type="text" name="publishPointNum" id="publishPointNum" value="${publish.publishPointNum}" /></td>
			</tr>
			<tr>
				<th>购买次数：</th>
				<td><input type="text" name="publishBuyTimes" id="publishBuyTimes" value="${publish.publishBuyTimes}" /></td>
			</tr>
			<tr>
				<th>发布说明：</th>
				<td>
					<textarea rows="5" cols="35" name="publishRemark" id="publishRemark"></textarea>
				</td>
			</tr>
		</table>
		
		<div id="bottomBar">
			<input class="button" type="button" name="btn_submit" id="btn_submit" value="提交" />
			<input class="button" type="reset" name="btn_reset" id="btn_reset" value="重置" />
		</div>
		</form>
	</div>
</div>
</body>
</html>