<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<!-- include libraries(jQuery, bootstrap) -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<!-- include summernote css/js -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.16/dist/summernote.min.js"></script>


<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
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
   	width: 1000px;
   	text-align: left;
   	   	height: 50px
   }
   .mailtd3{
   	width: 150px;
   }
   .tdinput{
   	width: 1000px;
   }
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/mailSidebar.jsp"/>
	<div class="panel panel-headline">
		<div class="panel-heading">
	<div>
	<img src="resources/img/folder.png" style="width: 30px; height: 30px; float: left; margin-top: 6px; margin-right: 15px; margin-left: 10px;">
	<p style="font-weight: bold; font-size: 32px; margin-top: 10px; margin-left: 10px;">편지 쓰기</p>
	</div>	
	
	<div id= "btn"style="width: 1620px; height: 100px;" >
		<button class="wjs_btn" style="width: 100px;">보내기</button>
		<button class="wjs_btn" style="width: 100px;">미리보기</button>
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
	
	<form>
		<table id="mailTable" style="margin-left: 20px;">
			<tr>
				<td class="mailtd">받는 사람</td>
				<td class="mailtd2"><input class="tdinput" type="text"></td>
				<td class="mailtd3"><button style="width: 100px; margin-left: 20px;">주소록</button></td>
			</tr>
			<tr>
				<td class="mailtd">제목</td>
				<td class="mailtd2"><input class="tdinput" type="text"></td>
				<td><div></div></td>
			</tr>
			<tr>
				<td class="mailtd">파일 첨부</td>
				<td><input  type="file"  ></td>
				<td><div></div></td>
			</tr>
			
			
		</table>			
	
	</form>
	
	<div id="summernote">Hello Summernote</div>
	


	
</body>
<script>
	$(document).ready(function() { 
		$('#summernote').summernote();
	});
</script>

</html>









