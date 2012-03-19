<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="../css/dtree.css">
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script src="../js/dtree.js" type="text/javascript"></script>
</head>
<body>

<form name="listform" method="post" id="listform">

<div class="dtree" style="font-size: 14px;" id="tree">
	<div style="padding:5px;padding-left:2px;">
		<a href="javascript: d.openAll();">展开</a> |
		<a href="javascript: d.closeAll();">合并</a>
	</div>
	<script type="text/javascript">
		d = new dTree('d');
		d.add('00',-1,'');
	</script>
	<c:forEach items="${treeNodes}" var="node">
	
		<script>				
			//d.add('本身ID','父ID','显示名称','显示类型');
			
			if('${node.subject_struct_parent_id}' == '${node.subject_struct_id}'){
				d.add('${node.subject_struct_id}','00','${node.subject_struct_name}','questions_main.action?id=${node.subject_struct_id}&level=${node.subject_struct_level}&paper_id=${paperId}','${node.subject_struct_name}','questionFrame');
			}else{
				d.add('${node.subject_struct_id}','${node.subject_struct_parent_id}','${node.subject_struct_name}','questions_main.action?id=${node.subject_struct_id}&level=${node.subject_struct_level}&paper_id=${paperId}','${node.subject_struct_name}','questionFrame');
				
			}		
		</script>

	</c:forEach>
	<script>
	document.write(d);
	</script>
</div>

</form>
</body>
</html>