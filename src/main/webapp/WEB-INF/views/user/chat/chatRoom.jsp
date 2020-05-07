<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
.swal-button--danger{
	background: #1E2B44;
}
.swal-modal{
	width:350px !important;
	font-size:18px !important;
}
.swal-title{
	font-size:18px !important;
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
		background-color: skyblue;
		color:white;
		padding: 10px;
		position: relative;
		max-width: 250px;
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
		width:30px;
		font-weight:400;
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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
				<td id="chatMain"><i class="far fa-comment-dots" id="showChatMain"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="15px;"></tr>
			<tr align="center">
				<td id="creatChat"><i class="fas fa-comment-medical"
					onclick="location.href='showCreatChat.ct'"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
			<tr height="18px;"></tr>
			<tr align="center">
				<td><i class="fas fa-user-plus" id="userList" data-toggle="modal" data-target="#memberPlus"
					style="color: white; font-size: 30px;"></i></td>
			</tr>
			
			<tr height="15px;"></tr>
			<tr align="center">
				<td><i class="fas fa-ellipsis-h" id="userList" data-toggle="modal" data-target="#exampleModal"
					style="color: white; font-size: 34px;"></i></td>
			</tr>
		</table>
		<script>
			$("#showChatMain").click(function(){
				location.href='showChatPage.ct';
			});
		</script>
	</div>
	<div id="section"
		style="background: #EEEEEE; width: 430px; height: 598px; float: left;">
		<div style="margin-left: 23px; margin-bottom: 5px; margin-top: 10px;">${cr.chatRoomName}(<label id="memberCount">${cr.count}</label>명)</div>
		
		<!-- 채팅 영역 -->
		<div id="chatArea" style="width:90%; height:420px; background:white; border:2px solid #1E2B44; border-radius:10px; margin:0 auto; overflow: auto; overflow-x:hidden">
		<table id="chatAreaTable" style="width:100%">
			<c:forEach var="a" items="${list}">
				<c:if test="${a.memberNo eq loginUser.memberNo}">
				<c:if test="${a.memberNo != 'M999' && a.contentType == '텍스트'}">
				<tr>	
					<td colspan="2">
						<div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send'>${a.content}<span class='msg_time_send'>${fn:substring(a.sendDate,8,14)}</span></div></div>	
					</td>	
				</tr>		
				</c:if>
				<c:if test="${a.memberNo != 'M999' && a.contentType == '첨부파일'}">
				<tr>	
					<td colspan="2">
						<div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send'><img class='profile' src="<c:url value="/resources/uploadFiles/${a.content}"/>"><span class='msg_time_send'>${fn:substring(a.sendDate,8,14)}</span></div></div>	
					</td>	
				</tr>		
				</c:if>
					</c:if>
					<c:if test="${a.memberNo != loginUser.memberNo && a.memberNo != 'M999'}">
					<tr>
						<td style="width:50px;">
						<c:if test="${a.changeName != null }">
						<div class='box' style='background:white;'><img class='profile' src="<c:url value="/resources/uploadFiles/${a.changeName}"/>"></div>
						</c:if>
						<c:if test="${a.changeName == null }">
						<div class='box' style='background:white;'><img class='profile' src="<c:url value="/resources/img/people.png"/>"></div>
						</c:if>
						</td>
						<td>
						<div style="display: inline-flex; font-weight:600; font-size:12px;">${a.memberName }</div>
						</td>
					</tr>	
					<c:if test="${a.memberNo != 'M999' && a.contentType == '텍스트'}">
					<tr>	
						<td colspan="2">
						<div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'>${a.content}<br><span class='msg_time'>${fn:substring(a.sendDate,8,14)}</span></div> </div> 
						</div>
						</td>
					</tr>
					</c:if>
					<c:if test="${a.memberNo != 'M999' && a.contentType == '첨부파일'}">
					 <tr>	
						<td colspan="2">
						<div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'><img class='profile' src="<c:url value="/resources/uploadFiles/${a.content}"/>"><br><span class='msg_time'>${fn:substring(a.sendDate,8,14)}</span></div> </div> 
						</div>
						</td>
					</tr>
					</c:if>	
					</c:if>
					<c:if test="${a.memberNo eq 'M999'}">
					<c:if test="${fn:length(a.content)<11}">
					<tr height='10px;'></tr><tr><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send' align='center' style='width:100%; font-size:10px; margin-right: 60px; background:orange; color:black; font-weight:600; font-size:13px; height:15px; padding: 0px;'>${fn:substring(a.content,0,8)} &nbsp; ${fn:substring(a.content,8,10)}요일<span class='msg_time_send'></span></div></div></td></tr>
					</c:if> 
					<c:if test="${fn:length(a.content)>=11}"> 
					<tr height='10px;'></tr><tr><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send' align='center' style='width:100%; font-size:10px; margin-right: 60px; background:purple; height:15px; padding: 0px;'>${a.content}<span class='msg_time_send'></span></div></div></td></tr>
					</c:if>
				</c:if>	
			</c:forEach>
		<c:if test="${cr.count <2}">
				<tr height='10px;'></tr>
				<tr>
					<td colspan='2'><div class='d-flex justify-content-end mb-4'> 
						<div class='msg_cotainer_send' align='center' style='width:100%; font-size:10px; margin-right: 70px; background:#FAA500; height:35px; padding: 0px;'>
						<p>새로운 인원을 초대하시거나 또는 <br> 나가기를 하시면 자동으로 방이 삭제됩니다.</p>
						<span class='msg_time_send'></span>
						</div>
						</div></td></tr>
		</c:if>
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
			<form id="fileForm" method="post" enctype="multipart/form-data">
			   <i class="fas fa-paperclip" id="fileUpload" style="margin-left: 7px;"></i> <input type="file" id="file" name="file"  style="display:none;">
			</form>
		</div>
		
		
	</div>	

		
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:350px;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-atom"></i>&nbsp; 채팅방 정보</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="height:400px; overflow: auto;">
        <table id="modalTable" class="chatRoomMember">
        	<c:forEach var="m" items="${m }">
        	<c:if test="${m.changeName == null }">
        	<tr>
					<td><div class='box' style='background:white;'><img class='profile' src="<c:url value="/resources/img/people.png"/>"></div></td>
					<td style="padding-top: 14px; padding-left: 10px;">${m.memberName } / ${m.deptName} / ${m.rankName }
						<input type="hidden" class="hideMemberNo" value="${m.memberNo}">
					</td>
			</tr>		
			</c:if>
			<c:if test="${m.changeName != null }">
        	<tr>
        		<td><div class='box' style='background:white;'><img class='profile' src="<c:url value="/resources/uploadFiles/${m.changeName}"/>"></div></td>
        		<td style="padding-top: 14px; padding-left: 10px;">${m.memberName } / ${m.deptName} / ${m.rankName }
        			<input type="hidden" class="hideMemberNo" value="${m.memberNo}">
        		</td>
        	</tr>
        	</c:if>
        	</c:forEach>
        </table>
      </div>
      <div class="modal-footer">
        <button type="button" id="leaveChatRoom" class="btn btn-primary" style="background:#F3565D; border:none;"><i class="fas fa-sign-out-alt"></i></button>
      </div>
    </div>
  </div>
</div>


<!-- 인원 추가 모달 -->
<div class="modal fade" id="memberPlus" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content" style="width:370px;">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><i class="fas fa-plus"></i>&nbsp; 채팅방 인원 추가</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body" style="height:400px; overflow: auto;">
        <table id="modalTable">
        	<tr>
        		<td><input type="text" id="keyWord" placeholder="이름/부서 검색 " style="border:1px solid lightgray; width:200px; border-radius: 5px; margin-bottom: 2px; margin-right: 10px;"></td>
        		<td>
        			<div id="member" align="center" style="width:52px; background:#1E2B44; color:white; font-size:12px; line-height:24px; height:24px; border:1px solid black; display: inline-block; border:1px solid lightgray; border-radius: 5px;">이름</div>
        			<div id="dept" align="center" style="width:52px; height:24px; border:1px solid black;font-size:12px; line-height:24px; display: inline-block; border:1px solid lightgray; border-radius: 5px;">부서명</div>
        			<input type="hidden" id="searchInfo" value="member">
        		</td>
        	</tr>
        </table>
        <table id="plusMemberTable"></table>
      </div>
      <div class="modal-footer">
     <!--    <button type="button" id="leaveChatRoom" class="btn btn-primary" style="background:#F3565D; border:none;"><i class="fas fa-sign-out-alt"></i></button> -->
      </div>
    </div>
  </div>
</div>

	<script>
		$(function() {
			 $("#chatArea").on("change", function() {
				 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight); 
			 });
		});
	
	</script>
	<script>
		$("#file").change(function(){
			 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight); 
			var formData = new FormData($('#fileForm')[0]);
			 var text= "${loginUser.memberName}님이 나갔습니다" + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "첨부파일" + "`" + "${loginUser.memberName}" + "`" +"sss" + "`" + "${loginUser.changeName}";
			 var date;
			 $.ajax({
					url:'selectDate.ct',
					type: 'post',
					async: false,
					data:{},
				 success:function(data){
					date = data;
					curDay = date.substring(6,9);
					infoDate = date.substring(0,8);
				 }
			 });
			 
			$.ajax({
				type: "POST",
				enctype: 'multipart/form-data',	// 필수
				url: 'insertChatAtt.ct?chatRoomNo=${cr.chatRoomNo}',
				data:formData,		// 필수
				processData: false,	// 필수
				contentType: false,	// 필수
				cache: false,
				success: function (data) {
					 $("#chatAreaTable").append("<tr><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send'><img class='profile' src='/manage/resources/uploadFiles/"+data['changeName']+"'><span class='msg_time_send'>"+ date.substring(8,14) +"</span></div></div></td></tr>");
					 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
					 
					 var text= data['changeName'] + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "첨부파일" + "`" + "${loginUser.memberName}" + "`" + date + "`" + "${loginUser.changeName}";
					 ws.send(text);
				},
				error: function (e) {
				}
			});
			 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		});
	</script>
	
	
	


	<script>
		$("#dept").on("click", function(){
			$("#member").css("background", "white");
			$("#member").css("color", "black");
			$(this).css("background", "#1E2B44");
			$(this).css("color", "white");
			$("#searchInfo").val("dept");
		});
		
		$("#member").on("click", function(){
			$("#dept").css("background", "white");
			$("#dept").css("color", "black");
			$(this).css("background", "#1E2B44");
			$(this).css("color", "white");
			$("#searchInfo").val("member");
		});
		
		$("#keyWord").keyup(function(){
			var kind = $("#searchInfo").val();
			var keyWork = $(this).val();
			
			if($(this).val() == ""){
				console.log(keyWork);
				keyWork = "+";
			}
			 $("#plusMemberTable").empty();
			$.ajax({
   				url:'plusSearchMember.ct',
   				type: 'post',
   				async: false,
   				data:{keyWord:keyWork,
   					  kind:kind},
   			 success:function(data){
   					 $("#plusMemberTable").empty();
   				 for(key in data) {
   					if(data[key]['changeName'] != null){
   					$("#plusMemberTable").append("<tr class='tr1'><td><div class='box' style='background:white;'><img class='profile' src='/manage/resources/uploadFiles/"+data[key]['changeName']+"'></div></td><td style='padding-top: 14px; padding-left: 10px;'>"+data[key]['memberName']+" / "+data[key]['deptName']+" / "+data[key]['rankName']+"<input type='hidden' class='hideMemberNo' value='"+data[key]['memberNo']+"'></td><td style='padding-top:10px; padding-left:20px;'><div class='plusBtn' style='width:30px; margin-top: 20px; height:30px;'><i class='fas fa-user-plus' style='font-size:18px; color:#1E2B44;'><input type='hidden' class='hideMember' value='"+data[key]['memberNo']+"'></i></div></td></tr>")
   					}else{
   						$("#plusMemberTable").append("<tr><td><div class='box' style='background:white;'><img class='profile' src='/manage/resources/img/people.png'></div></td><td style='padding-top: 14px; padding-left: 10px;'>"+data[key]['memberName']+" / "+data[key]['deptName']+" / "+data[key]['rankName']+"<input type='hidden' class='hideMemberNo' value='"+data[key]['memberNo']+"'></td><td style='padding-top:19px; padding-left:20px;'><div class='plusBtn'><i class='fas fa-user-plus' style='font-size:18px; color:#1E2B44;'><input type='hidden' class='hideMember' value='"+data[key]['memberNo']+"'></i></div></td></tr>")	
   					}
   				 }																					
   			 }
   			});	
		});
		
	</script>
	<script>
	$(document).on('click', '.plusBtn', function(){
		var memberNo = $(this).find(".hideMember").val();
		var check =0;
	 $(".chatRoomMember tr").find(".hideMemberNo").filter(function(){
		if($(this).val() == memberNo){
			check = 1;
			swal({
                title: "이미 채팅방에 있는 사원입니다.",
               icon: "error"
             });
		}

	 });
	 if(check ==0){
		 var text= "${loginUser.memberName}님이 나갔습니다" + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "텍스트" + "`" + "${loginUser.memberName}" + "`" +"sss" + "`" + "M999";
		swal({
			  title: "초대하시겠습니까?",
			  icon: "warning",
			  buttons: ["취소", "초대"],
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal({
			    	title: "초대 완료!",
			      	icon: "success"
			    }).then((value) => {	// 애니메이션 V 나오는 부분!
			   	$.ajax({
						url:'inviteMember.ct',
						type: 'post',
						async: false,
						data:{memberNo:memberNo,
							  chatRoomNo:"${cr.chatRoomNo}",
							  text:text
							},
					 success:function(data){   
						 var text= data['memberName']+ "님이 초대되었습니다" + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "텍스트" + "`" + "${loginUser.memberName}" + "`" +"초대" + "`" + "M999";				
						 console.log(data);
						 $("#chatAreaTable").append("<tr height='10px;'></tr><tr><br><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send' align='center' style='width:100%; font-size:10px; margin-right: 60px; background:purple; height:15px; padding: 0px;'>"+data['memberName']+"님이 초대되었습니다<span class='msg_time_send'></span></div></div></td></tr>");
						 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);	
				    	 $(".chatRoomMember").append("<tr><td><div class='box' style='background:white;'><img class='profile' src='<c:url value='/resources/img/people.png'/>'></div></td><td style='padding-top: 14px; padding-left: 10px;'>"+data['memberName']+" / "+data['deptName']+" /"+data['rankName']+"<input type='hidden' class='hideMemberNo' value='"+data['memberNo']+"'></td></tr>");
				    	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
						 
				    	 var c =  $("#memberCount").text();	
				    	 
				    	 $("#memberCount").text((Number(c) + Number(1)));
				    	
				    	 ws.send(text);
					 } 
				}); 
			    	
			    });
			  } else {
				  swal({
				  	title: "취소 하셨습니다.",
				    icon: "error"
				  });
			  }
		});
	 }
		
	});
		
	</script>

	<script>
		$(function(){
			$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
		});
	
		$("#leaveChatRoom").click(function(){
	    	 var text= "${loginUser.memberName}님이 나갔습니다" + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "텍스트" + "`" + "${loginUser.memberName}" + "`" +"sss" + "`" + "M999";

			swal({
				  title: "채팅방을 나가시겠습니까?",
				  icon: "warning",
				  buttons: ["취소", "나가기"],
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal({
				    	title: "삭제 완료!",
				      	icon: "success"
				    }).then((value) => {	// 애니메이션 V 나오는 부분!
				    	$.ajax({
							url:'deleteInfo.ct',
							type: 'post',
							async: false,
							data:{text:text},
						 success:function(data){   
						 } });
				    	 ws.send(text);
				    	 
				    	 location.href='leaveChatRoom.ct?chatRoomNo=${cr.chatRoomNo}';
				    });
				  } else {
					  swal({
					  	title: "취소 하셨습니다.",
					    icon: "error"
					  });
				  }
			});
		});
	</script>
	<script type="text/javascript">
       var date;
       var lastDay;
       var curDay;
        function send(){
        	if($("#chatContent").val() != ""){
        		//해당 채팅방에 마지막 일자로 보내진 메세지 확인
	       		$.ajax({
	   				url:'selectLastMessage.ct',
	   				type: 'post',
	   				async: false,
	   				data:{chatRoomNo:"${cr.chatRoomNo}"},
	   			 success:function(data){
	   				 if(data != null){
	   				 lastDay = data.substring(8,10)
	   				 }else{
	   					 lastDay = 40;
	   				 }
	   			 }
	   			});	
        		
        	 //현재 서버시간을 가지고옴	
        	 $.ajax({
					url:'selectDate.ct',
					type: 'post',
					async: false,
					data:{},
				 success:function(data){
					date = data;
					curDay = date.substring(6,9);
					infoDate = date.substring(0,8);
					console.log("날짜 : " + curDay);
					console.log("날짜 : " + infoDate);
					if(Number(lastDay) < Number(curDay)){
						var text=document.getElementById("chatContent").value + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "텍스트" + "`" + "${loginUser.memberName}" + "`" + infoDate + "`" + "Info";
						console.log("날짜 : " + text);
						$.ajax({
							url:'insertInfoMessage.ct',
							type: 'post',
							async: false,
							data:{message:text},
						 success:function(data){
							 $("#chatAreaTable").append("<tr height='10px;'></tr><tr><br><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send' align='center' style='width:100%; font-size:10px; margin-right: 60px; background:orange; color:black; font-weight:600; font-size:13px; height:15px; padding: 0px;'>"+ date.substring(0, 8) +"<span class='msg_time_send'></span></div></div></td></tr>")
							 var text= date.substring(0, 8) + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "텍스트" + "`" + "${loginUser.memberName}" + "`" +"sss" + "`" + "M999";
							 console.log("날짜 : " + text);
							 ws.send(text);
						 }
						});
					}
					
				 }
				}); 
            var text=document.getElementById("chatContent").value + "`" + "${cr.chatRoomNo}"+ "`" + "${loginUser.memberNo}" + "`" + "텍스트" + "`" + "${loginUser.memberName}" + "`" + date + "`" + "${loginUser.changeName}";
        	var text1 = text.split("`");
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
        	
        	 
            $("#chatAreaTable").append("<tr><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send'>"+content+"<span class='msg_time_send'>"+date.substring(8,14)+"</span></div></div></td></tr>");
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
        	 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
        	var text1 = text.split("`");
        	//내용
        	var content = text1[0];
        	//메세지 보낸 거에 해당하는 방 번호
        	var chatNo = text1[1];
        	//보낸 사람
        	var memberNo = text1[2];
        	var root = text1[3];
        	var memberName = text1[4];
        	var date = text1[5];
        	var changeName = text1[6];
        	console.log("초대값 : " + date);
        	
        	//지금 내가 들어와 있는 방 번호
        	var chatNo2 = "${cr.chatRoomNo}";
        	console.log(root);
        	if(chatNo2 == chatNo && root=="첨부파일"){
        		 $("#chatAreaTable").append("<tr><td style='width:50px;'><div class='box' style='background:white;'><img class='profile' src='/manage/resources/uploadFiles/"+changeName+"'></div></td><td><div style='display: inline-flex; font-weight:600; font-size:12px;'>"+memberName+"</div></td></tr><tr><td colspan='2'><div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'><img class='profile' src='/manage/resources/uploadFiles/"+content+"'><br><span class='msg_time'>"+date.substring(8,14)+"</span></div></div></div></td></tr>");
        		 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
        	}
        	
     		if(chatNo2 == chatNo && changeName != "M999" && root!="첨부파일"){
     			if(changeName != ""){
		        	$("#chatAreaTable").append("<tr><td style='width:50px;'><div class='box' style='background:white;'><img class='profile' src='/manage/resources/uploadFiles/"+changeName+"'></div></td><td><div style='display: inline-flex; font-weight:600; font-size:12px;'>"+memberName+"</div></td></tr><tr><td colspan='2'><div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'>"+content+"<br><span class='msg_time'>"+date.substring(8,14)+"</span></div></div></div></td></tr>");
		        	$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
     			}else{
     				$("#chatAreaTable").append("<tr><td style='width:50px;'><div class='box' style='background:white;'><img class='profile' src='/manage/resources/img/people.png'></div></td><td><div style='display: inline-flex; font-weight:600; font-size:12px;'>"+memberName+"</div></td></tr><tr><td colspan='2'><div class='card-body msg_card_body' style='padding-left: 20px; padding-top:0px; padding-bottom: 0px;'><div class='d-flex justify-content-start mb-4'><div class='msg_cotainer'>"+content+"<br><span class='msg_time'>"+date.substring(8,14)+"</span></div></div></div></td></tr>");
    	        	$("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
     			}
     			 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
     		
     		}else if(changeName == "M999" && root!="첨부파일"){
     			 $("#chatAreaTable").append("<tr height='10px;'></tr><tr><br><td colspan='2'><div class='d-flex justify-content-end mb-4'> <div class='msg_cotainer_send' align='center' style='width:100%; font-size:10px; margin-right: 60px; background:purple; height:15px; padding: 0px;'>"+content+"<span class='msg_time_send'>${a.sendDate}</span></div></div></td></tr>")
     			 var text =  $("#memberCount").text().substring(0,1);
     			 
     			$("#modalTable").find(".hideMemberNo").filter(function(){
    				if($(this).val() == memberNo){
    					$(this).parent().parent().remove(); 
    				}
    			});
     			if(date == '초대'){
	     			 var c =  Number($("#memberCount").text());	
	     			 console.log(c);
			    	 $("#memberCount").text((Number(c) + Number(1)));
	     				
     			}else{
     				 var c =  Number($("#memberCount").text());	
         			 console.log(c);
    		    	 $("#memberCount").text((Number(c) - Number(1)));
         					
     			}
     			 $("#chatArea").scrollTop($("#chatArea")[0].scrollHeight);
     		}
        }

</script>

	<script>
        var str ="";   
   
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