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
	width: 20%;
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
	width: 15%;
	font-size: 14px;
	text-align: center;
	align: center;
	padding-right: 25px;
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
				<div class="" style="margin-left: 10px;"><b>댓글</b><span>&nbsp;&nbsp; ${rlist.size()}</span></div>
			</div>
			
			<c:forEach var="r" items="${rlist}">
			<div id="" class="replyArea">
				<table id="" class="" >
					<tr style="">
						<td class="replyAuthor1">${r.memberName}</td>
						<td rowspan="2" class="replyAuthor2">${r.replyContent}</td>
						<td class="replyAuthor3">${r.createDate}</td>
					</tr>
					<tr>
						<td>
							<button id="" class="repBtn Btn" onclick="">댓글달기</button>
						</td>
						<td align="center" style="height: 80px;">
							<button id="" class="modifyBtn Btn" onclick="">수정</button>
							<button id="" class="removeBtn Btn" onclick="">삭제</button>
						</td>
					</tr>
				</table>
			</div>
			</c:forEach>
			
			
			
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
				
				if(replyContent == null) {
					
					alert("댓글을 입력해주세요.")
				} else {
					
					if(result) {
						alert("댓글이 등록되었습니다.");
						console.log(data);
					} else {
						alert("취소하였습니다.");
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
	
	
	
	
	
	</script>
	
	
	
</body>
</html>











