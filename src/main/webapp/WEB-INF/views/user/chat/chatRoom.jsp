<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
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


	.msg_cotainer{
		margin-top: auto;
		margin-bottom: auto;
		margin-left: 10px;
		border-radius: 5px;
		background-color: #24415C;
		padding: 10px;
		color:white;
		position: relative;
		left: 30px;
		bottom: 13px;
		max-width: 250px;
	}
	
	.msg_cotainer:after {
	 border-top:12px solid #24415C;
	 border-left: 15px solid transparent;
	 border-right: 10px solid transparent;
	 border-bottom: 0px solid transparent;
	 content:"";
	 position:absolute;
	 top:10px;
	 left:-15px;
	 bottom: 15px;
	}
	.msg_cotainer_send{
		margin-top: 5px;
		margin-bottom: auto;
		margin-right: 10px;
		border-radius: 5px;
		background-color: orange;
		color:white;
		padding: 10px;
		position: relative;
		max-width: 300px;
	}
	.msg_time{
		position: absolute;
		left: 0;
		bottom: -15px;
		color: black;
		font-size: 5px;
		width:80px;
	}
	.msg_time_send{
		position: absolute;
		right:0;
		bottom: -15px;
		color: black;
		font-size: 10px;
		width:70px;
	}
	.box {
	width: 40px;
	height: 40px;
	border-radius: 40%;
	overflow: hidden;
	margin-left: 5px;
	margin-top:20px;
	display: inline-block;
}
.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}




</style>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<link rel="stylesheet" href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.css"/>">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<script src="${path }/resources/js/chatsocket.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/malihu-custom-scrollbar-plugin/3.1.5/jquery.mCustomScrollbar.min.js"></script>

</head>
<body>
<c:set var="path" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<div id="header" style="width: 100%; height: 0px; background: white;">
	</div>
	<div id="nav"
		style="width: 70px; height: 615px; background: #1E2B44; float: left">
		<table align="center">
			<tr height="15px;"></tr>
			<tr align="center">
				<td id="chatMain"><i class="far fa-comment-dots"
					onclick="location.href='showChatPage.ct'"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="15px;"></tr>
			<tr align="center">
				<td id="creatChat"><i class="fas fa-comment-medical"
					onclick="location.href='showCreatChat.ct'"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="15px;"></tr>
			<tr align="center">
				<td><i class="fas fa-ellipsis-h" id="userList" data-toggle="modal" data-target="#exampleModal"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
		</table>
	</div>
	<div id="section"
		style="background: #EEEEEE; width: 430px; height: 598px; float: left;">
		<label style="margin-left: 23px; margin-bottom: 10px; margin-top: 10px;">${cr.chatRoomName} (${cr.count}명)</label>
		
		<!-- 채팅 영역 -->
		<div id="chatArea" style="width:90%; height:420px; background:white; border:2px solid #1E2B44; border-radius:10px; margin:0 auto; overflow: auto;">
		<table id="chatAreaTable" style="width:100%">
			<c:forEach var="a" items="${list}">
				<c:if test="${a.memberNo eq loginUser.memberNo}">
				<tr>	
					<td colspan="2">
						<div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send'>${a.content}<span class='msg_time_send'>${a.sendDate}</span></div></div>	
					</td>	
				</tr>		
					</c:if>
					<c:if test="${a.memberNo != loginUser.memberNo}">
					<tr>
						<td style="width:50px;">
						<div class='box' style='background:white;'><img class='profile' src="<c:url value="/resources/uploadFiles/${a.changeName}"/>.png"></div>
						</td>
						<td>
						<div style="display: inline-flex; font-weight:600; font-size:12px;">${a.memberName }</div>
						</td>
					</tr>	
					<tr>	
						<td colspan="2">
						<div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'>${a.content}<br><span class='msg_time'>${a.sendDate}</span></div> </div> 
						</div>
						</td>
					</tr>	
					</c:if>
			</c:forEach>
	</table>
	  <div>
        <input type="text" id="sender" value="test" style="display: none;">
    </div>
    <!-- <div>
        <button type="button" onclick="closeSocket();">Close</button>
    </div> -->
    <!-- Server responses get written here -->
    <div id="messages"></div>


		</div>
		
		
		<!-- 채팅영역 끝 -->
		
		<div style="width:90%; height:90px; background:white; border:2px solid #1E2B44; border-radius:5px; margin:0 auto; margin-top: 5px;">
			<textarea id="chatContent" class="chatContent" style="resize:none; width:85%; height:73%; border:none; outline:none; overflow:hidden; border-bottom: 2px solid #EEEEEE;"></textarea>
			
			<input type="button" id="sendBtn"  onclick="send();" value="전송" style="background:#1E2B44; border:1px solid #1E2B44; color:white; width:15%; height:100%; float:right; outline:none;">
			
			<i class="fas fa-paperclip" id="fileUpload" style="margin-left: 7px;"></i> <input type="file" id="file" style="display:none;">
		</div>
		
		
	</div>	

		
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        ...
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Save changes</button>
      </div>
    </div>
  </div>
</div>
	<script type="text/javascript">
       var date;
        function send(){
        	if($("#chatContent").val() != ""){
        	 $.ajax({
					url:'selectDate.ct',
					type: 'post',
					async: false,
					data:{},
				 success:function(data){
					date = data;
				 }
				}); 
            var text=document.getElementById("chatContent").value + "," + "${cr.chatRoomNo}"+ "," + "${loginUser.memberNo}" + "," + "텍스트" + "," + "${loginUser.memberName}" + "," + date + "," + "${loginUser.changeName}";
        	var text1 = text.split(",");
        	//내용
        	var content = text1[0];
        	//메세지 보낸 거에 해당하는 방 번호
        	var chatNo = text1[1];
        	//보낸 사람
        	var memberNo = text1[2];
        	var memberName = text1[4];
        	 $.ajax({
					url:'insertMessage.ct',
					type: 'post',
					async: false,
					data:{message:text},
				 success:function(data){
				 }
				});
		            $("#chatAreaTable").append("<tr><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send'>"+content+"<span class='msg_time_send'>"+date+"</span></div></div></td></tr>");
		            $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		            ws.send(text);
		            str = $("#chatContent").val("");
		            text="";
        	
        	}
        }
        $(function(){
        	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
        });
        function closeSocket(){
            ws.close();
        }
        function writeResponse(text){
        	var text1 = text.split(",");
        	//내용
        	var content = text1[0];
        	//메세지 보낸 거에 해당하는 방 번호
        	var chatNo = text1[1];
        	//보낸 사람
        	var memberNo = text1[2];
        	var memberName = text1[4];
        	var date = text1[5];
        	var changeName = text1[6];
			
        	//지금 내가 들어와 있는 방 번호
        	var chatNo2 = "${cr.chatRoomNo}";
        	console.log(chatNo2);
     		if(chatNo2 == chatNo){
        	$("#chatAreaTable").append("<tr><td style='width:50px;'><div class='box' style='background:white;'><img class='profile' src='/manage/resources/uploadFiles/"+changeName+".png'></div></td><td><div style='display: inline-flex; font-weight:600; font-size:12px;'>"+memberName+"</div></td></tr><tr><td colspan='2'><div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'>"+content+"<br><span class='msg_time'>"+date+"</span></div></div></div></td></tr>");
        	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
     		}
        }

</script>

	<script>
        var str ="";   
    $("#userList").click(function(){
		$('#myModal').modal('show');
	})
	
	$("#fileUpload").click(function(){
		$("#file").click();
	})
	
	$("#sendBtn").click(function(){
		str = $("#chatContent").val();
	});
    $("#chatContent").keydown(function(event){
    	if(event.keyCode == '13' && !event.shiftKey){
    		str = $("#chatContent").val();
    		console.log("엔터키 : " + str)
			send();
    	}else if(event.keyCode == '13' && event.shiftKey){
    		str += '/n';
    	}
    });
	
  </script>

</body>
</html>