<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	border: 4px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: 1px solid lightgray;
	border-bottom: 1px solid lightgray;
	margin-top: 60px;
}

.replyArea {
	width: 100%;
	background: transparent;
	line-height: 35px;
	border: 4px solid lightgray;
	border-left: none;
	border-right: none;
	border-top: none;
	border-bottom: 1px solid lightgray;
}

.replyTextArea {
	width: 100%;
	/* height: 100%; */
	border-radius: 5px;
	padding: 10px;
	display: inline-block;
}

.replyBtn {
	height:100%;
	width: 45px;
}

.content {
	margin-left: 35px;
	margin-right: 35px;
}

.replyAuthor1 {
	width: 20%;
	margin-left: 20px;
	text-align: left;
}

.replyAuthor2 {
	width: 80%
	margin-left: 20px;
	display: inline-block;
	text-align: left;
	padding-right: 25px;
	padding-top: 10px;
	padding-bottom: 10px;
}

.replyAuthor3 {
	margin-right: 20px;
	display: inline-block;
	text-align: right;
}

.replyAuthor4 {
	margin-top: -15px;
	text-align: center;
	font-size: 14px;	
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
				<div id="" class="date"><span>${board.createDate}</span></div>
			</div>
			
			<%-- <div id="" class="titleArea">
				<div id="" class="title"><b>${board.boardTitle}</b></div>
				<div id="" class="date"><span>${board.createDate}</span></div>
			</div> --%>
			
			<div id="" class="authorArea">
				<div id="" class="author"><b>작성자 :<span>&nbsp;&nbsp; ${board.memberName}</span></b></div>
				<div id="" class="view"><span style="color: #999999">조회수 : &nbsp; <span>${board.viewCount}</span></span></div>
			</div>
			
			<div id="" class="contentArea">
				<div id="" class="content" style="">${board.boardContent}</div>
			</div>
			
			
			<!-- 버튼추가 -->
			
			<div id="" class="replyDivArea">
				<div class="" style="margin-left: 10px;"><b>댓글</b><span>&nbsp;&nbsp; 5</span></div>
			</div>
			
			<div id="" class="replyArea">
				
				<table border="1">
					<tr>
						<td colspan="1" class="replyAuthor1">댓글작성자</td>
						<td colspan="1" class="replyAuthor2">댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용
						댓글내용댓글내용댓글내용댓글내용댓글내용내용댓글내용내용댓글내용내용댓글내용내용댓글내용내용댓글내용내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용댓글내용</td>
					</tr>
					<tr>
						<td>2020-04-20</td>
					</tr>
				</table>
				
				
				
				<!-- <div class="replyAuthor1" style="">댓글작성자</div>
				<div class="replyAuthor2">댓글내용입니다.댓글내용입니다.댓글내용입니다댓글내용입니다..댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.댓글내용입니다.</div>
				<div class="replyAuthor3">댓글입니다.</div>
				<div class="replyAuthor4" style="margin-left: 10px; text-align: left">2020-04-20</div> -->
			</div>
			
			
			
			<!-- <div id="" class="replyArea">
				<table id="" class="replyTable" border="1">
					<tr class="" style="padding 20px;">
						<td class="replyAuthor" style="width: 20%;">글쓴이</td>
						<td class="replyAuthor" style="width: 750%;">댓글내용</td>
					</tr>
				</table>
			</div><br> -->
			
			<br>
			<div id="" class="replyInsert">
				<form action="">
					<table>
						<tr>
							<td class="taTd" style="height: 100px;">
								<textarea rows="" cols="" id="replyTextArea" class="replyTextArea form-control" name="replyContent" placeholder="댓글을 입력하세요."></textarea>
							</td>
							<td>
								<button type="button" id="replyBtn" class="replyBtn" name="replyBtn" style="">댓글등록</button>
							</td>
						</tr>
					</table>				
				</form>
			</div>
			<br>
			



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
				
				if(result) {
					alert("댓글이 등록되었습니다.");
					console.log(data);
				} else {
					alert("취소하였습니다.");
				}
				
			}
			
		});
		
	});
	
	
	//댓글 조회
	
	
	
	
	
	
	</script>
	
	
	
</body>
</html>





