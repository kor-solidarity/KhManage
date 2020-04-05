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
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<div id="header" style="width: 100%; height: 0px; background: white;">
	</div>
	<div id="nav"
		style="width: 100px; height: 615px; background: #1E2B44; float: left">
		<table align="center">
			<tr height="20px;"></tr>
			<tr align="center">
				<td id="chatMain"><i class="far fa-comment-dots"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="20px;"></tr>
			<tr align="center">
				<td id="creatChat"><i class="fas fa-comment-medical"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="20px;"></tr>
			<tr align="center">
				<td><i class="fas fa-ellipsis-h"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
		</table>
	</div>
	<div id="section"
		style="background: #EEEEEE; width: 698px; height: 615px; float: left">
		<table id="chatMainTable" align="center" style="width: 100%;">
			<tr>
				<td>
					<div align="center"
						style="background: white; height: 50px; width: 100%;">
						<div align="right"
							style="padding-top: 12px; padding-right: 20px; color: #1E2B44; font-weight: 600;">
							<i class="far fa-comment-dots"></i>&nbsp;채팅방
						</div>
					</div>
				</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td>
					<div
						style="border: 2px solid #1E2B44; background: white; height: 70px; width: 90%; margin: 0 auto; border-radius: 10px; color: #1E2B44;">
						<label
							style="margin-left: 20px; font-weight: 600; font-size: 21px;">파이널
							프로젝트 팀방</label> <br> <br> <label
							style="margin-left: 20px; font-weight: 400; font-size: 13px;">안녕하세요~</label>
						<label
							style="float: right; margin-right: 10px; font-weight: 400; font-size: 13px;">20.04.05
							10:00</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div
						style="border: 2px solid #1E2B44; background: white; height: 70px; width: 90%; margin: 0 auto; border-radius: 10px; color: #1E2B44;">
						<label
							style="margin-left: 20px; font-weight: 600; font-size: 21px;">개발부서
							방</label> <br> <br> <label
							style="margin-left: 20px; font-weight: 400; font-size: 13px;">넵
							알겠습니다</label> <label
							style="float: right; margin-right: 10px; font-weight: 400; font-size: 13px;">20.04.03
							12:51</label>
					</div>
				</td>
			</tr>
			<tr>
				<td>
					<div
						style="border: 2px solid #1E2B44; background: white; height: 70px; width: 90%; margin: 0 auto; border-radius: 10px; color: #1E2B44;">
						<label
							style="margin-left: 20px; font-weight: 600; font-size: 21px;">동기
							팀방</label> <br> <br> <label
							style="margin-left: 20px; font-weight: 400; font-size: 13px;">하..</label>
						<label
							style="float: right; margin-right: 10px; font-weight: 400; font-size: 13px;">20.04.02
							19:20</label>
					</div>
				</td>
			</tr>

			<tr>
				<td>
					<div
						style="border: 2px solid #1E2B44; background: white; height: 70px; width: 90%; margin: 0 auto; border-radius: 10px; color: #1E2B44;">
						<label
							style="margin-left: 20px; font-weight: 600; font-size: 21px;">동기
							팀방</label> <br> <br> <label
							style="margin-left: 20px; font-weight: 400; font-size: 13px;">하..</label>
						<label
							style="float: right; margin-right: 10px; font-weight: 400; font-size: 13px;">20.04.02
							19:20</label>
					</div>
				</td>
			</tr>
			<tr height="20px;"></tr>
			<tr>
				<td>
					<div
						style="border: 2px solid #1E2B44; background: white; height: 30px; width: 90%; margin: 0 auto; border-radius: 10px; color: #1E2B44;">
						<label
							style="margin-left: 20px; font-weight: 600; font-size: 21px;">페이징영역</label>

					</div>
				</td>
			</tr>
		</table>
	</div>
	<div id="section2"
		style="background: #EEEEEE; width: 698px; height: 615px; float: left; display: none;">
		<table id="chatMainTable" align="center" style="width: 100%;">
			<tr>
				<td colspan="3">
					<div align="center"
						style="background: white; height: 50px; width: 100%;">
						<div align="right"
							style="padding-top: 12px; padding-right: 20px; color: #1E2B44; font-weight: 600;">
							<i class="fas fa-comment-medical"></i>&nbsp;채팅 방 생성
						</div>
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="titleText">채팅방 생성</td>
			</tr>
			<tr>
				<td colspan="3">
					<div
						style="width: 90%; height: 2px; background: #1E2B44; margin: 0 auto; margin-bottom: 10px;"></div>
				</td>
			</tr>
			<tr>
				<td class="titleId">방이름</td>
				<td><input type="text" class="inputMenu"></td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td colspan="3" class="titleId">참여 맴버</td>
			</tr>
			<tr>
				<td colspan="2" class="titleId"><select class="selectDepart"
					style="margin-left: 80px; width: 150px;">
						<option>부서</option>
				</select> <label style="margin-left: 110px; font-size: 14px;">참여 맴버</label></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<div
						style="width: 90%; height: 280px; margint: 0 auto; margin-left: 30px;">
						<div
							style="width: 35%; height: 280px; border: 1px solid lightgray; background: white; margint: 0 auto; display: inline-block; overflow: auto;"></div>
						<div align="center"
							style="width: 5%; height: 280px; margint: 0 auto; display: inline-block">
							<table>
								<tr height="70px;"></tr>
								<tr>
									<td><i class="fas fa-angle-double-left"></i></td>
								</tr>
								<tr>
									<td style="padding-left: 4px;"><i
										class="fas fa-angle-left"></i></td>
								</tr>
								<tr>
									<td style="padding-left: 4px;"><i
										class="fas fa-angle-right"></i></td>
								</tr>
								<tr>
									<td><i class="fas fa-angle-double-right"></i></td>
								</tr>
							</table>
						</div>
						<div style="width: 35%; height: 280px; border: 1px solid lightgray; background: white; margint: 0 auto; display: inline-block; overflow: auto;"></div>

					</div>
				</td>
			</tr>
			<tr height="20px;"></tr>
			<tr>
				<td colspan="3">
					<button class="plusMember" id="memberPlus" style="margin-left: 120px;">
						<i class="fas fa-plus"></i>&nbsp;생성
					</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">
						<button class="deleteBtn">
							<i class="fas fa-ban"></i>&nbsp;취소
						</button>
				</a>
				</td>
			</tr>
		</table>
	</div>
	<script>
		$("#creatChat").click(function(){
			$("#section").hide();
			$("#section2").show();
			
		});
		$("#chatMain").click(function(){
			$("#section2").hide();
			$("#section").show();
		});
	</script>

</body>
</html>