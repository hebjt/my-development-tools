<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Left Tree</title>
<link rel="stylesheet" href="../css/admin.css">
<style>
	body {
		border:0px;margin:0px;padding:0px;
	}

	.wrapper {
		padding:5px; text-align:center; margin:0 auto;
	}
	
	#treeMenu {
		font-size:14px; text-align:left;
	}
	
	#treeFrame {
		padding:10px;
	}
	
	#treeCtrl{
		font-size:14px; text-align:left;
		margin-bottom:5px;
	}
	
	#treeCtrl a {
		color:#333;
	}

</style>
    <link rel="stylesheet" href="../js/jquery.treeview/jquery.treeview.css" />
    <script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
    <script src="../js/jquery.treeview/jquery.treeview.js" type="text/javascript"></script>
    <script type="text/javascript">
		$(document).ready(function(){
			$("#treeMenu").treeview({
				control:"#treeCtrl"
			});
		});
    </script>
</head>
<body>
	<div class="wrapper">
		<div id="treeFrame">
			<div id="treeCtrl"><a href="?#">全部关闭</a> | <a href="?#">全部打开</a></div>
			<ul id="treeMenu" class="filetree">
				<li><span class="folder"><strong>考试管理</strong></span>
					<ul>
						<li><span class="file"><a href="../subject/subType.action" target="mainFrame">科目类型</a></span></li>
						<li><span class="file"><a href="../subject/subState.action" target="mainFrame">科目状态</a></span></li>					
						<li><span class="file"><a href="../subject/sub.action" target="mainFrame">科目管理</a></span></li>
						<li><span class="file"><a href="../examPaper/showList.action" target="mainFrame">试卷管理</a></span></li>
						<li><span class="file"><a href="../parse/parseList.action" target="mainFrame">试卷解析</a></span></li>
						<li><span class="file"><a href="../examPaper/show_publish.action" target="mainFrame">试卷发布</a></span></li>
					</ul>
				</li>
				<li><span class="folder"><strong>用户管理</strong></span>
					<ul>
						<li><span class="file"><a href="../user/user.action" target="mainFrame">学生管理</a></span></li>
						<li><span class="file"><a href="#">测试节点</a></span></li>
					</ul>
				</li>
				<li><span class="folder"><strong>资源权限管理</strong></span>
					<ul>
						<li><span class="file"><a href="#">测试节点</a></span></li>
						<li><span class="file"><a href="#">测试节点</a></span></li>
					</ul>
				</li>					
			</ul>
		</div>
	</div>
</body>
</html>