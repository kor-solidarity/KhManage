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
	/* background: ; */
	height: 50px;
	margin: 0 auto;
	/* border: 1px solid #B0B0B0; */
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

/* .cancleBtn{
      width:70px;
      height:30px;
      border:none;
      background:#E5E5E5;
      color:white;
      font-weight:600;
      border-radius: 5px;
      font-size:14px;
	}    */
	/* #boardTable{
		width:95%;
		text-align:left;
		margin-top: 100px;
	} */
	.star{
		width: 18px;
		height: 18px;
	}
	.mail{
		width: 18px;
		height: 18px;
	}
	.chktd{
		width: 90px;
		height: 35px;
		text-align: center;
	}
	.startd{
		width: 90px;
		text-align: center;
		height: 35px;
	}
	.mailtd{
		width: 90px;
		height: 35px;
		text-align: center;
	}
	.sendtd{
		text-align: center;
		height: 45px;
		width: 220px;
	}
	.titletd{
		height: 20px;
		text-align: center;
		width: 700px;
		padding-right: 100px;
	}
	.datetd{
		height: 45px;
		text-align: center;
		width: 250px;
	}
	.sendtd2{
		text-align: center;
		height: 30px;
		width: 130px;
	}
	.titletd2{
		height: 45px;
		text-align: left;
		width: 800px;
		padding-left: 30px;
	}
	.datetd2{
		height: 22px;
		text-align: center;
		width: 250px;
	}
	#boardTable #tr:hover{
		background : #f5f8ff;
		cursor: pointer;
		color: black;
	}
	.td{
		width: 10px;
	}	
	
	#tr {
		height: 30px;
	}
	
	.tr {
		background: #F3F3F3;
		border-top: 1px solid gray;
	}
	
</style>
</head>
<body onload="$('#route1').text('커뮤니티'); $('#route2').text('설문조사')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<!-- 영역시작 -->   
	<div class="panel panel-headline">
		<div class="panel-heading" style="height: 800px;">

			



 		</div>
	</div>
 
</body>

<script>
	
	
	
</script>


</html>





