<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>唐风汉语HSK模拟考试管理系统</title>
</head>
<frameset rows="38,*,24"  frameborder="1" border="6" framespacing="5" bordercolor="#80b5d7" name="topSet">
	<frame name="topFrame" scrolling="NO" noresize src="top.action" frameborder="0">
	<frameset rows="*" cols="220,*" name="middleSet" frameborder="1">
		<frame name="leftFrame" src="left.action" frameborder="1">
		<frame id="mainFrame" name="mainFrame" src="welcome.action" frameborder="1">
	</frameset>
	<frame name="bottomFrame" scrolling="NO" noresize src="bottom.action" frameborder="0">
</frameset>
<noframes>
	<body bgcolor="#FFFFFF" text="#000000">
	</body>
</noframes>
</html>