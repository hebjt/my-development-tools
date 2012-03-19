<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.tanghsk.mock.admin.exam.domain.ExamSubjectStruct" %>
<%@ page import="java.util.List" %>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>科目结构</title>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/main.css">
<style type="text/css">

</style>
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/jquery.blockUI.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {
		//添加分类
        $('#cancle_back').click(function() { 
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
        //添加部分
        $('#save_sub_cancle').click(function() { 
            $.unblockUI(); 
            return false; 
        });
        $('#save_sub').click(function() { 
        	$.blockUI({ message: "<h1>请稍候...</h1>" }); 
            var form_data = $("#form2").serialize()+'&time='+Math.random();
            //alert(form_data);
            
            $.ajax({ 
                url: 'save_subpart.action', 
                type:'POST',
                data:form_data,
                complete: function() { 
                    //alert(data);
                    $.unblockUI(); 
                    window.location.reload();
                } 
            });
            
            
            
        });
        
        //添加小节
        $('#save_part_cancle').click(function() { 
            $.unblockUI(); 
            return false; 
        });
        $('#save_part').click(function() { 
        	$.blockUI({ message: "<h1>请稍候...</h1>" }); 
            var form_data = $("#form3").serialize()+'&time='+Math.random();
            //alert(form_data);
            
            $.ajax({ 
                url: 'save_subpart.action', 
                type:'POST',
                data:form_data,
                complete: function() { 
                    //alert(data);
                    $.unblockUI(); 
                    window.location.reload();
                } 
            });
            
            
            
        });
        
	});
	function operate(str, id, rootId) {
		if (str == "create") {
			$.blockUI({ message: $('#addStruct'), css: { width: '350px' } });
		} else if (str == "create_sub") {
			var parent_id = id;
			var rId=rootId;
			$("#sub_subject_struct_parent_id").val(parent_id);
			$("#sub_subject_struct_root_id").val(rId);
			$.blockUI({ message: $('#create_sub'), css: { width: '350px' } });
		} else if (str == "create_part") {
			var parentId = id;
			var rid=rootId;
			$("#part_subject_struct_parent_id").val(parentId);
			$("#part_subject_struct_root_id").val(rid);
			$.blockUI({ message: $('#create_part'), css: { width: '350px' } });
		}else if (str == "delete") {
			var r=confirm("确定要删除这条数据吗?");
			if(r){
				$.blockUI({ message: "<h1>请稍候...</h1>" }); 
	            $.ajax({ 
	                url: 'del_data.action?struct_id='+id+"&time="+Math.random(), 
	                type:'POST',
	                success: function(data) { 
	                	$.unblockUI(); 
	                	if(data=="success"){
	                		window.location.reload();
	                	}else{
	                		
	                		alert("删除失败，请确定所删除数据没有与之关联数据！");
	                	}
	                   
	                } 
	            });
			}
		}else if (str == "edit") {
			//$.blockUI({ message: "<h1>loading...</h1>" }); 
            $.ajax({ 
                url: 'load_object.action?struct_id='+id, 
                type:'POST',
                success: function(data) { 
                   $("#subject_struct_name").val(data.subject_struct_name);
                   $("#subject_struct_question_num").val(data.subject_struct_question_num);
                   $("#subject_struct_answer_time").val(data.subject_struct_answer_time);
                   $("#subject_struct_seq_num").val(data.subject_struct_seq_num);
                   $("#primarykey_id").val(data.subject_struct_id);
                   $("#flag").val("1");
                } 
            });
			$.blockUI({ message: $('#addStruct'), css: { width: '350px' } });
		} else if (str == "edit_sub") {
            $.ajax({ 
                url: 'load_object.action?struct_id='+id, 
                type:'POST',
                success: function(data) { 
                   $("#sub_subject_struct_name").val(data.subject_struct_name);
                   $("#sub_subject_struct_parent_id").val(data.subject_struct_parent_id);
                   $("#sub_subject_struct_root_id").val(data.subject_struct_root_id);
                   $("#sub_subject_struct_question_num").val(data.subject_struct_question_num);
                   $("#sub_subject_struct_seq_num").val(data.subject_struct_seq_num);
                   $("#sub_primarykey_id").val(data.subject_struct_id);
                   $("#sub_flag").val("1");
                } 
            });
			$.blockUI({ message: $('#create_sub'), css: { width: '350px' } });
		}else if (str == "edit_part") {
            $.ajax({ 
                url: 'load_object.action?struct_id='+id, 
                type:'POST',
                success: function(data) { 
                   $("#part_subject_struct_name").val(data.subject_struct_name);
                   $("#part_subject_struct_parent_id").val(data.subject_struct_parent_id);
                   $("#part_subject_struct_root_id").val(data.subject_struct_root_id);
                   $("#part_subject_struct_seq_num").val(data.subject_struct_seq_num);
                   $("#part_primarykey_id").val(data.subject_struct_id);
                   $("#part_flag").val("1");
                } 
            });
            form3.action="save_updatePart.action";
			$.blockUI({ message: $('#create_part'), css: { width: '350px' } });
			//wopen("../substrut/substrut_editsub.action?id=" + id, "", 400, 300);
		}
	}
</script>
</head>
<% 
	List<ExamSubjectStruct> struList = (List<ExamSubjectStruct>)request.getAttribute("struList");
	StringBuffer strTable = new StringBuffer();
%>
<body>
	<input type="hidden" name="goal_subject_id" id="goal_subject_id" value="${subject.subject_id}" />
	<div id="outFrame">
		<div id="list">
			<div id="title" style="background-color:white; text-align:center;">HSKMock模拟考试-科目结构</div>
			<div id="topBar">
				<span id="center"><input type="button" value="新建分类" onclick="operate('create','');" /></span>
			</div>
			<table cellspacing="0" border="0">
				<tr>
					<th colspan="2">结构内容</th>
					<th>试题数量（个）</th>
					<th>考试时间（分钟）</th>
					<th width="10%">删除</th>
				</tr>
				<%
				for(int i=0;i<struList.size();i++){
					ExamSubjectStruct rootItem = (ExamSubjectStruct)struList.get(i);
					if(rootItem.getSubject_struct_id().equals(rootItem.getSubject_struct_parent_id())){
				%>
				<tr>
					
					<td><%=rootItem.getSubject_struct_name() %>
						<p>
						  <input type="button" value="编辑" class="button" onclick="operate('edit','<%=rootItem.getSubject_struct_id() %>')" />
						  <input type="button" value="新建部分" class="button" onclick="operate('create_sub','<%=rootItem.getSubject_struct_id() %>','<%=rootItem.getSubject_struct_id() %>')" />					     
						</p>	
					</td>
					<td style="padding:0px;" align="left">
						<table cellspacing="0" border="0" style="border:0px;">
						<%
						//if(rootItem.getSubject_struct_child_num() > 0){
							int rowNum1 = 0;
							String firstClass1 = "";
							for(int j=0;j<struList.size();j++){
								ExamSubjectStruct secondItem = struList.get(j);
								if(secondItem.getSubject_struct_parent_id().equals(rootItem.getSubject_struct_id()) && 
										!secondItem.getSubject_struct_parent_id().equals(secondItem.getSubject_struct_id())){
									rowNum1++;
									if(rowNum1==1){
										firstClass1 = "border-top:0px;";
									}else{
										firstClass1 = "";
									}
						%>
							<tr>
								<td style="text-align:left;border-left:0px;<%=firstClass1 %>" align="left">
									<%=secondItem.getSubject_struct_name() %>
									<input type="button" value="删除" class="button" onclick="operate('delete','<%=secondItem.getSubject_struct_id() %>')" />
									<input type="button" value="编辑" class="button" onclick="operate('edit_sub','<%=secondItem.getSubject_struct_id() %>')" />	
									<input type="button" value="新建小节" class="button" onclick="operate('create_part','<%=secondItem.getSubject_struct_id() %>','<%=secondItem.getSubject_struct_parent_id() %>')" />
									<%=secondItem.getSubject_struct_question_num() %>
								</td>
								<td style="padding:0px;<%=firstClass1 %>">
									<table cellspacing="0" border="0" style="border:0px;">
									<%
									//if(secondItem.getSubject_struct_child_num() > 0){
										int rowNum2 = 0;
										String firstClass2 = "";	
										for(int k=0;k<struList.size();k++){
											ExamSubjectStruct thirdItem = struList.get(k);
											if(thirdItem.getSubject_struct_parent_id().equals(secondItem.getSubject_struct_id()) && 
													!thirdItem.getSubject_struct_parent_id().equals(thirdItem.getSubject_struct_id())){
												rowNum2++;
												if(rowNum2==1){
													firstClass2 = "border-top:0px;";
												}else{
													firstClass2 = "";
												}
									%>
										<tr>
											<td style="border-left:0px;<%=firstClass2 %>">
												<%=thirdItem.getSubject_struct_name() %>
												<input type="button" value="删除" class="button" onclick="operate('delete','<%=thirdItem.getSubject_struct_id() %>')" />
												<input type="button" value="编辑" class="button" onclick="operate('edit_part','<%=thirdItem.getSubject_struct_id() %>')" />
											</td>
										</tr>
									<%			
											}
										}
									//}
									%>
									</table>
								</td>
							</tr>
						<%			
								}
							}
						//}
						%>
						</table>
					</td>
					<td><%=rootItem.getSubject_struct_question_num() %></td>
					<td><%=rootItem.getSubject_struct_answer_time() %></td>
					<td><input type="button" value="删除" class="button" onclick="operate('delete','<%=rootItem.getSubject_struct_id() %>')" /></td>
				</tr>
				<%
					}
				} 
				%>
			</table>
		</div>
	</div>
<!-- 添加分类 -->
<div id="addStruct" style="display:none; cursor: default"> 
<form id="form1" name="form1" action="" method="post">
	<div id="outFrame">
		<div id="list">
			<div id="title" style="background-color:white; text-align:center;">添加科目结构</div>
			
			<input type="hidden" name="subject_id" value="${subject.subject_id}" id="subject_id" />
			<input type="hidden" name="subject_struct_level" value="1" id="subject_struct_level" />
			<input type="hidden" name="primarykey_id" value="" id="primarykey_id" />
			<input type="hidden" name="flag" value="0" id="flag" />
			<table>
				<tr>
					<td align="right" width="100">分类名称：</td>
					
					<td align="left" width="224">
						<input type="text" name="subject_struct_name" maxlength="20" value="" id="subject_struct_name" class="input_1" />
					</td>
				</tr>
				<tr>
					<td align="right" width="100">试题数量：</td>
					
					<td align="left" width="224"><input type="text"
						name="subject_struct_question_num" maxlength="20" value="0" id="subject_struct_question_num"
						class="input_1" /></td>
				</tr>
				<tr>
					<td align="right" width="100">答题时间：</td>
					
					<td align="left" width="224"><input type="text"
						name="subject_struct_answer_time" maxlength="20" value="0" id="subject_struct_answer_time"
						class="input_1" /></td>
				</tr>
				<tr>
					<td align="right" width="100">顺序：</td>
					
					<td align="left" width="224"><input type="text"
						name="subject_struct_seq_num" maxlength="20" value="0" id="subject_struct_seq_num"
						class="input_1" /></td>
				</tr>
			</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="保存"  id="save_Struct" />
			</span> 
			<span id="center">
				<input type="button" class="button" value="返回" id="cancle_back" />
			</span>
		</div>

	</div>
</form>
</div>
<!-- 添加部分 -->
<div id="create_sub" style="display:none; cursor: default">
<form id="form2" name="form2" action="" method="post">
	<div id="outFrame">
		<div id="list">
			<div id="title" style="background-color:white; text-align:center;">添加科目结构-部分</div>
			<input type="hidden" name="subject_id" value="${subject.subject_id}" id="sub_subject_id" />
			<input type="hidden" name="subject_struct_parent_id" value="" id="sub_subject_struct_parent_id" />
			<input type="hidden" name="subject_struct_root_id" value="" id="sub_subject_struct_root_id" />
			<input type="hidden" name="subject_struct_level" value="2" id="sub_subject_struct_level" />
			<input type="hidden" name="sub_primarykey_id" value="" id="sub_primarykey_id" />
			<input type="hidden" name="sub_flag" value="0" id="sub_flag" />
			<table>
				<tr>
					<td align="right" width="100">部分名称：</td>
					
					<td align="left" width="224">
						<input type="text" name="subject_struct_name" maxlength="20" value="" id="sub_subject_struct_name" class="input_1" />
					</td>
				</tr>
				<tr>
					<td align="right" width="100">试题数量：</td>
					
					<td align="left" width="224"><input type="text"
						name="subject_struct_question_num" maxlength="20" value="0" id="sub_subject_struct_question_num"
						class="input_1" /></td>
				</tr>
				<tr>
					<td align="right" width="100">顺序：</td>
					
					<td align="left" width="224"><input type="text"
						name="subject_struct_seq_num" maxlength="20" value="0" id="sub_subject_struct_seq_num"
						class="input_1" /></td>
				</tr>
			</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="保存"  id="save_sub" /></span> 
			<span id="center">
				<input type="button" class="button" value="返回" id="save_sub_cancle"/>
			</span>
		</div>

	</div>
</form>
</div>

<!-- 添加小节 -->
<div id="create_part" style="display:none; cursor: default">
<form id="form3" name="form3" action="" method="post">
	<div id="outFrame">
		<div id="list">
			<div id="title" style="background-color:white; text-align:center;">添加科目结构-小节</div>
			<input type="hidden" name="subject_id" value="${subject.subject_id}" id="part_subject_id" />
			<input type="hidden" name="subject_struct_parent_id" value="" id="part_subject_struct_parent_id" />
			<input type="hidden" name="subject_struct_root_id" value="" id="part_subject_struct_root_id" />
			<input type="hidden" name="subject_struct_level" value="3" id="part_subject_struct_level" />
			<input type="hidden" name="part_primarykey_id" value="" id="part_primarykey_id" />
			<input type="hidden" name="part_flag" value="0" id="part_flag" />
			<table>
				<tr>
					<td align="right" width="100">小节名称：</td>
					
					<td align="left" width="224">
						<input type="text" name="subject_struct_name" maxlength="20" value="" id="part_subject_struct_name" class="input_1" />
					</td>
				</tr>
				<tr>
					<td align="right" width="100">顺序：</td>
					
					<td align="left" width="224"><input type="text"
						name="subject_struct_seq_num" maxlength="20" value="0" id="part_subject_struct_seq_num"
						class="input_1" /></td>
				</tr>
			</table>
		</div>
		<div id="bottomBar">
			<span id="center">
				<input type="button" class="button" value="保存"  id="save_part" />
			</span> 
			<span id="center">
				<input type="button" class="button" value="返回" id="save_part_cancle" />
			</span>
		</div>

	</div>
</form>
</div>
</body>
</html>