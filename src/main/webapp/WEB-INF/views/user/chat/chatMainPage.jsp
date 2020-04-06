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
<link rel="stylesheet"
	href="<c:url value="/resources/assets/vendor/linearicons/style.css"/>">
<link rel="stylesheet"
	href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.css"/>">
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

.roomSearch {
	width: 200px;
	height: 30px;
	border: 1px solid lightgray;
	border-radius: 10px;
	outline: none;
}

.box {
	width: 70px;
	height: 70px;
	border-radius: 30%;
	overflow: hidden;
	margin-left: 20px;
	margin-bottom: 3px;
}

.count {
	width: 36px;
	height: 21px;
	border-radius: 70%;
	background: #FF5442;
	overflow: hidden;
	margin-left: 20px;
	margin-bottom: 3px;
	color: white;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/chat/chatHeader.jsp" />
	<div id="section"
		style="background: #EEEEEE; width: 437px; height: 175px; float: left;">
		<table id="chatMainTable" align="center" style="width: 100%;">
			<tr height="5px;"></tr>
			<tr>
				<td colspan="3">
					<div
						style="background: white; height: 90px; width: 100%; margin: 0 auto; border-bottom: 2px solid white; color: #1E2B44;">
						<label
							style="font-size: 18px; color: #1E2B44; font-weight: 600; margin-bottom: 10px; margin-left: 10px; margin-top: 5px;">메신저</label><br>
						<div class="input-group" style="width: 400px; height: 30px;"
							align="center">
							<input type="text" value="" class="form-control"
								placeholder="채팅방 찾기"
								style="margin-left: 40px; border: 1px solid #1E2B44;"> <span
								class="input-group-btn"><button type="button"
									style="background: #1E2B44; border: 1px solid #1E2B44; margin-left: 40px;"
									class="btn btn-primary">
									<i class="fas fa-search"></i>
								</button></span>
						</div>
					</div>
				</td>
			</tr>
			<tr height="5px;"></tr>
			<tr>
				<td style="width: 110px; border-bottom: 4px solid white;">
					<div class="box" style="background: white;">
						<img class="profile"
							src="<c:url value="/resources/img/profile.png"/>">
					</div>
				</td>
				<td align="center"
					style="width: 120px; border-bottom: 4px solid white;">UI/UX개발
					1팀 / 팀장</td>
				<td align="center"
					style="width: 120px; border-bottom: 4px solid white;">김태원</td>
			</tr>
		</table>
	</div>
	<label style="margin-top: 8px; margin-left: 7px;">나의 채팅방</label>
	<div
		style="background: white; width: 437px; height: 400px; display: inline-block; overflow: auto;">
		
		<table id="chatMain" align="center" style="width: 100%;">
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: #EEEEEE; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="2">
					<div class="count" align="center">3</div>
				</td>
				<td style="background: #EEEEEE; height: 60px; width: 150px;"><label>파이널
						프로젝트팀</label><br> 안녕하세요~</td>
				<td
					style="background: #EEEEEE; height: 60px; width: 90px; font-size: 12px;">20.04.01
					20:11</td>
			</tr>
			<tr height="5px;" style="background: white;"></tr>
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: #EEEEEE; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="3">
					<div class="count" align="center">1</div>
				</td>
				<td style="background: #EEEEEE; height: 60px; width: 150px;"><label>개발부서
						동기팀</label><br> 하..</td>
				<td
					style="background: #EEEEEE; height: 60px; width: 90px; font-size: 12px;">20.04.03
					12:58</td>
			</tr>

			<tr height="5px;" style="background: white;"></tr>
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: #EEEEEE; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="4">
				
				</td> 
				<td style="background: #EEEEEE; height: 60px; width: 150px;">
				<label>같은 팀</label><br> 이게 뭐지</td>
				<td style="background: #EEEEEE; height: 60px; width: 90px; font-size: 12px;">20.04.06 10:35</td>
			</tr>

			<tr height="5px;" style="background: white;"></tr>
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: #EEEEEE; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="5">
					<div class="count" align="center">300+</div>
				</td>
				<td style="background: #EEEEEE; height: 60px; width: 150px;"><label>개발
						프로젝트팀</label><br> 그럼 이렇게 진행하겠습니다~</td>
				<td
					style="background: #EEEEEE; height: 60px; width: 90px; font-size: 12px;">20.04.06
					19:43</td>
			</tr>

			<tr height="5px;" style="background: white;"></tr>
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: #EEEEEE; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="6">
					<div class="count" align="center">3</div>
				</td>
				<td style="background: #EEEEEE; height: 60px; width: 150px;"><label>파이널
						프로젝트팀</label><br> 안녕하세요~</td>
				<td
					style="background: #EEEEEE; height: 60px; width: 90px; font-size: 12px;">20.04.01
					20:11</td>
			</tr>

			<tr height="5px;" style="background: white;"></tr>
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: #EEEEEE; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="7">
					<div class="count" align="center">3</div>
				</td>
				<td style="background: #EEEEEE; height: 60px; width: 150px;"><label>파이널
						프로젝트팀</label><br> 안녕하세요~</td>
				<td
					style="background: #EEEEEE; height: 60px; width: 90px; font-size: 12px;">20.04.01
					20:11</td>
			</tr>
			<tr height="5px;"></tr>
		</table>
	</div>

	<script>
		$(function() {
			$(".chatRoom").on('click', function() {
				location.href='chatRoom.ct';
			});
		});
	</script>
</body>
</html>