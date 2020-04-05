<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

html {
	width:1440px;
	background: #1E2B44;
	margin:0 auto;
}
body {
	margin: 0 auto;
}

.LogoArea {
	align: center;
	margin: 0 auto;
		
}

.content {
	background: #ECEEF1;
	width: 500px;
	height: 360px;
	margin: 0 auto;
	margin-top: 200px;
}

.form-control {
	background: #DDE3EC;
	width: 400px;
	height: 40px;
	border: none;
	padding-left: 20px;
	font-size: 16px;
}

.btn {
	background: #45B6AF;
	border: none;
	color: white;
	font-weight: bold;
	font-size: 16px;
	width: 100px;
	height: 40px;
	margin-top: 30px;
}

#rememberMe{
	color: gray;
	margin-top: 30px;
}


</style>
</head>
<body>
	<div id="wrap">
		 
		 <!-- Begin Logo -->
			<div class="LogoArea" style="align:center">
				<%-- <img src="<c:url value="/resources/assets/img/newlogowhite.png"/>"style="width: 20%; height: 20%;"> --%> 
			</div> <!-- End Logo -->
		
		<!-- Begin Login Form -->
		<div class="content"> 
			<h3 align="center" class="form-title" style="font-size: 35px; padding-top: 30px; color:#45B6AF;">로그인</h3>
			<form action="login.me" method="post">
			
				<!-- <div class="alert alert-danger display-hide">
               	<button class="close" data-close="alert"></button>
                <span>
                	이메일주소와 패스워드를 입력하세요.
                </span>
            	</div> -->
	            <table align="center">
	            	<tr>
	            		<td>
	            			 <input class="form-control form-control-solid placeholder-no-fix" type="text" autocomplete="off" placeholder="아이디를 입력하세요." name="memberId" />
	            		</td>
	            	</tr>
	            	<tr>
	            		<td>
	            			<input class="form-control form-control-solid placeholder-no-fix" type="password" autocomplete="off" placeholder="패스워드" name="memberPwd" />
	            		</td>
	            	</tr>
	            	<!-- <tr>
	            		<td>
	            			<input id="rememberMe" name="rememberMe" type="checkbox" value="true" /><input name="rememberMe" type="hidden" value="false" />로그인 상태 유지
	            		</td>
	            	</tr> -->
	            	<tr>
	            		<td>
	            			<button type="submit" class="btn btn-success uppercase">
			                    <i class="icon-login"></i>로그인
			                </button>
	            		</td>
	            	</tr>
	            </table>
			</form>
		</div> <!-- End Login Form -->
	
	
	
	
	</div>
</body>
</html>














