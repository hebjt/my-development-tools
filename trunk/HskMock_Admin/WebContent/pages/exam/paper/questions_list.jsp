<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>试题列表</title>
<style type="text/css">

body {
	background-image: url(../images/rightbg.jpg);
}

.STYLE1 {
	color: #FF0000
}

fieldset {
    padding:5px;
    margin:5px;
    width:97%;
    color:#333; 
    border:#06c groove 2px;
    /*border:#06c dashed 1px;虚线*/
} 
fieldset.inner{
    padding:5px;
    margin:5px;
    width:95%;
    color:#333; 
    border:#06c dashed 2px;
    

}
legend {
    color:#06c;
    font-weight:800; 
    background:#fff;
} 
/* 字体带边框*/
legend.grooveborder{
	width:80px;
	border:2px groove #06c;
	background-color:#fff;
	text-align:center;
	font-family:arial;
	padding:2px;
	margin:2px;
	font-weight:bold;

}
/*虚线边框*/
legend.dashedborder{
	width:80px;
	border:2px dashed #06c;
	background-color:#fff;
	text-align:center;
	font-family:arial;
	padding:2px;
	margin:2px;
	font-weight:bold;

}


ul {
    list-style-type: none;
    margin:8px 0 4px 0;
} 
li {
    margin-top:4px;
}


</style>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/main.css">
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/jquery.blockUI.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
	<script type="text/javascript">
	$(document).ready(function() {
		//添加分类
        $('#save_zhhe_cancle').click(function() { 
            $.unblockUI(); 
            return false; 
        });
        $('#save_Struct').click(function() { 
            $.blockUI({ message: "<h1>请稍候...</h1>" }); 
            var form_data = $("#form1").serialize()+'&time='+Math.random();
            //alert(form_data);
            $.ajax({ 
                url: 'save_substrut.action', 
                type:'POST',
                data:form_data,
                complete: function() { 
                    //alert(data);
                    $.unblockUI(); 
                    window.location.reload();
                } 
            });
        });
        //批量添加
  		$("#opption_bat").click(function(){
  			var struct_id=$("#subjectStructId").val();
  			var paper_id = $("#hid_paperID").val();
  			var opt = $("input[name='choose']:checked").val();
  			var start = $("#startopt").val();
  			var end = $("#endopt").val();
  			var opetator="";
  			if(opt='01'){
  				//添加选择
	  			if(isInteger(start)&&isInteger(end)){
	  				for(var i=parseInt(start);i<=parseInt(end);i++){
	  					opetator+=String.fromCharCode((64+i))+",";
	  					//alert(String.fromCharCode((64+i)));
	  				}
	  				$.ajax({
	  					type: "POST",
	  					async:false,
	  					url: "save_OptBat.action",
	  					data: {op:opetator,struct_id:struct_id,paper_id:paper_id,time:Math.random()},
	  					context: document.body,
	  					success: function(data){
	  						if(data=="success"){
	  							window.location.reload();
	  						}
	  			            
	  					}
	  				});
	  			}
  				//alert("11");
  			}else{
  				//添加对错
  			}
  			//alert(paper_id);
  		});
	});
		function isInteger(str){
			if(/^-?\d+$/.test(str)){
				return true;
			}
			return false;
		}
		//判断是否是听力
		function isListen(structid){
			
		}
	
		function operate(str, id, sign) {
			if (str == 'questions_flling') {
				//新增填空题
				$("#sign").val("03");
				var type = $("#sign").val();
				var structId=$("#subjectStructId").val();
				var url="paper_id=" + id+"&type="+type+"&structId="+structId+"&quesDrySign=01";
				wopen("paper_addsynthesis.action?"+url,"", 800, 600);
			} else if (str == "questions_choice") {
				//新增选择题
				$("#sign").val("02");
				var type = $("#sign").val();
				var structId=$("#subjectStructId").val();
				var url="paper_id=" + id+"&type="+type+"&structId="+structId+"&quesDrySign=01";
				wopen("paper_addsynthesis.action?"+url,"", 800, 600);
			} else if (str == "paper_addsynthesis") {
				//新增综合题
				var structId=$("#subjectStructId").val();
				$("#sign").val("01");
				var type = $("#sign").val();
				var url="paper_id=" + id+"&type="+type+"&structId="+structId+"&quesDrySign=00";
				wopen("paper_addsynthesis.action?"+url,"", 800, 600);
			} else if (str == "paper_synthesis_create") {
				$("#sign").val("01");
				var type = $("#sign").val();
				var quesId= id;
				var paper_id = $("#hid_paperID").val();
				var struct_id=$("#subjectStructId").val();
				var url = "ques_id="+quesId+"&paper_id="+paper_id+"&struct_id="+struct_id+"&type="+type+"&quesDrySign=01";
				//alert(paper_id);
				wopen("paper_synthesis_create.action?"+url, "", 800, 600);
			} else if (str == "paper_opt_edit") {
				//alert(id);
				//编辑选项
				var quesId= id;
				var paper_id = $("#hid_paperID").val();
				var struct_id=$("#subjectStructId").val();
				//alert(id);
				var opt_id = $('input[name='+id+'R]:checked').val();
				//alert(opt_id);
				if(opt_id==undefined){
					alert("请选择要修改的选项！");
					return false;
				}else{
					var url = "quesId="+quesId+"&optPaperId="+paper_id+"&optStructId="+struct_id+"&optId="+opt_id;
					wopen("paper_opt_edit.action?"+url, "", 800, 600);
				}
			} else if (str == "paper_synthesis_edit") {
				//编辑综合试题
				var quesId= id;
				var url = "quesId="+quesId;
				wopen("paper_synthesis_edit.action?"+url, "", 800, 600);
			} else if (str == "paper_opt_create") {
				//新建选项
				var quesId= id;
				//alert(quesId);
				wopen("paper_opt_create.action?ques_id=" + quesId, "", 800, 600);
			} else if (str == "paper_synthesis_del") {
				//删除试题
				var rs = window.confirm("您确定要删除此记录吗？");
				if (rs) {
					$.ajax({ 
		                url: 'del_question.action?ques_id='+id, 
		                type:'POST',
		                success: function(data) {
		                	if(data=="success"){
		                		window.location.reload();
		                	}else{
		                		alert("要删除的试题包含选项，请先删除试题的选项！");
		                		return false;
		                	}		                    
		                } 
		            });
				}
			} else if (str == "paper_opt_del") {
				//删除选项
				var opt_id = $('input[name='+id+'R]:checked').val();
				if(opt_id==undefined){
					alert("请选择要删除的选项！");
					return false;
				}else{
					var rs = window.confirm("您确定要删除此记录吗？");
					if (rs) {
						//alert(opt_id);
						$.ajax({ 
			                url: 'del_option.action?opt_id='+opt_id+"&time="+Math.random(), 
			                type:'POST',
			                success: function(data) { 
			                	if(data=="success"){
			                		//alert(data);
				                    window.location.reload();
			                	}
			                    
			                } 
			            });
					}
				}
			} else if (str == "questions_batchopt") {
				//批量添加对错选项
				
			}
		}
		function reQuery() {
			window.location.reload();
		}

	</script>
</head>

<body style="overflow-x: hidden">
<form name="listform" id="listform">

</form>
<input type="hidden" name="hid_paperID" id="hid_paperID" value="${paperId}" />
<input type="hidden" name="subjectStructId" id="subjectStructId" value="${structId}" /> 
<input type="hidden" name="level" id="level" value="${level}" />
<input type="hidden" name="sign" id="sign" value="" />

<div align="right">
	<!-- <input type="radio" name="choose" id="choose1" value="00"/>	批量添加对错	 -->
	<input type="radio" name="choose" id="choose2" value="01"/>	批量添加选项		   	
   <input size="2" name="startopt" id="startopt"></input>至
   <input size="2" name="endopt" id="endopt"></input>
   <input type="button" name="opption_bat" id="opption_bat" value="批量添加选项" class="button" />
   <input type="button" name="button50" id="button52" value="新题填空"
	class="button" onclick="operate('questions_flling','${paperId}')" />
   <input type="button" name="button49" id="button51" value="新建选择"
	class="button" onclick="operate('questions_choice','${paperId}')" />
   <input type="button" name="button48" id="button50" value="新建综合题"
	class="button" onclick="operate('paper_addsynthesis','${paperId}')" />
</div>	
<c:if test="${level==3}">
<div>
	<fieldset>
	<legend class="grooveborder">试卷试题</legend>
		<label></label>
		<c:forEach items="${treeNode.childs}" var="item">
		<fieldset class="inner">
			<legend class="dashedborder">试题</legend>
				
					<table cellpadding="0" cellspacing="0" border="0">
							<c:set value="${item.quesContent}" var="target"></c:set>
							<c:set value="<p>" var="obj"></c:set>
							<tr><td align="left">${item.quesNum}${fn:replace(target,obj,'')}</td></tr>
							<tr>
								<td align="left">
									<c:if test="${item.quesType=='01'}">
									<input type="button" value="添加试题" onclick="operate('paper_synthesis_create','${item.quesId}')" />
									</c:if>
									<input type="button" value="编辑" onclick="operate('paper_synthesis_edit','${item.quesId}')" />
									<input type="button" value="删除" onclick="operate('paper_synthesis_del','${item.quesId}')" />
									<input type="button" value="添加选项" onclick="operate('paper_opt_create','${item.quesId}')" />
									<input type="button" value="编辑选项" onclick="operate('paper_opt_edit','${item.quesId}')" />
									<input type="button" value="删除选项" onclick="operate('paper_opt_del','${item.quesId}')" />
								</td>
							</tr>
							<c:forEach items="${item.childs}" var="sub">
								<!-- 综合题 -->
								<c:set value="${sub.quesContent}" var="target"></c:set>
								<c:set value="<p>" var="obj"></c:set>
								<c:choose>
								<c:when test="${sub.quesType=='01'}">
									<tr><td align="left">${sub.quesNum}${fn:replace(target,obj,'')}</td></tr>
								</c:when>
								<c:otherwise>
									<c:choose>
										<c:when test="${sub.quesDrySign=='00'}">
											<tr><td align="left">${sub.quesNum}${sub.quesContent}</td></tr>
										</c:when>
										<c:otherwise>
											<tr><td align="left"><input type="radio" name="${sub.quesParentId}R" id="${sub.quesId}" value="${sub.quesId}"/>${sub.quesNum}${sub.quesContent}</td></tr>
										</c:otherwise>
										
									</c:choose>
									
								</c:otherwise>
								</c:choose>

								<c:if test="${item.quesType=='01'}">
								<tr>
								<td align="left">
									<input type="button" value="编辑" onclick="operate('paper_synthesis_edit','${sub.quesId}')" />
									<input type="button" value="删除" onclick="operate('paper_synthesis_del','${sub.quesId}')" />
									<input type="button" value="添加选项" onclick="operate('paper_opt_create','${sub.quesId}')" />
									<input type="button" value="编辑选项" onclick="operate('paper_opt_edit','${sub.quesId}')" />
									<input type="button" value="删除选项" onclick="operate('paper_opt_del','${sub.quesId}')" />
								</td>
								</tr>
								</c:if>
								<tr>
								<td align="left">
								<c:forEach items="${sub.childs}" var="opt">
									<c:set value="${opt.quesContent}" var="target"></c:set>
									<c:set value="<p>" var="obj"></c:set>
									<c:if test="${opt.leaf==true}">
									<input type="radio" name="${opt.quesParentId}R" id="${opt.quesId}" value="${opt.quesId}"/>${opt.quesNum}${fn:replace(target,obj,'')}
									</c:if>
								</c:forEach>
								</td>
								</tr>
							</c:forEach>
						
					</table>
				
		</fieldset>
		</c:forEach>
	</fieldset>


</div>	
</c:if>
			


</body>


</html>