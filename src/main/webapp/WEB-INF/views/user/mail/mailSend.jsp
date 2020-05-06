<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
<jsp:include page="/WEB-INF/views/user/common/mailSidebar.jsp"/>
  <link href="${ path }/resources/summernote/summernote-lite.css" rel="stylesheet">
  <script src="${ path }/resources/summernote/summernote-lite.js"></script>
<style>
	.wjs_btn{
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
   #mailtable{
   	width: 100%;
   }
   .mailtd{
   	width: 100px;
   	text-align: left;
   	height: 50px;
   	font-weight: bold;
   }
   .mailtd2{
   	width: 1300px;
   	text-align: left;
   }
   .mailtd3{
   	width: 150px;
   }
   #mailr{
   	width: 100%;
   	border: 1px solid black;
   	height: 30px;
   	overflow:hidden;
	height:auto;
   }
   #div{
   	margin-left: 3px;
   	margin-right: 5px;
   	margin-top : 3px;
   	float: left;
   }
   #label{
   	float: left;
   	background: #f1d898;
   	color: #d5703d;
   	height: 32px;
   	width: 230px;
   }
   .xbtn{
   	outline:none;
   	height: 32spx;
   	background: #f1d898;
   	margin-left:-28px;
   	margin-top: 2px;
   	
   }
</style>
</head>
<body>
	
	<div class="panel panel-headline">
		<div class="panel-heading">
	<div>
	<img src="resources/img/mail.png" style="width: 30px; height: 30px; float: left; margin-top: 6px; margin-right: 15px; margin-left: 10px;">
	<p style="font-weight: bold; font-size: 32px; margin-top: 10px; margin-left: 10px;">편지 쓰기</p>
	</div>	
	
	<div id= "btn"style="width: 1620px; height: 100px;" >
		<button class="wjs_btn" style="width: 100px;" onclick="send();">보내기</button>
		<button class="wjs_btn" style="width: 100px;" onclick="miri();">미리보기</button>
		<button class="wjs_btn" style="width: 100px;">임시 저장</button>
	<form class="navbar-form navbar-left" style="float: left; margin-left: 20px;">
			<div class="input-group">
				<input type="text" value="" class="form-control" placeholder="메일 검색">
					<span class="input-group-btn"><button type="button"	style="background: #1E2B44;" class="btn btn-primary">
						<i class="fas fa-search"></i>
					</button></span>
			</div>
	</form>
	</div>
	
	<form method="post" action="sendMail.ma" id="mailForm" enctype="multipart/form-data">
		<table id="mailTable" style="margin-left: 20px;">
			<tr>
				<td class="mailtd">받는 사람</td>
				<td class="mailtd2">
				<div id="mailr" style="width: 100%;">
					<div id="ul" style="margin: 0; padding: 0; display: inline-block;">
					</div>
					<textarea  id="mailperson" class="tdinput"  style="width: 80px; border: 0px; overflow: hidden; resize: none; display: inline;" rows="1" tabindex="1"></textarea>
				</div>
				</td>
				<td class="mailtd3"><button style="width: 100px; margin-left: 20px;">주소록</button></td>
			</tr>
			<tr>
				<td class="mailtd">참조</td>
				<td class="mailtd2">
				<div id="mailr" style="width: 100%;">
					<div id="ul" style="margin: 0; padding: 0; display: inline-block;">
					</div>
					<textarea  id="mailperson" class="tdinput"  style="width: 80px; border: 0px; overflow: hidden; resize: none; display: inline;" rows="1" tabindex="1"></textarea>
				</div>
				</td>
				<td class="mailtd3"><button style="width: 100px; margin-left: 20px;">주소록</button></td>
			</tr>
			<tr>
				<td class="mailtd">제목</td>
				<td class="mailtd2">
				<div id="mailr" style="width: 100%;">
					<input class="tdinput" style="width: 100%" type="text" name="subject">
				</div>
				</td>
				<td><div></div></td>
			</tr>
			<tr>
				<td class="mailtd">파일 첨부</td>
				<td><input  type="file" name="file" multiple="multiple"></td>
				<td><div></div></td>
			</tr>
		</table><br><br>			
	<textarea cols="80" rows="14" id="summernote" name="content"></textarea>
	</form>
	</div>
	</div>

<script>
	 var i = 81;
	 
	$("#mailperson").keydown(function(key) {

		if (key.keyCode == 13) {
			$("#mailperson").css("width", '80');
			
			$("#ul").append("<div id='div' style='display: inline-block; '>" + "<input id='label' name='receiver' value='" + $("#mailperson").val() + "' >  <button class='xbtn'  type='button' name='delbtn'><i class='fas fa-times'></i> </button> </div>")
			$('#mailperson').val("");
			$('#mailperson').focus();
		}
		});
	 
		$("#mailperson").keyup(function() {
			$("#mailperson").css("width", i);
			i = i+5;
		});
		
		$("#mailperson").focus(function() {
			i= 80;
			$("#mailperson").css("width", i);
		});
		 
		
		$(document).on("click",".xbtn",function(){
	        var delList = $(this).parent().remove();
	    });

</script>
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
	
	
	function send(){
		
		$("#mailForm").submit();
		
	}
	
	function miri(){
		
		location.href = "${path}/mailComplete.ma";
	}

	</script>
</body>
</html>









