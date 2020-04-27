<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


.titleArea {
	width: 100%;
	height: 60px;
	background: #F3F3F3;
	vertical-align: middle;
	line-height: 60px;
	border: 3px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: 1px solid gray;
	border-bottom: 1px solid lightgray;
	
}

.title {
	float: left;
	display: inline-block;
	margin-left: 35px;
} 

.date {
	text-align: right;
	margin-right: 50px;
}

.authorArea {
	/* width: 100%;
	height: 50px;
	background: none;
	vertical-align: middle;
	line-height: 50px;
	border: 4px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: none;
	border-bottom: 1px solid lightgray; */
	
	
	width: 100%;
	background: transparent;
	line-height: 35px;
	border: 4px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: none;
	border-bottom: 1px solid lightgray;
}

.author {
	float: left;
	margin-left: 0px;
}

.view {
	text-align: right;
	margin-right: 50px;
}


.contentArea {
	width: 100%;
	background: none;
	/* line-height: 50px; */
	margin-top: 40px;
	/* margin-bottom: 50px; */
	margin-right: 40px;
	padding-bottom: 50px;
	border: 4px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: none;
	border-bottom: 1px solid lightgray;
}

.replyDivArea {
	width: 100%;
	background: #F3F3F3;
	line-height: 35px;
	/* border: 4px solid lightgray; */
	border-left: none;
	border-right: none;
	border-top: 1px solid lightgray;
	/* border-bottom: 1px solid lightgray; */
	margin-top: 60px;
}

.replyArea {
	width: 100%;
	background: transparent;
	line-height: 35px;
	border: 4px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
}

.replyTextArea {
	width: 80%;
	height: 120px;
	border-radius: 5px;
	padding: 10px;
	display: inline-block; 
	
}

.replyBtn {
	height:100%;
	width: 45px;
	display: inline-block;
}

.content {
	margin-left: 35px;
	margin-right: 35px;
}

.replyAuthor1 {
	width: 15%;
	text-align: left;
	padding-top: 10px;
	padding-bottom: 10px;
	padding-left: 10px;
	vertical-align: top;
}

.replyAuthor2 {
	width: 70%;
	text-align: left;
	padding-left: 10px;
	padding-right: 25px;
	padding-top: 10px;
	padding-bottom: 10px;
	vertical-align: top;
}

.replyAuthor3 {
	width: 20%;
	font-size: 14px;
	text-align: center;
	align: center;
	/* padding-right: 15px; */
	padding-top: 10px;
	padding-bottom: 10px;
	vertical-align: top;
}

.repBtn {
	width:70px;
	height:30px;
	line-height: 30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
	margin-left: 10px;
	margin-top: 0px;
}

.modifyBtn {
	width:40px;
	height:30px;
	line-height: 30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
	/* margin-left: 10px; */
	margin-top: 0px;

}

.removeBtn {
	width:40px;
	height:30px;
	line-height: 30px;
	border:none;
	background:gray;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
	margin-top: 0px;
}

.modifyReplyBtn2 {
	height:30px;
	line-height: 30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
}

.cancelReplyBtn2 {
	width:40px;
	height:30px;
	line-height: 30px;
	border:none;
	background:gray;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
}



.replyModifyDiv1 {
	background: #F3F3F3;
	vertical-align: middle;
}

.replyModifyDiv2 {
	/* border-bottom: 1px solid lightgray; */
	height: 200px;
	vertical-align: middle;
	
}

.replyModifyTextarea {
	height: 55%;
	width: 88%;
	border: 1px solid gray;
	margin-right: 22px;
	float: right;
	resize: none;
	padding: 5px;
	padding-left: 10px;
	margin-top: 25px;
	
}

.replyBtnDiv {
	float: right;
	width: 20%;
	margin-right: -100px;
	margin-top: 10px;
}


</style>
</head>
<body onload="$('#route1').text('커뮤니티'); $('#route2').text('정보공유게시판')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			
			<br><br><br>
			
			<div id="" class="titleArea">
				<div id="" class="title"><b>${board.boardTitle}</b></div>
				<%-- <div id="" class="date"><span>${board.createDate}</span></div> --%>
				<div id="" class="date"><span><fmt:formatDate value="${board.createDate}" pattern="yyyy-MM-dd a HH-mm:SS"/></span></div>
				
			</div>
			
			<%-- <div id="" class="titleArea">
				<div id="" class="title"><b>${board.boardTitle}</b></div>
				<div id="" class="date"><span>${board.createDate}</span></div>
			</div> --%>
			
			<div id="" class="authorArea">
				<div id="" class="author"><b>작성자 :<span>&nbsp;&nbsp; ${board.memberName}</span></b></div>
				<div id="" class="view"><span style="color: #999999">조회수 : &nbsp; <span>${board.viewCount}</span></span></div>
			</div>
			<%-- <c:if test="${loginUser.memberNo == board.memberNo}"> --%>
				<div style="margin-top: 20px; float: right; padding-right: 20px;">
					<button id="modifyBoBtn" class="modifyBtn Btn" onclick="">수정</button>
					<button id="deleteBoBtn" class="removeBtn Btn" onclick="">삭제</button>
				</div>
			<%-- </c:if> --%>
			<br>
			
			
			<div id="" class="contentArea">
				<div id="" class="content" style="">${board.boardContent}</div>
			</div>
			<!-- <div style="margin-top: 20px; float: right; padding-right: 20px;">
				<button id="" class="modifyBtn Btn" onclick="">수정</button>
				<button id="" class="removeBtn Btn" onclick="">삭제</button>
			</div>
			<br> -->
			
			<!-- 버튼추가 -->
			
			<div id="" class="replyDivArea">
				<div class="" style="margin-left: 10px;"><b>댓글</b><span>&nbsp;&nbsp; ${rlist.size()}</span></div>
			</div>
			
			<c:forEach var="r" items="${rlist}">
			
			<c:if test="${rlist.size() > 0}">
			<div id="" class="replyArea">
				<table id="replyTable" class="" style="width: 100%;">
					<tr style="">
						<td class="replyAuthor1"><b>${r.memberName}</b>
							<input type="hidden" id="rReplyNo" class="" name="replyNo" value="${r.replyNo}">	
							<input type="hidden" id="rMemberNo" class="" name="memberNo" value="${r.memberNo}">
						</td>
						<td id="replyContent" rowspan="2" class="replyAuthor2">${r.replyContent}</td>
						<td class="replyAuthor3">${r.createDate}</td>
					</tr>
					<tr>
						<td>
							<button id="" class="repBtn Btn" onclick="">댓글달기</button>
						</td>
						<%-- <c:if test="${loginUser.memberNo == board.memberNo }"> --%>
						<td align="center" style="height: 80px;">
							<button type="button" id="modifyReplyBtn" class="modifyBtn Btn">수정</button>
							<button type="button" id="removeReplyBtn" class="removeBtn Btn">삭제</button>
						</td>
						<%-- </c:if> --%>
					</tr>
				</table>
			</div>
			</c:if>
			
			
			<c:if test="${rlist.size() <= 0}">
			<div id="" class="replyAreaa">
				댓글이 없습니다.ssssssssssssssss
			</div>
			</c:if>
			
			
			
			
			
			<!-- 댓글수정영역 -->
			<div id="" class="replyModifyDiv1">
				<div class="replyModifyDiv2">
					<textarea id="" class="replyModifyTextarea" rows="" cols=""></textarea>
					<div>
						<p style="padding: 30px;"><b>댓글수정</b></p>
					</div>
					<div class="replyBtnDiv">
						<button id="" class="modifyReplyBtn2" onclick="">수정</button>
						<button id="" class="cancelReplyBtn2" onclick="">취소</button>
					</div>
				</div>
			</div>
			</c:forEach>
			
			<br>
			
			<div id="" class="replyInsert">
				<form action="" id="commentForm" name="commentForm" method="post">
					<div class="">
						<textarea rows="" cols="" class="replyTextArea form-control" id="replyTextArea" class="replyTextArea form-control" name="replyContent" placeholder="댓글을 입력하세요."></textarea>
						<input type="hidden" id="" class="" name="">
						<input type="hidden" id="" class="" name="">
						<input type="hidden" id="" class="" name="">
						<input type="hidden" id="" class="" name="">
					</div>
					<div class="">
						<button type="submit" id="replyBtn" class="replyBtn Btn" name="replyBtn" style="">댓글등록</button>
					</div>
				</form>
			</div>
			<br><br><br>
		</div>
	</div>
	
	
	
	<script>
	
	
	//게시판 댓글등록
	$("#replyBtn").click(function(){
		
		var boardNo = "${board.boardNo}";
		var replyContent = $("#replyTextArea").val();
		var memberNo = "${loginUser.memberNo}";
		
		var result = confirm('댓글을 등록하시겠습니까?');

		console.log("boardNo: " + boardNo);
		console.log("replyContent: " + replyContent);
		console.log("memberNo: " + memberNo);
		
		
		$.ajax({
			
			type : "post",
			url: "insertReply.ib",
			data: {
					boardNo : boardNo,
					replyContent : replyContent,
					memberNo : memberNo,
			},
			success: function(data) {
				
				if(replyContent.value == "") {
					
					alert("댓글을 입력해주세요.")
					replyContent.focus();
					return false;
					
				} else {
					
					if(result) {
						alert("댓글이 등록되었습니다.");
						console.log(data);
					} 
					
				}
				
			}
			
		});
		
	});
	
	
	/* //댓글 조회
	function getCommnetList() {
		
		var boardNo = ${board.boardNo}
		var memberNo = ${loginUser.memberNo}
		
		console.log("boardNo : " + boardNo);
		console.log("memberNo : " + memberNo);
		
		$.ajax({
			
			type: "get",
			url: "selectAllReply.ib",
			dataType: "json",
			data: $("#commentForm").serialize(),
			data: {
				
				boardNo : boardNo
			},
			contentType: "application/x-www-form-urlencoded; charset=UTF-8",
			success : function(data) {
			
				console.log(data);
				
				
			},
			
			
		});

	} */
	
	
	
	$(function() {
		
		var boardNo = "${board.boardNo}";
		var memberNo = "${loginUser.memberNo}";
		
		
		
		//게시글 수정
		$("#modifyBoBtn").click(function(){
		
			var result = confirm("게시글을 수정하시겠습니까?");
			
			if(result) {

				location.href = "modifyBoardSelect.ib?boardNo=" + boardNo;
				
				console.log(boardNo);
				
			}			
			
		});
		 
		
		//게시글 삭제
		$("#deleteBoBtn").click(function(){
			
			var result = confirm("삭제하시겠습니까?");
			
			console.log(boardNo);
			
			if(result) {

				location.href = "deleteBoard.ib?boardNo=" + boardNo;
				alert("게시글이 삭제되었습니다.");
				
			}
			
		});
		
	});
	
	
	
	//댓글수정
	$(function() {
		
		 /* $("#projectTable tr").children().find("#pwdResetBtn").on("click", function(){
		       var result = confirm("해당인원의 패스워드 정보를 초기화 하시겠습니까?");
		       
		      console.log($(this).parent().find("#inputMemberNo").val()); 
		    }); */
		
		
		
		$(document).on('click', "#modifyReplyBtn", function(){
			
			/* var replyNo = $("#rReplyNo").val();
			var replyContent = $("#replyContent").text();
			
			var memberNo = "${loginUser.memberNo}"; */
			
			var replyNo = $("#replyTable").children().find("#rReplyNo").val();
			console.log(replyNo);
			
			
			//console.log(replyContent);
			//console.log(memberNo);
			
			
			
			
			
			/* $.ajax({
				type: "post",
				url: "updateReply.ib",
				data: {
					
					replyNo : replyNo,
					
				}
				
			}); */
			
			
			
			
			
		});
		
		
	});
	
	
	 /* $("#projectTable tr").children().find("#pwdResetBtn").on("click", function(){
		 
		 var result = confirm("해당인원의 패스워드 정보를 초기화 하시겠습니까?");
       
	     console.log($(this).parent().find("#inputMemberNo").val()); 
    }); */
	
	
	
	
	//댓글삭제
	$(document).on('click', "#removeReplyBtn", function() {
		
		console.log($("#replyTable").find("input[name=replyNo]").val());
		
		
		
	});
	
	
	
	</script>
	
	
	
</body>
</html>











