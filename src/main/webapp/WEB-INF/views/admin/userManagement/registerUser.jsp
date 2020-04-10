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
								<input type="text" id="memberId" class="register form-control" name="memberId" focus required
										oninvalid="this.setCustomValidity('아이디를 입력해주세요.')" oninput="('ㄴㄴㄴㄴㄴ')">
							</td>
						</tr>
						<!-- 아이디 유효성 검사 -->
						<tr class="hiddenTr" height="0">
							<td class=""></td>
							<td class=""></td>
							<td class="msg-td-memberId">&nbsp;
								<!-- <div id="availableId" class="ajax-msg-idOk" style="color:#048000; font-size: 12px; display:inline-block">사용가능한 아이디 입니다.</div>
								<div id="unavailableId" class="ajax-msg-notOk" style="color:orangered; font-size: 12px;">&nbsp;&nbsp;&nbsp;아이디가 중복됩니다.</div> -->
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 *</td>
							<td></td>
							<td>
								<input type="password" id="password1" class="register form-control" name="memberPwd" required >
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 확인 *</td>
							<td></td>
							<td>
								<input type="password" id="password2" class="register form-control" name="memberPwd2" required >
							</td>
						</tr>
						
						<!-- 패스워드 유효성 검사 -->
						<tr class="hiddenTr">
							<td class=""></td>
							<td class=""></td>
							<td class="msg-td-password">&nbsp;<div id="incorrectPwd" class="ajax-msg-pwdNotOk" style="color:orangered; font-size: 12px; display:none">패스워드가 일치하지 않습니다.</div>
								<!-- <div id="correctPwd" class="ajax-msg-pwdOk" style="color:#048000"></div> -->
							
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
								<input type="text" id="" class="register form-control" name="phone" style="color:#676A6D">
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
	
	
	//-------------- 회원가입 유효성 검사-----------------

	// 아이디 중복검사
	$("#unavailableId").hide();
	
	var idResult = false; //아이디 초기화
	
	$("#memberId").keyup(function(){
		var name = $('#memberId').val();	
		$.ajax({
			url: 'checkMemberId.me',
			type: "post",
			data: {memberId:name},
			success:  function(data) {
				if(data == 1){
					console.log('중복');
					
					/* var unavailableId= $("<div>"); */
					
					$("#msg-td-memberId").append("<div>" + "아이디가 중복됩니다." + "</div>").show();
					
					/* $("#msg-td-memberId").append("<div id="unavailableId" class="ajax-msg-notOk" style="color:orangered; font-size: 12px;">&nbsp;&nbsp;&nbsp;아이디가 중복됩니다.</div>"); */
					
				}else{
					console.log('사용가능');
				}
			},
			error: function(error) {
			}
			
		});
	});
	
	/* <div id="availableId" class="ajax-msg-idOk" style="color:#048000; font-size: 12px; display:inline-block">사용가능한 아이디 입니다.</div>
	<div id="unavailableId" class="ajax-msg-notOk" style="color:orangered; font-size: 12px;">&nbsp;&nbsp;&nbsp;아이디가 중복됩니다.</div> */
	
	
	
	// 비밀번호 유효성 검사
	$(".hiddenTr").hide()
	$("#correctPwd").hide();
	$("#incorrectPwd").hide();
	
	$("input").keyup(function() {
		
		var password1 = $("#password1").val();
		var password2 = $("#password2").val();
		
		if(password1 != "" && password2 != "") {
			
			if(password1 == password2) {
				/* $("#msg-pwdOk").show(); */
				$("#incorrectPwd").hide();
				$(".hiddenTr").hide()
			} else {
				$("#incorrectPwd").show();
				$(".hiddenTr").show()
			}
		} else {
			$(".hiddenTr").hide()
			$("#incorrectPwd").hide();		
		}
		
	});
	
	
	
	
	
	
	
	
	</script>
	
	
	
	
	
	
	
	
	
	
</body>
</html>














