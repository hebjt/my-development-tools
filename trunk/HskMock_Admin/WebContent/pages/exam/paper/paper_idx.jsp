<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title></title>
<script type="text/javascript">

</script>
</head>
  <frameset cols="280,*" frameborder="1" border="6" framespacing="5" bordercolor="#80b5d7">
    <frame src="questions_left.action?subject_id=${subjectId}&paper_id=${paperId}" name="leftFrame" scrolling="auto">
    <frame src="questions_main.action?id=0&level=0" name="questionFrame" scrolling="auto" id="questionFrame">
  </frameset>
<body>
<form name="listform" id="listform"></form>

</body>
</html>