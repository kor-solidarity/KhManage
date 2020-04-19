<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
<link href="${ path }/resources/summernote/summernote-lite.css" rel="stylesheet">
<script src="${ path }/resources/summernote/summernote-lite.js"></script>

<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
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
	text-align: left;
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
	/* margin-left: 20px; */
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

.summernote{
	border: 1px solid lightgray;
	width: 80%;
	border-radius: 5px;

}

/* div {
	margin: 10px;
} */

</style>
</head>
<body onload="$('#route1').text('커뮤니티'); $('#route2').text('정보공유게시판'); $('#route3').text('게시글작성');">

	

	<div class="panel panel-headline">
		<div class="panel-heading" style="padding: -1px;">
			<div class="border">
				
				<p style="color: #5E738B">게시글 정보<p>
				<hr>

				<div class="" style="margin-left: 20px;">				
					<form action="" method="post">
						<div>제목</div>
						<div>
							<input type="text" id="memberId" class="register form-control" name="memberId" placeholder="제목을 입력해주세요." focus
											oninvalid="this.setCustomValidity('아이디를 입력해주세요.')" oninput="('ㄴㄴㄴㄴㄴ')">
						</div><br>
						<div>포스트내용</div>
						<div style="width: 100%">
							<textarea cols="80" rows="14" class="summernote form-control note-editor note-frame" id="summernote" name="noticeContent" style="width: 100%; !important">
							</textarea>
						</div>
						
						
						<br>
						<div class="">
							<button type="submit" class="okBtn" onclick="submitSweet()"><i class="fas fa-check"></i>&nbsp;저장</button>
								&nbsp;&nbsp;&nbsp;&nbsp;
							<button type="reset" class="cancleBtn"><i class="fas fa-ban" onclick="goBack()"></i>&nbsp;취소</button>
						</div>
					
					
					</form>
				</div>





					
					<table id="aa" border="0">
					
					
						<tr class="tableTr">
							<td class="tableTd">아이디</td>
							<td class="tableTd3"></td>
							<td class="tableTd2">
								<input type="text" id="memberId" class="register form-control" name="memberId" focus
										oninvalid="this.setCustomValidity('아이디를 입력해주세요.')" oninput="('ㄴㄴㄴㄴㄴ')">
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<input type="password" id="password1" class="register form-control" name="memberPwd">
							</td>
						</tr>
						<tr class="tableTr">
							<td>패스워드 확인<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<input type="password" id="password2" class="register form-control" name="memberPwd2">
							</td>
						</tr>
						
						<!-- 패스워드 유효성 검사 Begin -->
						<tr class="hiddenTr">
							<td class=""></td>
							<td class=""></td>
							<td class="msg-td-password"><div id="incorrectPwd" class="ajax-msg-pwdNotOk" style="color:orangered; font-size: 12px; display:none">패스워드가 일치하지 않습니다.</div>
								<!-- <div id="correctPwd" class="ajax-msg-pwdOk" style="color:#048000"></div> -->
							</td>
						</tr><!-- 패스워드 유효성 검사 Begin -->
						
						<tr class="tableTr">
							<td>이름<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<input type="text" id="memberName" class="register form-control" name="memberName">
							</td>
						</tr>
						<tr class="tableTr">
							<td>휴대폰번호<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<input type="text" id="phone" class="register form-control" name="phone" style="color:#676A6D">
							</td>
						</tr>
						<tr class="tableTr">
							<td>이메일<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<input type="email" id="email" class="register form-control" name="email">
							</td>
						</tr>
						<tr id="hide1" class="tableTr">
							<td>소속 부서<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<select id="deptNo" class="register form-control" name="deptNo">
									<option id="deptSelect" class="form-control" value="0">선택하세요</option>
									<c:forEach var="a" items="${list}">
										<option class="form-control" value="${a.deptNo}">
											<c:out value="${a.deptName}"/>
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr id="hide2" class="tableTr">
							<td>소속 팀<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<select id="deptTeam" class="register form-control" name="deptNo">
									<option class="form-control" value="0">선택하세요</option>
									<!-- <option id="deptTeamOption" class="form-control" value="#">선택하세요</option> -->
								</select>
							</td>
						</tr>
						<tr id="hide3" class="tableTr">
							<td>직급<span style="color:red;"> *</span></td>
							<td></td>
							<td>
								<select id="rank" class="register form-control"  name="rankNo">
									<option id="rank" class="form-control" value="0">선택하세요</option>
									<c:forEach var="r" items="${rlist}">
										<option class="form-control" value="${r.rankNo}">
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
							<td>소속 프로젝트<span style="color:red;"> *</span></td>
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
					
					<button type="submit" class="okBtn" onclick="submitSweet()"><i class="fas fa-check"></i>&nbsp;저장</button>
					&nbsp;&nbsp;&nbsp;&nbsp;
					<button type="reset" class="cancleBtn"><i class="fas fa-ban" onclick="goBack()"></i>&nbsp;취소</button>
					
					<br><br>
				</form>
			</div>
		</div>
	</div>
	<br><br><br><br><br>
	
	
	
	
	<script>
		
	//summernote 설정
	$(document).ready(function() {
	   //여기 아래 부분
	   $('#summernote').summernote({
	        height: 300,                 // 에디터 높이
	        /* width: 100, */
	        minHeight: null,             // 최소 높이
	        maxHeight: null,             // 최대 높이
	        focus: false,                  // 에디터 로딩후 포커스를 맞출지 여부
	        lang: "ko-KR",               // 한글 설정
	        /* placeholder: '최대 2048자까지 쓸 수 있습니다' */   //placeholder 설정
		   });
	});
	
	
	
	
	
	</script>
	
	
	
	
	
</body>
</html>














