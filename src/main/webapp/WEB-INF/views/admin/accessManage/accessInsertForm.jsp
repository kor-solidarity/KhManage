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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('권한그룹 등록');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 300px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
					<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">권한그룹 등록 정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						</table>
						<table align="left" style="width:100%;">
						<tr>
							<td class="titleId" style="padding-left:100px;">권한그룹 명</td>
							<td><input type="text" class="inputMenu" style="width:100%;"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left:90px;">권한그룹 설명</td>
							<td>
								<textarea class="inputMenu"rows="" cols="" style="width:100%; height:150px;"></textarea>
							</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<button class="okBtn" id="save">
									<i class="fas fa-check"></i>&nbsp;저장
								</button>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<a href="accessManage.am">
								<button class="cancleBtn">
									<i class="fas fa-ban"></i>&nbsp;취소
								</button>
								</a>
							</td>
						</tr>
						</table>
						<script>
							$("#save").click(function(){
								swal({	
									  title: 'Are you sure?',
									  text: "You won't be able to revert this!",
									  icon: 'warning',
									  showCancelButton: true,
									  confirmButtonText: 'Yes, delete it!',
									  cancelButtonText: 'No, cancel!',
									  reverseButtons: true
									}).then((result) => {
									  if (result.value) {
									    swalWithBootstrapButtons.fire(
									      'Deleted!',
									      'Your file has been deleted.',
									      'success'
									    )
									  } else if (
									    /* Read more about handling dismissals below */
									    result.dismiss === Swal.DismissReason.cancel
									  ) {
									    swalWithBootstrapButtons.fire(
									      'Cancelled',
									      'Your imaginary file is safe :)',
									      'error'
									    )
									  }
									})
							});
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>