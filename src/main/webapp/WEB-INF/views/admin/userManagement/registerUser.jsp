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
	width: 500px;
	align: center;
}

.tableTd3 {
	width: 30px;
}

.register form-control {
	width: 350px;
	height: 35px;
	border-radius: 4px;
	outline: none;
	border: 1px solid lightgray;
	padding-left: 15px;
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
	margin-left: 180px;
	float: left;
}

.checkBoxArea {
	margin-left: 230px;
}

</style>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('사용자관리'); $('#route3').text('사용자등록');">

	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>

	<div class="panel panel-headline">
		<div class="panel-heading">
			<div class="border">
				
				<p>사용자 등록정보 *<p>
				<hr>
				<form action="insert.me" method="post">
					<table id="aa" border="0">
					<br>
						<tr class="tableTr">
							<td class="tableTd">아이디 *</td>
							<td class="tableTd3"></td>
							<td class="tableTd2">
								<input type="text" class="register form-control" name="memberId" required focus >
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 *</td>
							<td></td>
							<td>
								<input type="password" class="register form-control" name="memberPwd" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 확인 *</td>
							<td></td>
							<td>
								<input type="password" class="register form-control" name="memberPwd2" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>이름 *</td>
							<td></td>
							<td>
								<input type="text" class="register form-control" name="memberName" required>
							</td>
						</tr>
						<tr class="tableTr">
							<td>이메일 *</td>
							<td></td>
							<td>
								<input type="email" class="register form-control" name="email">
							</td>
						</tr>
						<tr class="tableTr">
							<td>부서 *</td>
							<td></td>
							<td>
								<select class="register form-control"  name="deptCode">
									<option value="#">선택하세요</option>
									<option value="1">전략기획부</option>
									<option value="2">전략기획부</option>
									<option value="3">전략기획부</option>
									<option value="4">전략기획부</option>
								</select>
							</td>
						</tr>
						<tr class="tableTr">
							<td>직급 *</td>
							<td></td>
							<td>
								<input type="text" class="register form-control" name="email">
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
							<input type="checkbox" class="checkbox" name="" style="">
							&nbsp;&nbsp;<label>고객사</label>
						</div>
					<br>
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













