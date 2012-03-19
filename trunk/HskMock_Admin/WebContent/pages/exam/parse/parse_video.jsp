<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>添加解析</title>
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/main.css">
<style type="text/css">
div#outFrame a:hover {
	color: #30559c;
	border-bottom: 0px solid #ff6000;
}
div#list table td{
	padding:3px;
	border-left:#eee solid 1px;
	border-top:#eee solid 1px;
	text-align:left;
	line-height:20px;
	font-size: 14px;
}

a.player {	
	display:block;
	width:500px;
	height:340px;
	text-align:center;
	color:#000;
	text-decoration:none;
	cursor:pointer;
	background:#000 url(example/h500.png) repeat-x 0 0;
	background:-moz-linear-gradient(top, rgba(55, 102, 152, 0.9), rgba(6, 6, 6, 0.9));
	-moz-box-shadow:0 0 40px rgba(100, 118, 173, 0.5);
}
 
a.player:hover {
	background:-moz-linear-gradient(center top, rgba(73, 122, 173, 0.898), rgba(6, 6, 6, 0.898));	
}
 
/* splash image */
a.player img {
	margin-top:125px;
	border:0;	
}
 
a.player {
	margin-top:0px;
	width:475px;		
}

</style>
<script src="../js/jquery-1.7.1.js" type="text/javascript"></script>
<script src="../js/flowplayer/flowplayer-3.2.8.min.js" type="text/javascript"></script>
<script src="../js/common.js" type="text/javascript"></script>
<script type="text/javascript">

$(document).ready(function() {
	
	
});
</script>
</head>
<body>
	<div>视频信息预览:</div>
	<a class="player" id="video"></a>
	<script language='javascript'>
	$f("video", "../js/flowplayer/flowplayer-3.2.8.swf", {
		clip: {
			url:'${play}',
			scaling:'fit',
			provider:'influxis',
			autoPlay: false,
			onFinish: function(){
				//this.stop();
			}
		},
 
		plugins: {
 
			// here is our rtpm plugin configuration
			influxis: {
				url: '../js/flowplayer/flowplayer.rtmp-3.2.3.swf',
 
				// netConnectionUrl defines where the streams are found
				netConnectionUrl: 'rtmp://192.168.0.237/Hsk_Media'
			},
 
			controls: {
				url: '../js/flowplayer/flowplayer.controls-3.2.8.swf'
			}
		}
	});
	</script>

</body>
</html>