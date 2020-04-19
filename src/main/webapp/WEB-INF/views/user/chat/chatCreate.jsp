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
	width: 100px;
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
	width: 300px;
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
	padding-right: 5px;
	padding-left: 43px;
}

.inputMenu {
	border: 1px solid lightgray;
	width: 200px;
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
.count{
	width: 36px;
	height: 21px;
	border-radius: 70%;
	background:#FF5442;
	overflow: hidden;
	margin-left: 20px;
	margin-bottom: 3px;
	color:white;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/chat/chatHeader.jsp" />
	
	
	<div id="section2"
		style="background: #EEEEEE; width: 430px; height: 615px; float: left;">
	<form id="chatCreateForm" action="chatCereate.ct" method="post">	
		<table id="chatMainTable" style="width:100%;" align="center">
			<tr>
				<td colspan="3">
					<div align="center"
						style="background: white; height: 0px; width: 100%;">
						
					</div>
				</td>
			</tr>
			<tr>
				<td colspan="3" class="titleText" style="font-size:18px; padding-left: 30px; padding-bottom: 5px; color:#1E2B44">채팅방 생성</td>
			</tr>
			<tr>
				<td colspan="3">
					<div
						style="width: 90%; height: 2px; background: #1E2B44; margin: 0 auto; margin-bottom: 10px;"></div>
				</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td class="titleId" style="width:120px;">방이름</td>
				<td><input type="text" name="chatRoomName" class="inputMenu" style="width:250px;"></td>
			</tr>
			<tr height="20px;"></tr>
			<tr>
				<td colspan="3" class="titleId">참여 맴버</td>
			</tr>
			<tr height="10px;"></tr>
			<tr>
				<td colspan="2" class="titleId">
				<select class="selectDepart" style="margin-left: 40px; width: 100px; height:25px; font-size:12px;">
						<c:forEach var="d" items="${dList}">
							<option value="${d.deptNo }">${d.deptName}</option>
						</c:forEach>
				</select> <label style="margin-left: 70px; font-size: 12px;">참여 맴버</label></td>
			</tr>
			<tr>
				<td colspan="3" align="center">
					<div
						style="width: 90%; height: 280px; margint: 0 auto; margin-left: 30px;">
						<div style="width: 35%; height: 280px; border: 1px solid lightgray; background: white; margint: 0 auto; display: inline-block; overflow: auto;">
							<table id="deptMember" style="width:100%;"></table>
						</div>
						
						
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
									<td><i id="allCheckBtn" class="fas fa-angle-double-right"></i></td>
								</tr>
							</table>
						</div>
						<div style="width: 35%; height: 280px; border: 1px solid lightgray; background: white; margint: 0 auto; display: inline-block; overflow: auto;">
						    <table id="joinMember" style="width:100%;"></table>
						</div>
					</div>
				</td>
			</tr>
			<tr height="40px;"></tr>
			<tr>
				<td colspan="3">
					<button class="plusMember" id="memberPlus"
						style="margin-left: 80px;">
						<i class="fas fa-plus"></i>&nbsp;생성
					</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">
						<button type="button" class="deleteBtn">
							<i class="fas fa-ban"></i>&nbsp;취소
						</button>
				</a>
				</td>
			</tr>
		</table>
		</form>
	</div>
	<script>
		$(".selectDepart").on("change", function(){
			var deptNo = $(this).val();
			
			 $.ajax({
					url:'selectDeptMember.ct',
					type: 'post',
					data:{deptNo:deptNo},
				 success:function(data){
						$("#deptMember").empty()
					 for(key in data) {
						$("#deptMember").append("<tr><td>"+ data[key]['memberName']+ " /"+ data[key]['rankNo']+ "<input type='hidden' name='memberNo' value='"+data[key]['memberNo'] +"'></td></tr>")						 
					 }
				 }
				});
		});
		
		$("#allCheckBtn").click(function(){
			console.log($("#deptMember").html());
			$("#joinMember").append($("#deptMember").html());
			$("#deptMember").empty()
		});
	</script>
</body>
</html>