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

	#img{
		width: 	200px;
		height: 200px;
		margin-left: 690px;
		border-radius: 100px;
		margin-top: 50px;
	}
	#p{
		margin-left: 640px;	
		margin-top: 50px;
		font-size: 23px;
		font-weight: bold;
	}
	#td1{
		width: 250px;
		height: 40px;
	}
	#td2{
		width: 400px;
		text-align: center;
	}
	#star{
		width: 15px;
		height: 15px;
		margin-left: 20px;
		margin-right: 30px;
		margin-bottom: 3px;
	}
	label{
		font-weight: bold;
		margin-top: 3px;
	}
	#save{
		width: 150px;
		height: 35px;
     	 border:none;
      	background: #1E2B44;
     	 color:white;
      	font-weight:600;
     	 border-radius: 5px;
    	  font-size:14px;
     	 margin-left: 720px;
     	 margin-top: 100px;
	}
	
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/mailSidebar.jsp"/>
	<div class="panel panel-headline">
		<div class="panel-heading">
		
		<div style="width: 100%; margin-bottom: 60px;">
		<img src="resources/img/plain.png" id="img">
		<p id="p">메일이 성공적으로 보내졌습니다.</p>
		</div>
		
		
		
		<table align="center" border="1px; solid; black;">
			<tr>
				<td id="td1">
					<img src="resources/img/star.png" id="star"><label >이름</label>
				</td>
				<td id="td2">
					<label >이메일 주소</label>
				</td>
			</tr>
			<tr>
				<td id="td1">
					<img src="resources/img/star.png" id="star"><label >이름</label>
				</td>
				<td id="td2">
					<label >이메일 주소</label>
				</td>
			</tr>
		</table>
		
		
		<button id="save">주소록에 저장</button>
			
	
		
	
	
	</div>
	</div>	
</body>
<script>

</script>
</html>





