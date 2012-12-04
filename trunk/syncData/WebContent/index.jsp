<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
	#type_box {
		border:1px solid #24a1d3;
		line-height:30px;
		padding-left:10px;
	}

	#top_title {
		/*border:1px solid #24a1d3;*/
		line-height:30px;
		font-weight:bold;
		margin-bottom:10px;
		padding-left:10px;
		background-color:#eee;
	}

	fieldset {
		border:1px solid #24a1d3;
		line-height:30px;
		margin-top:10px;
		padding-left:10px;
		padding-bottom:8px;	
	}
	
	#result_box {
		border:1px solid #24a1d3;
		margin-top:10px;
		margin-bottom:10px;
		padding:1px;
	}

	#result {
		font-weight:bold;
		color:red;
		line-height:25px;
		min-height:30px;
		margin-left:9px;
		overflow:hidden;
	}

	#result_bottom {
		padding-top:8px;
		padding-bottom:8px;
		padding-left:50px;
		background-color:#eee;
	}

	.notice {
		font-weight:bold;
		color:red;
	}
	
	#result_num {
		margin-left:10px;
	}

	#result_info {
	
	}

	#result_info table,td,th {
		border:1px solid #999;
		color:#333;
		text-align:center;
	}

	#result_info th {
		color:#800000;
	}

	#result_info table {
		margin-left:10px;
	}

	#summary{
		margin:10px;
		margin-left:0px;
	}

	#summary div{
		float:left;
		margin-left:10px;
		color:#333;
	}

	#summary span{
		float:left;
		color:#990000;
	}
</style>

<script type="text/javascript" src="../js/jquery/jquery.js"></script>
<script type="text/javascript">
$("document").ready(function(){
	$("#btn_submit").click(function(){
		var plan_id = $.trim($("#add_plan option:selected").val());
		var add_sign = $.trim($("#add_sign option:selected").val());
		var add_unit = $.trim($("#add_unit option:selected").val());
		var add_time = $.trim($("#add_time").val());
		var stu_pass = $.trim($("#stu_pass").val());
		if(""!=plan_id && ""!=add_sign && ""!=add_unit && ""!=add_time){
			if(confirm("确认提交时间修改？")){
				var add_url = "doChangeTime.jsp?add_sign=" + add_sign;
				add_url = add_url +"&add_unit=" + add_unit;
				add_url = add_url +"&add_time=" + add_time;
				add_url = add_url +"&plan_id=" + plan_id;
				add_url = add_url +"&stu_pass=" + stu_pass;

				$.ajax({
					url: add_url,
					success: function(msg){
						$("#result").html(msg);
					}
				});
			}
		}else{
			alert("参数不完整！");
		}
	});

	$("#btn_gettime").click(function(){
		var plan_id = $.trim($("#add_plan option:selected").val());
		if(""!=plan_id){
			var get_url = "doGetTime.jsp?plan_id=" + plan_id;

			$.ajax({
				url: get_url,
				success: function(msg){
					$("#result").html(msg);
				}
			});
		}else{
			alert("参数不完整！");
		}
	});

	$("#btn_getresult").click(function(){
		var stu_pass_state = $.trim($("#stu_pass_state").val());
		var plan_id = $.trim($("#add_plan option:selected").val());
		if(""!=stu_pass && ""!=plan_id){
			var get_url = "doGetResult.jsp?stu_pass=" + stu_pass_state + "&plan_id=" + plan_id;

			$.ajax({
				url: get_url,
				success: function(msg){
					$("#result").html(msg);
				}
			});
		}else{
			alert("参数不完整！");
		}
	});

	$("#btn_editState").click(function(){
		var stu_pass_state = $.trim($("#stu_pass_state").val());
		var plan_id = $.trim($("#add_plan option:selected").val());
		var stu_state = $.trim($("#stu_state option:selected").val());
		if(""!=stu_pass_state && ""!=plan_id){
			var get_url = "doEditState.jsp?stu_pass=" + stu_pass_state + "&plan_id=" + plan_id + "&stu_state=" +stu_state;

			$.ajax({
				url: get_url,
				success: function(msg){
					$("#result").html(msg);
				}
			});
		}else{
			alert("参数不完整！");
		}
	});

	$("#btn_lastin").click(function(){
		var stu_last_in = $.trim($("#stu_last_in").val());
		var plan_id = $.trim($("#add_plan option:selected").val());

		if(""!=stu_last_in && ""!=plan_id){
			var get_url = "doEditLastin.jsp?stu_lastin=" + stu_last_in + "&plan_id=" + plan_id ;

			$.ajax({
				url: get_url,
				success: function(msg){
					$("#result").html(msg);
				}
			});
		}else{
			alert("参数不完整！");
		}
	});

	$("#btn_clear").click(function(){
		$("#result").html("");
	});
});
</script>
</head>

<body>

<div id="wrapper">
	<div id="top_title">试卷导出</div>
	<div id="type_box">
		科目名称<select id="add_subject">
			
		</select>
		试卷名称：<select id="add_paper">
			
		</select>
		
	</div>
</div>
</body>
</html>