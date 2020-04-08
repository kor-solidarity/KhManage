<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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

.verifyBtn {
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

.checkbox {
	align: left;
	margin-left: 150px;
	float: left;
}

.checkBoxArea {
	margin-top: 10px;
	margin-left: 210px;
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
								<input type="text" class="register form-control" name="memberId"focus>
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 *</td>
							<td></td>
							<td>
								<input type="password" class="register form-control" name="memberPwd">
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 확인 *</td>
							<td></td>
							<td>
								<input type="password" class="register form-control" name="memberPwd2">
							</td>
						</tr>
						<tr class="tableTr">
							<td>이름 *</td>
							<td></td>
							<td>
								<input type="text" class="register form-control" name="memberName">
							</td>
						</tr>
						<tr class="tableTr">
							<td>휴대폰번호 *</td>
							<td></td>
							<td>
								<input type="text" class="register form-control" name="phone">
							</td>
							<!-- 회원가입 시 인증번호 전송 -->
							<td hidden>
								<button class="verifyBtn" style="margin-left: 10px; width: 120px;">인증번호 전송</button>
							</td>
						</tr>
						<tr class="tableTr">
							<td>이메일 *</td>
							<td></td>
							<td>
								<input type="email" class="register form-control" name="email">
							</td>
						</tr>
						<tr id="hide1" class="tableTr">
							<td>소속 부서 *</td>
							<td></td>
							<td>
								<select id="deptNo" class="register form-control" >
									<option class="form-control" value="#">선택하세요</option>
									<c:forEach var="a" items="${list}">
										<option class="form-control" value="${a.deptNo}">
											<c:out value="${a.deptName}"/>
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr id="hide2" class="tableTr">
							<td>소속 팀 *</td>
							<td></td>
							<td>
								<select id="deptTeam" class="register form-control"  name="deptNo">
									<option id="deptTeamOption" class="form-control" value="#">선택하세요</option>
								</select>
							</td>
						</tr>
						<tr id="hide3" class="tableTr">
							<td>직급 *</td>
							<td></td>
							<td>
								<select id="rank" class="register form-control"  name="rankNo">
									<option class="form-control" value="#">선택하세요</option>
									<c:forEach var="r" items="${rlist}">
										<option class="form-control" value="${r.rankNo}" class="form-control">
											<c:out value="${r.rankName}"/>
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<!-- <tr class="">
							<td></td>
							<td class="checkBox tr">
								<input type="checkbox" class="checkbox" name="checkbox" style="">
								<label>고객사</label>
							</td>
						</tr> -->
						<tr class="tableTr" id="hide4" hidden>
							<td>소속 프로젝트 *</td>
							<td></td>
							<td>
								<!-- <input type="text" id="rank" class="register form-control" name="rank"> -->
								<select id="projectList" class="register form-control" name="projectName">
									<option>선택하세요</option>
								</select>
							</td>
						</tr>
					</table>
						<div class="checkBoxArea">
							<label>
							<input type="checkbox" id="customer" class="checkbox" name="customer" style="">
							&nbsp;&nbsp;고객사
							<input type="hidden" id="memberType" name="memberType" value="0">
							</label>
						</div>
					<br>
					<hr>
					<br>
					<button type="submit" class="okBtn"><i class="fas fa-check"></i>&nbsp;저장</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="cancleBtn"><i class="fas fa-ban" onclick="goBack()"></i>&nbsp;취소</button>
					<br><br>
				</form>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	
	
	
	
	<script>
	
	//체크박스 체크 시 disabled
	$(function() {
	
		$(".checkbox").change(function() {
			
			if($(".checkbox").prop("checked")) {
				
				$("#hide1").hide();
				$("#hide2").hide();
				$("#hide3").hide();
				$("#hide4").show();
			} else {
				
				$("#hide1").show();
				$("#hide2").show();
				$("#hide3").show();
				$("#hide4").hide();
			}
			
		});
	});
	
	$("#customer").on("change", function(){
		if($("#customer").prop("checked")){
			$("#memberType").val(1);
			console.log($("#memberType").val());
		}else{
			$("#memberType").val(0);
			console.log($("#memberType").val());
		}
		
	});
	
	
	//Alert
	$(".okBtn").click(function(){
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
	
	
	//하위부서 select Ajax
	$(function(){
		$("#deptNo").on('change', function(){
			var name = $(this).val();
			 $.ajax({
				url:'selectTeam.me',
				type: 'post',
				data: {deptNo:name},
				
			 	success:function(data){
					$("#deptTeam").empty();
					
						 for(key in data) {
							$("#deptTeam").append("<option value='" + data[key]['deptNo']+ "'>"+ data[key]['deptName'] + "</option>");
						 }
				 }
			}); 
		});
	});
	
	
	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
</body>
</html>














