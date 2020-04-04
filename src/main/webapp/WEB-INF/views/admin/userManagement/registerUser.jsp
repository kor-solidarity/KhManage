<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
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
	margin-right: 20px;
}

.tableTd2 {
	width: 400px;
	align: center;
	
}

.register {
	width: 350px;
	height: 35px;
	border-radius: 4px;
	outline: none;
	border: 1px solid lightgray;
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
	margin-left: 180px;
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

.checkbox {
	align: left;
	margin-left: 200px;
	float: left;
}

.checkBoxArea {
	margin-left: 230px;
}

</style>
</head>
<body onload="$('#route1').text('사용자관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>

	<div class="panel panel-headline">
		<div class="panel-heading">
			<div class="border">
				
				<p>사용자 등록정보 *<p>
				<hr>
				<form>
					<table id="aa" border="0">
					<br>
						<tr class="tableTr">
							<td class="tableTd">아이디 *</td>
							<td class="tableTd2">
								<input type="text" class="register" name="userId" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 *</td>
							<td>
								<input type="password" class="register" name="password" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 확인 *</td>
							<td>
								<input type="password" class="register" name="password" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>이름 *</td>
							<td>
								<input type="text" class="register" name="userName" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>이메일 *</td>
							<td>
								<input type="email" class="register" name="email" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>부서 *</td>
							<td>
								<select name="dept" class="register">
									<option value="">선택하세요</option>
									<option value="">전략기획부</option>
									<option value="">전략기획부</option>
									<option value="">전략기획부</option>
									<option value="">전략기획부</option>
								</select>
							</td>
						</tr>
						<tr class="tableTr">
							<td>직급 *</td>
							<td>
								<input type="text" class="register" name="email" required>
							</td>
						</tr>
						<!-- <tr class="">
							<td></td>
							<td class="checkBox tr">
								<input type="checkbox" class="checkbox" name="checkbox" style="">
								<label>고객사</label>
							</td>
						</tr> -->
					</table>
						<div class="checkBoxArea">
							<input type="checkbox" class="checkbox" name="checkbox" style="">
							&nbsp;&nbsp;<label>고객사</label>
						</div>
					<hr>
					<hr>
					<br>
					<button type="submit" class="okBtn"><i class="fas fa-check"></i>&nbsp;저장</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>













