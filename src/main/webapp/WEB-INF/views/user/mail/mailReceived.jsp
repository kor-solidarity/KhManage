<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
   #mailTable{
		text-align:left;
		margin-top: 20px;
		margin-bottom: 20px;
		margin-left: 15px;
	}
	.mailtd{
		width: 100px;
		height: 40px;
		font-weight: bold;
	}
	.mailtd2{
		width: 500px;
		height: 60px;
	}
	.star{
		width: 18px;
		height: 18px;
	}
	#mailtext{
		width: 100%;
		height: 300px;
	}
</style>
</head>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/mailSidebar.jsp"/>
	<p style="font-weight: bold; font-size: 35px; margin-top: 10px; margin-left: 10px;">받은 메일함</p>
	
	<div style="width: 100%; height: 50px;">
		<button class="wjs_btn" style="width: 50px;">답장</button>
		<button class="wjs_btn" style="width: 50px;">삭제</button>
		<button class="wjs_btn" style="width: 50px;">읽음</button>
		<button class="wjs_btn" style="width: 100px;">스팸 신고</button>
	</div>
	<br>
	
	<hr align="left" style="border: solid 1px #C7C5C5; width:90%;  ">
		<table id="mailTable">
			<tr>
				<td class="mailtd"><img class="star" src="resources/img/star.png"></td>
				<td class="mailtd2">메일 제목</td>
			</tr>
			<tr>
				<td class="mailtd">보낸 사람</td>
				<td class="mailtd2">보낸 사람</td>
			</tr>
			<tr>
				<td class="mailtd">받는 사람</td>
				<td class="mailtd2">받는 사람</td>
			</tr>
		</table>
		
	<hr align="left" style="border: solid 1px #C7C5C5; width:90%;  ">	
	
	<div id="mailtext">
	
	
	</div>
	
	<hr align="left" style="border: solid 1px #C7C5C5; width:90%;  ">

</body>



</html>



