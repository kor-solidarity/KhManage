<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
.selectMenu {
	border: 1px solid lightgray;
	width: 400px;
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
.inputTd{
	width: 500px;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('탬플릿 등록');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 500px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
					
					
					<form  method="post" action="tempInsert.am" id="tempForm" enctype="multipart/form-data">
					<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">템플릿 등록 정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">템플릿 명</td>
							<td class="inputTd">
								<input type="text" class="inputMenu" name="templateName" style="width:100%;">
							</td>
							<td class="titleId" style="padding-left:100px;">템플릿 분류</td>
							<td class="inputTd">
							<select style="width: 100%;" name="projectTypePk">
								<option>선택하세요</option>
								<option value="PTY001">개발형태1</option>
								<option value="PTY002">개발형태2</option>
								<option value="PTY003">개발형태3</option>
								<option value="PTY004">개발형태4</option>
								<option value="PTY005">개발형태5</option>
							</select>
							</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:90px;">템플릿 설명</td>
							<td colspan="3">
								<textarea name="detail" class="inputMenu"rows="" cols="" style="width:100%; height:150px; resize: none;"></textarea>
							</td>
						</tr>
						<tr height="10pxdj;"></tr>
						
						
						<tr>
							<td class="titleText" colspan="2">템플릿 엑셀 등록 정보</td>
						</tr>
						
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td class="titleId" style="padding-left:90px;">템플릿 엑셀 등록</td>
							<td style="height: 120px;">
								<input type="file" name="upfile"> <p >Excel, Xml 파일 업로드 가능</p>
							</td>
							<td class="titleId" style="padding-left:90px;">템플릿 등록 샘플</td>
							<td class="titleId" style="padding-left:90px;">템플릿 등록 샘플</td>
						</tr>
						
						
						<tr>
							<td colspan="2">
								<button class="okBtn" id="save">
									<i class="fas fa-check"></i>&nbsp;저장
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<button class="cancleBtn">
									<i class="fas fa-ban"></i>&nbsp;취소
								</button>
							</td>
						</tr>
						</table>
						</form>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	$("#save").click(function(){
		swal({
	    	title: "템플릿이 등록되었습니다.",
	      	icon: "success"
	    })
		
		$("#tempForm").submit();
	})
</script>

</html>





