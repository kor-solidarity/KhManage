<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
	/* .wjs_btn{
		border-radius: 5px;
		border: 1px solid #D4D4D4;
		float: left;
		margin-top: 25px;
		margin-left: 10px;
		background: white;
		color: #8F8E8E;
	} */
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
	#mailTable{
		width:100%;
		text-align:left;
		margin-top: 100px;
	}
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
		height: 35px;
		width: 400px;
	}
	.titletd{
		height: 35px;
		text-align: center;
		width: 560px;
	}
	.datetd{
		height: 35px;
		text-align: center;
		width: 350px;
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/mailSidebar.jsp"/>
	<div class="panel panel-headline">
	<div class="panel-heading">
	
	<div>
	<img src="resources/img/rec2.png" style="width: 30px; height: 30px; float: left; margin-top: 6px; margin-right: 15px; margin-left: 10px;">
	<p style="font-weight: bold; font-size: 32px; margin-top: 10px; margin-left: 10px;">받은 메일함</p>
	
	</div>
	
	<div id= "btn"style="width: 1620px;">
		<button class="wjs_btn" style="width: 100px;">전체 선택</button>
		<button class="wjs_btn" style="width: 50px;">답장</button>
		<button class="wjs_btn" style="width: 50px;">삭제</button>
		<button class="wjs_btn" style="width: 50px;">읽음</button>
			
	</div>
		<form class="navbar-form navbar-left" style="float: left; margin-left: 20px;">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="메일 검색">
						<span class="input-group-btn"><button type="button"
								style="background: #1E2B44;" class="btn btn-primary">
								<i class="fas fa-search"></i>
							</button></span>
					</div>
		</form>
	
	<table id="mailTable" align="center">
		<tr style="border: 1px solid #D9D8D8;">
			<td class="chktd"><input type="checkbox"></td>
			<td class="startd"><img  src="resources/img/star.png" class="star"></td>
			<td class="mailtd"><img  src="resources/img/mail.png" class="mail"></td>			
			<td class="sendtd">보낸사람</td>
			<td class="titletd">제목</td>
			<td class="datetd">날짜</td>
		</tr>
		<tr>
			<td class="chktd"><input type="checkbox"></td>
			<td class="startd"><img  src="resources/img/star.png" class="star"></td>
			<td class="mailtd"><img  src="resources/img/mail.png" class="mail"></td>
			<td class="sendtd">보낸사람</td>
			<td class="titletd">제목</td>
			<td class="datetd">날짜</td>
		</tr>
	
	</table>
	
	</div>
	</div>	
</body>
<script>
	$("#mainTable tr").click(function(){
	 /* var num = $(this).parent().children("input").val(); */
	 
/* 	 location.href="mailReceived.ma";
 */	 
});

</script>
</html>





