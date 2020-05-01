<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		height: 40px;
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
	<div class="panel panel-headline">
		<div class="panel-heading">
		
	<div>
	<img src="resources/img/mail.png" style="width: 30px; height: 30px; float: left; margin-top: 6px; margin-right: 15px; margin-left: 10px;">
	<p style="font-weight: bold; font-size: 32px; margin-top: 10px; margin-left: 10px;">보낸 메일함</p>
	</div>	
	
	
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
				<td class="mailtd2">${mail.subject }</td>
			</tr>
			<tr>
				<td class="mailtd">보낸 사람</td>
				<td class="mailtd2">${mail.from }</td>
			</tr>
			<tr>
				<td class="mailtd">받는 사람</td>
				<td class="mailtd2">${mail.receiver }</td>
			</tr>
			<c:if test="${mail.atMail != null }">
			<tr>
				<td class="mailtd" >첨부파일</td>
				<td><a href="download.ma?no=${mail.atMail.get(0).eaNo}">${mail.atMail.get(0).originName} </a><input type="hidden" value="${mail.atMail.get(0).eaNo }" ></td>
			</tr>
			<c:forEach var="a" begin="1" items="${mail.atMail}">
			<tr>
				<td class="mailtd"></td>
				<td><a>${a.originName } </a><input type="hidden" value="${a.eaNo }" ></td>
			</tr>
			</c:forEach>
			</c:if>
		</table>
		
	<hr align="left" style="border: solid 1px #C7C5C5; width:90%;  ">	
	
	<table>
	<tr>
		<td>
		<div id="mailtext">
			${mail.content}
		</div>
		
		</td>
	</tr>
	</table>
	
	
	
	
	<hr align="left" style="border: solid 1px #C7C5C5; width:90%;  ">
	</div>
	</div>
</body>


<script>
	$(function(){
		
		var nn = ${mail};
		
		var dff = ${mail.atMail.size()}
		
		//var dd = ${mail.atMail};
		console.log(dd);
		
		console.log(nn);
		console.log("asdsadsad");
		
	})
</script>


</html>



