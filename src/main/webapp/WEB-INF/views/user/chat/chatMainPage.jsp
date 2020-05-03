<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
	width:30px;
	height: 22px;
	border-radius: 10px;
	background: #1E2B44;
	overflow: hidden;
	margin-left: 20px;
	margin-bottom: 3px;
	color: white;
	font-size:11px;
	line-height: 22px;
	font-weight:600;
}

.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="${path }/resources/js/chatsocket.js"></script>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/chat/chatHeader.jsp" />
	<div id="section"
		style="background: #EEEEEE; width: 430px; height: 175px; float: left;">
		<table id="chatMainTable" align="center" style="width: 100%;">
			<tr height="5px;"></tr>
			<tr>
				<td colspan="3">
					<div
						style="background: #EEEEEE; height: 90px; width: 100%; margin: 0 auto; border-bottom: 2px solid white; color: #1E2B44;">
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
				<td style="width: 110px; border-bottom: 4px solid white; background:#EEEEEE; color:white;">
					<div class="box" style="background:white;">
						<img class="profile"
							src="<c:url value="/resources/uploadFiles/${loginUser.changeName}"/>">
					</div>
				</td>
				<td align="center"
					style="width: 120px; border-bottom: 4px solid white; background:#EEEEEE; color:black;"> ${loginUser.deptName}/ ${loginUser.rankName}</td>
				<td align="center"
					style="width: 120px; border-bottom: 4px solid white; background:#EEEEEE; color:black;">${loginUser.memberName }</td>
			</tr>
		</table>
	</div>
	<label style="margin-top: 8px; margin-left: 7px;">나의 채팅방</label>
	<div id="chatMainDiv" style="background: #EEEEEE; width: 430px; height: 400px; display: inline-block; overflow: auto;">
		<table id="chatMain" align="center" style="width: 100%;">
		<tr height="3px;" style="background: white;"></tr>
			<c:forEach var="a" items="${list}">
			<tr class="chatRoom" style="margin-bottom: 5px;">
				<td style="background: white; height: 60px; width: 90px;"> <input class="chatNo" type="hidden" value="${a.chatRoomNo}">
					<c:if test="${a.count != 0 }">
					 <div class="count" align="center">${a.count }</div> 
					 </c:if>
				</td>
				<td style="background: white; height: 60px; width: 150px; color:black;"><label>${a.chatRoomName}</label><br>${fn:substring(a.recentMessage,0,10)}</td>
				<td
					style="background: white; height: 60px; width: 90px; color: black; font-size: 12px;">${a.date}</td>
			</tr>
			<tr height="3px;" style="background: white;"></tr>
			</c:forEach>
		</table>
	</div>

	<script>
		 $(function() {
			$(".chatRoom").on('click', function() {
				console.log($(this).find('.chatNo').val())
				var cr = $(this).find('.chatNo').val();
				ws.send("ss");
				location.href='chatRoom.ct?chatRoomNo='+cr;
			});
		});
		 
		$("#addchatRoom").click(function(){
			$("#chatMain").append("<tr class='chatRoom' style='margin-bottom: 5px;'> <td style='background: #24415C; height: 60px; width: 90px; color:white;'> <input class='chatNo' type='hidden' value='3'> <div class='count' align='center'>1</div> </td> <td style='background: #24415C; height: 60px; width: 150px; color:white;'><label>개발부서 동기팀</label><br> 하..</td> <td style='background: #24415C; height: 60px; width: 90px; font-size: 12px; color:white;'>20.04.03 12:58</td> </tr>")
		});
		
		 function writeResponse(text){
			   $.ajax({
					url:'selectChatList.ct',
					type: 'post',
					async: false,
					data:{message:text},
				 success:function(data){
					 console.log(data);
				 }
				});  
				location.reload();
		 }
		/*  $("#chatMainDiv").children().find(".chatRoom").on({
			 mousedown: function(event) {
			      drag_x1 = event.offsetX;
			    },
			    mouseup: function(event) {
			      if(event.offsetX - drag_x1 > 200) {
			      	console.log("드래그");
			      	 $(this).html(html);
			      }
			      if(event.offsetX - drag_x1 < -200) {
			    	  console.log($(this).html());
			    	  html = $(this).html();
			    	  
			    	 $(this).html("<td style='background: white; height: 60px; width: 90px;'> </td><td style='background: white; height: 60px; width: 150px; color:black;'><label></label><br></td><td style='background: white; height: 60px; width: 90px; color: black; font-size: 12px;'>삭제하기</td>");
			    	 
			      }
			    }
		 }); */
	</script>
	
</body>
</html>