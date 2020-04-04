<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<style>
html {
	margin: 0;
	padding: 0;
	overflow-x:hidden; 
	overflow-y:hidden;

}

body {
	margin: 0;
	padding: 0;
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
	border-radius:5px;
}

.titleBar {
	width: 500px;
	height: 30px;
	background: #EEEEEE;
}

.imgArea {
}
</style>
</head>
<body>
	<div style="display:inline-block;">
		<table id="chatTable">
			<tr height="20px;"></tr>
			
			<tr>
				<td class="imgArea" align="center" style="height: 95px;"><label
					style="color: white; font-weight: 600; font-size: 40px;"><i
						class="far fa-comment-dots"></i></label></td>
			</tr>
			<tr>
				<td class="imgArea" align="center"><label
					style="color: white; font-weight: 600; font-size: 42px;"><i class="far fa-plus-square"></i></label></td>
			</tr>
		</table>
	</div>
	<div style="display:inline-block;">
		<table id="chatArea">
			<tr>
				<td class="imgArea" style="height:60px;">
					<div align="right" style="background:white; width:100%; font-size:20px; height:50px; color:#1E2B44; font-weight:600;">
						<div style="padding-top:6px; padding-right: 10px"><i class="far fa-comment-dots"></i>&nbsp;&nbsp;채팅방 목록</div>
					</div>
				</td>
			</tr>
			</table>
			<table style="display:inline-block;">	
			<tr>
				<td class="imgArea1" style="border-radius:10px;">
					<div align="left" style="background:#1E2B44; border-radius:5px; width:100%; font-size:16px; height:60px; color:white;">
						<div style="padding-top:6px; padding-left:5px">
							파이널 프로젝트 팀
						</div>
						<div style="padding-top:6px; font-size:11px; padding-left:5px">
							안녕하세요~
						</div>
					</div>
				</td>
			</tr>	
			<tr>
				<td class="imgArea1" style="border-radius:10px;">
					<div align="left" style="background:#1E2B44; border-radius:5px; width:100%; font-size:16px; height:60px; color:white;">
						<div style="padding-top:6px; padding-left:5px">
							파이널 프로젝트 팀
						</div>
						<div style="padding-top:6px; font-size:11px; padding-left:5px">
							안녕하세요~
						</div>
					</div>
				</td>
			</tr>			
		</table>
	</div>
</body>
</html>