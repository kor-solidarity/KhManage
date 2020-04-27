<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
<link href="${ path }/resources/summernote/summernote-lite.css" rel="stylesheet">
<script src="${ path }/resources/summernote/summernote-lite.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<title>Insert title here</title>
<style>

.border {
	/* border: 1px solid black; */
	width: 100%;
	/* height: 800px; */
	margin: 0 auto;
	padding: 20px;
	font-weight: bold;
	
}

.tableTr {
	width: 50px;
	height: 50px;
	text-align: right;

}

.tableTd {
	width: 180px;
	text-align: left;
}

.tableTd2 {
	width: 500px;
	align: center;
}

.tableTd3 {
	width: 30px;
}

.register form-control {
	width: 350px;
	height: 35px;
	border-radius: 4px;
	outline: none;
	border: 1px solid lightgray;
	padding-left: 15px;
}

.okBtn {
	width:70px;
	height:30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
	/* margin-left: 20px; */
}

.cancleBtn{
	width:70px;
	height:30px;
	border:none;
	background:#F3565D;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
}

.verifyBtn {
	width:70px;
	height:30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
	margin-left: 180px;
}

.checkbox {
	align: left;
	margin-left: 150px;
	float: left;
}

.checkBoxArea {
	margin-top: 10px;
	margin-left: 210px;
}

summernote{
	border: 1px solid lightgray;
	border-radius: 5px;
	color: #FFFFFF;
}

/* div {
	margin: 10px;
} */

</style>
</head>
<body onload="$('#route1').text('커뮤니티'); $('#route2').text('정보공유게시판'); $('#route3').text('게시글작성');">

	

	<div class="panel panel-headline">
		<div class="panel-heading" style="padding: -1px;">
			<div class="border">
				
				<p style="color: #5E738B">게시글 수정<p>
				<hr>

				<div class="" style="margin-left: 20px;">			
					
					<form class="form" id="form" action="updateBoard.ib" method="post">
						<div>제목</div>
						<div>
							<input type="text" id="memberId" class="register form-control" name="boardTitle" placeholder="제목을 입력해주세요." focus
											oninvalid="this.setCustomValidity('제목을 입력해주세요.')" oninput="('ㄴㄴㄴㄴㄴ')" value="${board.boardTitle}">
							<input type="hidden" name="boardNo" value="${board.boardNo}">
						</div><br>
						<div>포스트내용</div>
						<div style="width: 100%">
							<textarea cols="80" rows="14" class="summernote form-control note-editor note-frame" class="summernote" id="summernote" name="boardContent" style="width: 100%;">
							${board.boardContent}</textarea>
						</div>
						
						
						<br>
						<div class="">
							<button type="submit" class="okBtn" onclick="goWrite();"><i class="fas fa-check"></i>&nbsp;수정</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="cancleBtn"><i class="fas fa-ban" onclick="goBack()"></i>&nbsp;취소</button>
						</div>
						<br><br><br><br>
					</form>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
	
	
	
	
	<script>
		
	//summernote 설정
	$(document).ready(function() {
	   //여기 아래 부분
	   $('#summernote').summernote({
	        height: 300,                 // 에디터 높이
	        /* width: 100, */
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        /* placeholder: '최대 2048자까지 쓸 수 있습니다' */   //placeholder 설정
		   });
	});
	
	
	function goWrite(frm) {
		var title = frm.boardTitle.value;
		var content = frm.boardContent.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		
		alert("게시글을 수정하였습니다.");
		frm.submit();
	}
	
	
	
	
	
	
	</script>
	
	
	
	
	
</body>
</html>














