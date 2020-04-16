<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titleText {
	padding-top: 13px;
	padding-left: 13px;
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
}
.inputMenu {
	border: 1px solid lightgray;
	width: 300px;
	outline:none;
	border-radius: 5px;
}
.titleId {
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
	padding-right: 10px;
	width:200px;
}
.insertForm{
	width:100%;
	margin: 0 auto;
}
.cancleBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
}

.okBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 100px;
}
</style>
</head>
<body onload="$('#route1').text('일반 작업'); $('#route2').text('일반 작업등록');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 600px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
				<form id="form1" action="insertAccessGroup.am">
					<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">일반작업 등록 정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						</table>
						<table align="left" style="width:100%;">
						<tr>
							<td class="titleId" style="padding-left:100px;">작업 종류</td>
							<td>
								<select class="inputMenu" style="width:200px;">
									<option>일반 작업</option>
								</select>
							</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">시작일</td>
							<td><input name="accessName" type="date" required class="inputMenu" style="width:200px; border:1px solid #F3565D;"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">완료일</td>
							<td><input name="accessName" type="date" required class="inputMenu" style="width:200px; border:1px solid #F3565D;"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">작업 제목</td>
							<td><input name="accessName" type="text" required class="inputMenu" style="width:70%;"></td>
						</tr>	
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">작업 설명</td>
							<td>
								<textarea name="aContent" required="required" class="inputMenu" rows="" cols="10" style="width:70%; height:150px;"></textarea>
							</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">첨부 파일</td>
							<td>
								<div class="inputMenu" style="width:70%; height:60px; border:1px solid lightgray;">
									<input type="file" style="margin-top: 15px; margin-left: 10px;">
								</div>
							</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button" class="okBtn" id="save" onclick="sweetTest();">
									<i class="fas fa-check"></i>&nbsp;저장
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="accessManage.am">
								<button type="button" class="cancleBtn" onclick="history.go(-1)">
									<i class="fas fa-ban"></i>&nbsp;취소
								</button>
								</a>
							</td>
						</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
</html>