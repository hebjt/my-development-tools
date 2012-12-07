<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="com.tanghsk.sync.util.*"%>
<%@ page import="java.sql.*"%>
<%

String filePath = request.getSession().getServletContext().getRealPath("/WEB-INF/config/dataSource.properties");
String user = CommUtil.readValue(filePath, "username");
String password = CommUtil.readValue(filePath, "password");
DBManager dbmanager = DBManager.getInstance(user, password);
String subject_sql = "SELECT * FROM ex_subject where status='01'";
ResultSet rs = dbmanager.executeQuery(subject_sql);
String subject_list="";
while(rs.next()){
	subject_list += "<option value=\"" + rs.getString("id") + "\">" + rs.getString("subject_name") + "</option>";
}

String p_Sql="SELECT * FROM ep_exam_paper WHERE status != '09'";
ResultSet p_rs = dbmanager.executeQuery(p_Sql);
String paper_list="";
while(p_rs.next()){
	paper_list += "<option value=\"" + p_rs.getString("id") + "\">" + p_rs.getString("paper_name") + "</option>";
}
dbmanager.closeDBResource();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>
<style type="text/css">
#type_box {
	border: 1px solid #24a1d3;
	line-height: 30px;
	padding-left: 10px;
}

#top_title { /*border:1px solid #24a1d3;*/
	line-height: 30px;
	font-weight: bold;
	margin-bottom: 10px;
	padding-left: 10px;
	background-color: #eee;
}

fieldset {
	border: 1px solid #24a1d3;
	line-height: 30px;
	margin-top: 10px;
	padding-left: 10px;
	padding-bottom: 8px;
}

#result_box {
	border: 1px solid #24a1d3;
	margin-top: 10px;
	margin-bottom: 10px;
	padding: 1px;
}

#result {
	font-weight: bold;
	color: red;
	line-height: 25px;
	min-height: 30px;
	margin-left: 9px;
	overflow: hidden;
}

#result_bottom {
	padding-top: 8px;
	padding-bottom: 8px;
	padding-left: 50px;
	background-color: #eee;
}

.notice {
	font-weight: bold;
	color: red;
}

#result_num {
	margin-left: 10px;
}

#result_info {
	
}

#result_info table,td,th {
	border: 1px solid #999;
	color: #333;
	text-align: center;
}

#result_info th {
	color: #800000;
}

#result_info table {
	margin-left: 10px;
}

#summary {
	margin: 10px;
	margin-left: 0px;
}

#summary div {
	float: left;
	margin-left: 10px;
	color: #333;
}

#summary span {
	float: left;
	color: #990000;
}
</style>

<script type="text/javascript" src="js/jquery-1.8.0.js"></script>
<script type="text/javascript">
jQuery.fn.clearAll  =   function (){     
    jQuery( this ).get( 0 ).options.length  =   0 ;     
};

$("document").ready(function(){
	//$("#add_paper").clearAll();
	$("#btn_generate").click(function(){
		//alert($("#add_paper").val());
		$("#btn_generate").attr("disabled",true);
		var paper_id = $("#add_paper").val();
		$.ajax({
			type: "POST",
			async:false,
			url: "generate/struct_list.action",
			data: {paper_id:paper_id},
			context: document.body,
			success: function(data){
				if(data=="success"){
					alert("导出成功！");
					$("#btn_generate").attr("disabled",false);
				}
				/*
				str_opt = "";
	            $.each(data, function(i,item){
	                str_opt += "<option value='" + item.subject_id + "' class='d_add' title='" + item.subject_name + "'>" + item.subject_name + "</option>";
	            });
	            $("#subject_name").append(str_opt);*/
	            
			}
		});
	});
	
	
});
</script>
</head>

<body>

	<div id="wrapper">
		<div id="top_title">试卷导出</div>
		<div id="type_box">
			科目名称<select id="add_subject" name="add_subject">
				<%=subject_list%>
			</select> 试卷名称：<select id="add_paper" name="add_paper">
				<%=paper_list%>
			</select> <input type="button" name="btn_generate" id="btn_generate" value="生成">

		</div>
	</div>
</body>
</html>