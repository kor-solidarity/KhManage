<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
html {
	margin: 0;
	padding: 0;
	overflow-x: hidden;
	overflow-y: hidden;
}

body {
	margin: 0;
	padding: 0;
}

#createChatTable {
	width: 80px;
	height: 616px;
	border-collapse: collapse;
	border-spacing: 0;
	background: #1E2B44;
	display: none;
}

#chatTable {
	width: 80px;
	height: 616px;
	border-collapse: collapse;
	border-spacing: 0;
	background: #1E2B44;
}

#chatArea {
	width: 420px;
	height: 616px;
	border-collapse: collapse;
	border-spacing: 0;
	background: #EEEEEE;
	border-radius: 5px;
}

.titleBar {
	width: 500px;
	height: 30px;
	background: #EEEEEE;
}

.titleText {
	padding-top: 13px;
	padding-left: 40px;
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
}

.titleId {
	color: #5E738B;
	font-weight: 600;
	font-size: 15px;
	padding-right: 10px;
	padding-left: 43px;
}

.inputMenu {
	border: 1px solid lightgray;
	width: 500px;
	height: 27px;
	outline: none;
	border-radius: 5px;
}

.selectDepart {
	width: 150px;
	height: 25px;
	border: 2px solid lightgray;
	border-radius: 5px;
}
.plusMember {
	width: 60px;
	height: 25px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 12px;
}
.deleteBtn {
	width: 60px;
	height: 25px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 12px;
}
</style>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div id="header" style="width: 100%; height: 0px; background: white;">
	</div>
	<div id="nav"
		style="width: 70px; height: 615px; background: #1E2B44; float: left">
		<table align="center">
			<tr height="20px;"></tr>
			<tr align="center">
				<td id="chatMain"><i class="far fa-comment-dots" onclick="location.href='showChatPage.ct'"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="20px;"></tr>
			<tr align="center">
				<td id="creatChat"><i class="fas fa-comment-medical" onclick="location.href='showCreatChat.ct'"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
		</table>
	</div>
</body>
</html>