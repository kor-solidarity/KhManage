<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
    
    <script>
       /*  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-87786286-1', 'auto');
        ga('send', 'pageview'); */
    </script>


<style>

.col-md-4 {
	background: white;
	width: 25%;
	height: 700px;
	/* border: 1px solid blue; */
	
}

.col-md-4 col-sm-4 text-center {
	height: 700px;
	/* border: 1px solid green; */
}

.col-md-8 {
	width: 65%;
	background: white;
	height: 700px;
	/* border: 1px solid red; */
}

.profileBtn {
	width:120px;
	height:30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
}

.updatePassword {
	width:120px;
	height:30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
}

.profileImg {
	width:160px;
	height:30px;
	border:none;
	background:#1E2B44;
	color:white;
	font-weight:600;
	border-radius: 5px;
	font-size:14px;
}

.portlet-body {
	/* width: 100%; */
	border: 1px solid lightgray;
	padding : 20px;
	height: 600px;
	
}

.left {
	width: 50%;
}

.pImamageDiv {
	width: 140px;
	height: 140px;
	border-radius: 70%;
	overflow: hidden;
	margin-bottom: 50px;
	margin-left: 60px;
}

.pImamage {
	width: 100%;
	heigh: 100%;
	object-fit: cover;
	/* margin-left: 25%; */
}




</style>


</head>
<body onload="$('#route1').text('프로필')">
	
	<c:set var="contextPath" value="${ pageContext.servletContext.contextPath }" scope="application"/>

	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<br><br>
	<div id="wrap">
		
		<c:if test="${ !empty sessionScope.loginUser }">
		
		<div class="row fadeInUp animated">

		<!-- 페이지 좌측 작업현황 Begin -->
        <div class="col-md-4 left" style="float: left">
            <div class="portlet light bordered min-height-600">
                <div class="portlet-body">
                    <div class="user-bg">
                        <div class="overlay-box">
                            <div class="user-content"><br>
                                    <!-- <a href=""><img src="" class="thumb-lg" alt="image"></a> -->

                                <div class="pImamageDiv">
                                	<%-- <img src="<c:url value="/resources/img/profile.png"/>" class="thumb-lg pImamage"> --%>
                                	<img class="thumb-lg pImamage" src="<c:url value="resources/uploadFiles/${at.changeName}.png"/>">
                                </div>
                                
                                <div class="" style="align: center;">
	                                <h4 class="text-white" style="margin-left: 25%">${loginUser.memberName}</h4>
	                                <h5 class="text-white" style="margin-left: 25%">${loginUser.email}</h5>
                                </div>
                            </div>
                        </div>
                    </div><br><br>

                    <div class="user-btm-box" style="height: 300px">
                        <div class="col-md-4 col-sm-4 text-center" style="height: 300px">
                            <p class="text-purple">
                                <i class="linea-icon linea-basic fa-fw" data-icon=""></i> 내작업
                            </p>
                            <h1>3</h1>
                        </div>
                        <div class="col-md-4 col-sm-4 text-center" style="height: 300px">
                            <p class="text-blue">
                                <i class="icon-note" style="padding-right: 7px;"></i> 변경요청
                            </p>
                            <h1>0</h1>
                        </div>
                        <div class="col-md-4 col-sm-4 text-center" style="height: 300px">
                            <p class="text-danger">
                                <i class="linea-icon linea-elaborate fa-fw" data-icon="A"></i> 이슈
                            </p>
                            <h1>17</h1>
                        </div>
                    </div>

                </div>
            </div>
        </div><!-- 페이지 좌측 작업현황 End -->
		
		
		<!-- 페이지 우측측 개인정보 변경 Begin -->
        <div class="col-md-8">
            <div class="portlet light bordered min-height-600">
                <div class="portlet-body">

                    <ul class="nav customtab nav-tabs" role="tablist">
                        <li role="presentation" class="nav-item active">
                            <a href="#profile" class="nav-link active" aria-controls="profile" role="tab" data-toggle="tab" aria-expanded="true">
                                <span class="visible-xs"><i class="fa fa-cog"></i></span> <span class="hidden-xs"><b>프로필</b></span>
                            </a>
                        </li>
                        <li role="presentation" class="nav-item">
                            <a href="#changePassword" class="nav-link" aria-controls="changePassword" role="tab" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs"><b>패스워드 변경</b></span>
                            </a>
                        </li>
                        <li role="presentation" class="nav-item">
                            <a href="#changeProfileImage" class="nav-link" aria-controls="changeProfileImage" role="tab" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs"><b>프로필 이미지 변경</b></span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane active" id="profile" aria-expanded="true">

                            <form class="form-horizontal form-material" id="formProfile" action="updateMemberInfo.me" method="post" data-toggle="validator" novalidate="true">
								<br>


                                <div class="form-group">
                                    <label class="col-md-12 required">이름</label>
                                    <div class="col-md-12">
                                        <input id="RES_NAME" name="RES_NAME" value="${loginUser.memberName}" type="text" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" required="" readonly>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>

                                <!-- jquery 같은 게 있을 때 select -->
                                <div class="form-group">
                                    <label class="col-md-12 required">소속부서</label>
                                    <div class="col-md-12">
                                        <input id="" name="RES_OFFICE_PHONE" value="<%-- ${loginUser.deptName} --%>부서" type="text" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" required="" readonly>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12 required">이메일</label>
                                    <div class="col-md-12">
                                        <input id="RES_EMAIL" name="email" value="${loginUser.email}" type="email" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 required">전화번호</label>
                                    <div class="col-md-12">
                                        <input id="RES_OFFICE_PHONE" name="phone" value="${loginUser.phone}" type="text" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" maxlength="11" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>


                                <%-- <div class="form-group">
                                    <label class="col-md-12 required">부서</label>
                                    <div class="col-md-12">
                                        <select class="select2me form-control select2-offscreen" id="DEPT_CODE" name="DEPT_CODE" style="width:250px; float:left;" tabindex="-1" title="">
                                        	<option class="form-control" value="#">선택하세요</option>
												<c:forEach var="a" items="${list}">
													<option class="form-control" value="${a.deptNo}">
														<c:out value="${a.deptName}"/>
													</option>
												</c:forEach>
										</select>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div> --%>
								
								<br>
                                <div class="form-group">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                	<button type="submit" class="profileBtn"><i class="fas fa-check"></i>&nbsp;프로필수정</button>
                                </div>
                            </form>

                        </div>

                        <div class="tab-pane" id="changePassword">

                            <form class="form-horizontal form-material" id="formChangePassword" action="updatePassword.me" method="post" data-toggle="validator" novalidate="true">
                                <div class="form-group">
                                	<br>
                                    <label class="col-md-12 required">패스워드</label>
                                    <div class="col-md-12">
                                        <input id="password" name="memberPwd" type="password" class="form-control" style="background-color:#fff;" placeholder="새로운 패스워드를 입력하세요" data-error="새로운 패스워드를 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12 required">패스워드 재확인</label>
                                    <div class="col-md-12">
                                        <input id="password_confirm" name="memberPwd2" type="password" class="form-control" style="background-color:#fff;" placeholder="패스워드 재확인을 입력하세요" data-error="패스워드 재확인을 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
								<!-- 비밀번호 유효성 검사 -->
								<div class="form-group" style="margin-left: 5px; margin-top: -30px;">
									<div id="correctPassword" class="form-group col-md-12" style="maring-top:-50px; color:green;">패스워드가 일치합니다.</div>
									<div id="incorrectPassword" class="form-group col-md-12" style="maring-top:-50px; color:orangered;">패스워드가 일치하지 않습니다.</div>
									<br>
									<div id="" class="form-group col-md-12" style="maring-top:-50px; color:#676A6D; font-weight: bold">※ 패스워드 분실 시 전산팀으로 연락바랍니다.</div>
								</div>
                                
                                <div class="form-group" style="margin-left: 5px;">
                                    <button type="submit" id="updatePassword" class="updatePassword"><i class="fas fa-check"></i>&nbsp;패스워드 수정</button>
                                </div>
                            </form>
                            
                            <script>
                            	$(function() {
                            		
                            	});
                            
                            </script>
                            

                        </div>

                        <div class="tab-pane" id="changeProfileImage">

                            <form class="form-horizontal form-material" id="formChangePassword" action="insertProfileImage.me" method="post" data-toggle="validator" enctype="multipart/form-data" encoding="multipart/form-data" novalidate="true">
                                <div class="form-group">
                                	<br>
                                    <label class="col-md-12 required">프로필 이미지</label>
                                    <div class="col-md-12">
                                        <div class="k-widget k-upload k-header k-upload-sync k-upload-empty">
	                                        <div class="k-button k-upload-button" aria-label="Select files...">
	                                        	<input id="profileImage" name="profileImage" type="file" data-role="upload" multiple="multiple" autocomplete="off">
	                                        	<span>Select files...</span>
	                                        </div>
                                        </div>
                                        <script>
											/* kendo.syncReady(function(){
												jQuery("#profileImage").kendoUpload({"validation":{"allowedExtensions":[".gif",".jpg",".png",".bmp"]}});
											}); */
										</script>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                    	<button type="submit" class="profileImg"><i class="fas fa-check" onclick=""></i>&nbsp;프로필이미지 수정</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div><!-- 페이지 우측측 개인정보 변경 End -->

    </div>
		
		
	
	</c:if>
	</div>
	
	
	
	<script>
	/* 
	//비밀번호
	$(function () {
        $('#password_confirm').on('blur', function () {
            if ($("#password").val() != $('#password_confirm').val()) {
                /* UIkit.modal.alert("패스워드와 패스워드 재확인 값이 일치하지 않습니다.");
                sweetalert.alert("패스워드와 패스워드 재확인 값이 일치하지 않습니다.");
                $("#password").val("");
                $('#password_confirm').val("");
            }
        });
    });
	
	 */
	
	 
 	// 비밀번호 유효성 검사
	$("#correctPassword").hide();
	$("#incorrectPassword").hide();
	$("#updatePassword").hide();
	
	$("input").keyup(function() {
		
		var password = $("#password").val();
		var passwordConfirm = $("#password_confirm").val();
		
		/* console.log("password : " + password);
		console.log("passwordConfirm : " + passwordConfirm); */
		
		if(password != "" && passwordConfirm != "") {
			
			if(password == passwordConfirm) {
				
				$("#correctPassword").show();
				$("#incorrectPassword").hide();
				$("#updatePassword").show();
			} else {
				
				$("#correctPassword").hide();
				$("#incorrectPassword").show();
			}
		} else {
			$("#incorrectPassword").hide();
		}
		
	});
    
	
	
	//최종 폼전송 시 모든 input 부분 작성되었는 지 유효성 검사진행 !!@@
    
	
	
	
	</script>
	
	
	
	
	
</body>
</html>



















