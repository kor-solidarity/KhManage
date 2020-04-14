<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp" />
<link href="${ path }/resources/summernote/summernote-lite.css" rel="stylesheet">
<script src="${ path }/resources/summernote/summernote-lite.js"></script>
<style>

.projectBtn {
	width: 130px;
	height: 27px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 600;
	border-radius: 5px;
	margin-right: 6px;
	font-size: 14px;
}


.pagingArea {
	background: #F3F3F3;
	height: 50px;
	border: 1px solid #B0B0B0;
}

.paging {
	margin-left: 200px;
	width: 50%;
}

.wjs_btn{
      /* width:70px; */
      height:30px;
      border:none;
      background: #1E2B44;
      color:white;
      font-weight:600;
      border-radius: 5px;
      font-size:14px;
      margin-left: 10px;
      margin-top: 24px;
      float: left;
      
   } 

	#noticeTable{
		width:95%;
		text-align:left;
		margin-top: 10px;
	}
	
	.p{
		margin-top: 10px;
		font-weight: bold;
		font-size: 18px;
		color: #5e738b;
	}
	#nTitle{
		width: 1500px;
		height: 40px;
	}
	.div{
		margin-bottom: 20px;
		margin-top: 20px;
	}
	
	.delBtn{
		width: 70px;
		height: 30px;
		border: none;
		background: #C6C6C6;
		color: white;
		font-weight: 400;
		border-radius: 5px;
		font-size: 14px;
	
	}
	
	.okBtn {
		width: 70px;
		height: 30px;
		border: none;
		background: #1E2B44;
		color: white;
		font-weight: 400;
		border-radius: 5px;
		font-size: 14px;
	}
</style>
</head>
<body onload="$('#route1').text('공지사항'),$('#route2').text('공지사항 작성')">
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 900px; margin: 0 auto; overflow: auto;">
				
				<p class="p">공지사항 작성</p>
				
				<hr>
				<form>
				<table id="noticeTable" align="center">
					<tr>
						<td class="title"><div class="div"><p style="color:  #5e738b;">공지사항 제목</p></div></td>
					</tr>
					<tr>
						<td><input type="text" placeholder="공지사항 제목 입력" id="nTitle"></td>
					</tr>
					<tr>
						<td class="title"><div class="div"><p style="color:  #5e738b;">공지사항 첨부파일</p></div></td>
					</tr>
					<tr>
						<td><input type="file" name="upfile"></td>
					</tr>
					<tr>
						<td class="title"><div class="div"><p style="color:  #5e738b;">공지사항 내용</p></div></td>
					</tr>
					<tr>
						<td>
							<textarea cols="80" rows="14" id="summernote" name="nContent"></textarea>
						</td>
					</tr>
					<tr>
						<td colspan="4">
							<div class="div">
							<button class="okBtn" id="save">
								<i class="fas fa-check"></i>&nbsp;저장
							</button>
								<a href="accessManage.am">
								&nbsp;
							<button class="delBtn">
								<i class="fas fa-ban"></i>&nbsp;취소
							</button>
								</a>
							</div>
							</td>
							
						</tr>

				</table>

				</form>

			</div>
		</div>
	</div>
</body>
<script>
	$(document).ready(function() {
	   //여기 아래 부분
	   $('#summernote').summernote({
	        height: 300,                 // 에디터 높이
	        width:1500,
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        placeholder: '최대 2048자까지 쓸 수 있습니다'   //placeholder 설정
		   });
	});
	

</script>
</html>


