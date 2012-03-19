<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script type="text/javascript">
	$(document).ready(function() {

	});
	function operate(str, id) {
		if (str == "create") {
			var subject_id = $("#subject_id").val();
			//alert(subject_id);
			wopen("add_substru.action?subject_id=" + subject_id, "", 400, 300);
		} else if (str == "delete") {
			document.listform.action = "../substrut/substrut_delete.action";
			document.listform.submit();
		} else if (str == "edit") {
			document.listform.id.value = id;
			wopen("../substrut/substrut_edit.action?id=" + id, "", 400, 300);
		} else if (str == "list") {
			document.listform.start.value = 1;
			document.listform.action = "../substrut/substrut_list.action";
			document.listform.submit();
		} else if (str == "create_sub") {
			var parent_id = id;
			//alert(parent_id);
			wopen("create_subpart.action?parent_id=" + parent_id, "", 400, 300);
		} else if (str == "create_part") {
			var parentId = id;
			alert(parentId);
			wopen("create_subpart_second.action?parent_id=" + parentId, "", 400, 300);
		}else if (str == "edit_sub") {
			wopen("../substrut/substrut_editsub.action?id=" + id, "", 400, 300);
		} else if (str == "del_sub") {
			document.listform.action = "../substrut/substrut_delsub.action?id="
					+ id;
			document.listform.submit();
		}
	}
</script>
</head>

<body style="overflow-x: hidden">

	<form id="form1" name="form1" action="" method="post">
		<input type="hidden" name="subject_id" id="subject_id"
			value="${subjectId}" />
		<div id="outFrame">
			<div id="list">
				<div id="title" style="background-color:white;text-align: center">HSKMock模拟考试-科目结构</div>
				<div id="topBar">
					<span id="center"><input type="button" value="删除分类" onclick="operate('delete');" /></span> 
					<span id="center"><input type="button" value="新建分类" onclick="operate('create','');" /></span>
				</div>
				<table cellspacing="0" border="0">
					<tr>
						<td width="6%"><input type="checkbox" name="chkall" onclick="chkAll(this)" /></td>
						<td colspan="2">考试内容</td>
						<td>试题数量（个）</td>
						<td>考试时间（分钟）</td>
					</tr>
				
				<c:forEach items="${struList}" var="rootItem">
					<c:if test="${rootItem.subject_struct_parent_id==rootItem.subject_struct_id}">
						<tr>
							<td>&nbsp;</td>
							<td>${rootItem.subject_struct_name}</td>
							<td style="padding:0px;">
								<table cellspacing="0" border="0" style="border:0px;">
								<c:forEach items="${struList}" var="secondItem" varStatus="status1">
									<c:if test="${secondItem.subject_struct_parent_id==rootItem.subject_struct_id and secondItem.subject_struct_parent_id!=secondItem.subject_struct_id}">
										<tr>
											<c:forEach begin="1" end="1" var="i">
												<c:if test="${i==1}">
													
													<td style="border-left:0px;border-top:0px;">${secondItem.subject_struct_name}</td>
													
												</c:if>
												<c:if test="${i!=1}">
													<td style="border-left:0px;">
														${secondItem.subject_struct_name}
													</td>
												</c:if>
													
											</c:forEach>

											<td style="padding:0px;">
												<table cellspacing="0" border="0" style="border:0px;">
												<c:forEach items="${struList}" var="thirdItem" varStatus="status2">
													<c:if test="${thirdItem.subject_struct_parent_id==secondItem.subject_struct_id and thirdItem.subject_struct_parent_id!=thirdItem.subject_struct_id}">
													<c:forEach begin="1" end="1" var="i">
														<c:if test="${i==1}">
															<tr>
																<td style="border-left:0px;border-top:0px;">${thirdItem.subject_struct_name}</td>
															</tr>
														</c:if>
														<c:if test="${i!=1}">
															<tr>
																<td style="border-left:0px;">${thirdItem.subject_struct_name}</td>
															</tr>
														</c:if>
													
													</c:forEach>

													</c:if>
												</c:forEach>
												</table>
											</td>
										</tr>
									</c:if>
								</c:forEach>
								</table>
							</td>
							<td>${rootItem.subject_struct_question_num}</td>
							<td>${rootItem.subject_struct_answer_time}</td>
						</tr>
					</c:if>
				</c:forEach>

			</table>
			</div>
		</div>

	</form>



				<!-- 
				<c:forEach items="${struList}" var="rootItem">
					<c:if test="${rootItem.subject_struct_parent_id==rootItem.subject_struct_id}">
						<tr>
							<td>&nbsp;</td>
							<td>${rootItem.subject_struct_name}</td>
							<td style="padding:0px;">
								<table cellspacing="0" border="0" style="border:0px;">
								<c:forEach items="${struList}" var="secondItem" varStatus="status1">
									<c:if test="${secondItem.subject_struct_parent_id==rootItem.subject_struct_id and secondItem.subject_struct_parent_id!=secondItem.subject_struct_id}">
										<tr>
											<td style="border-left:0px;" <c:if test="${status1.first}">class="firstRow"</c:if>>
												${secondItem.subject_struct_name}
											</td>
											<td style="padding:0px;" <c:if test="${status1.first}">class="firstRow"</c:if>>
												<table cellspacing="0" border="0" style="border:0px;">
												<c:forEach items="${struList}" var="thirdItem" varStatus="status2">
													<c:if test="${thirdItem.subject_struct_parent_id==secondItem.subject_struct_id and thirdItem.subject_struct_parent_id!=thirdItem.subject_struct_id}">
														<tr>
															<td style="border-left:0px;" <c:if test="${status2.first}">class="firstRow"</c:if>>${thirdItem.subject_struct_name}</td>
														</tr>
													</c:if>
												</c:forEach>
												</table>
											</td>
										</tr>
									</c:if>
								</c:forEach>
								</table>
							</td>
							<td>${rootItem.subject_struct_question_num}</td>
							<td>${rootItem.subject_struct_answer_time}</td>
						</tr>
					</c:if>
				</c:forEach>
				 -->

</body>
</html>