<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    
    <script>
        (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
        (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
        m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
        })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');

        ga('create', 'UA-87786286-1', 'auto');
        ga('send', 'pageview');
    </script>


<style>

.col-md-4 {
	background: white;
	width: 25%;
	height: 700px;
	border: 1px solid blue;
}

.col-md-4 col-sm-4 text-center {
	height: 700px;
	border: 1px solid green;
}

.col-md-8 {
	width: 65%;
	background: white;
	height: 700px;
	border: 1px solid red;
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

.passwordBtn {
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



</style>


</head>
<body onload="$('#route1').text('프로필')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<br><br>
	<div id="wrap">
		
		<div class="row fadeInUp animated">

        <div class="col-md-4" style="float: left">
            <div class="portlet light bordered min-height-600">
                <div class="portlet-body">
                    <div class="user-bg">
                        <div class="overlay-box">
                            <div class="user-content">
                                    <a href=" "><img src="" class="thumb-lg" alt="img"></a>

                                <div style="height:40px;"></div>

                                <h4 class="text-white">pmo01</h4>
                                <h5 class="text-white">uandme1206@naver.com</h5>
                            </div>
                        </div>
                    </div>

                    <div class="user-btm-box" style="height: 300px">
                        <div class="col-md-4 col-sm-4 text-center" style="height: 300px">
                            <p class="text-purple">
                                <i class="linea-icon linea-basic fa-fw" data-icon=""></i> 내작업
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
        </div>
		
		<!-- <div style="float: left;">ssssssssdasd</div> -->
		
		
		
        <div class="col-md-8">
            <div class="portlet light bordered min-height-600">
                <div class="portlet-body">

                    <ul class="nav customtab nav-tabs" role="tablist">
                        <li role="presentation" class="nav-item active">
                            <a href="#profile" class="nav-link active" aria-controls="profile" role="tab" data-toggle="tab" aria-expanded="true">
                                <span class="visible-xs"><i class="fa fa-cog"></i></span> <span class="hidden-xs">프로필</span>
                            </a>
                        </li>
                        <li role="presentation" class="nav-item">
                            <a href="#changePassword" class="nav-link" aria-controls="changePassword" role="tab" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs">패스워드 변경</span>
                            </a>
                        </li>
                        <li role="presentation" class="nav-item">
                            <a href="#changeProfileImage" class="nav-link" aria-controls="changeProfileImage" role="tab" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs">프로필 이미지 변경</span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane active" id="profile" aria-expanded="true">

                            <form class="form-horizontal form-material" id="formProfile" action="/Resource/EditUser" method="post" data-toggle="validator" novalidate="true">
								<br>
                                <div class="form-group">
                                    <label class="col-md-12 required">이름</label>
                                    <div class="col-md-12">
                                        <input id="RES_NAME" name="RES_NAME" value="pmo01" type="text" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12 required">이메일</label>
                                    <div class="col-md-12">
                                        <input id="RES_EMAIL" name="RES_EMAIL" value="uandme1206@naver.com" type="text" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 required">전화번호</label>
                                    <div class="col-md-12">
                                        <input id="RES_OFFICE_PHONE" name="RES_OFFICE_PHONE" value="010-2912-8197" type="text" class="form-control form-control-line" placeholder="이름을 입력하세요" data-error="이름을 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12 required">부서</label>
                                    <div class="col-md-12">
                                        <select class="select2me form-control select2-offscreen" id="DEPT_CODE" name="DEPT_CODE" style="width:250px; float:left;" tabindex="-1" title="">
                                        	<option value="">선택하세요</option>
                                        	<option value="">부서1</option>
                                        	<option value="">부서1</option>
                                        	<option value="">부서1</option>
										</select>
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>
								
								<br>
                                <div class="form-group">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                	<button type="submit" class="profileBtn"><i class="fas fa-check"></i>&nbsp;프로필수정</button>
                                </div>
                            </form>

                        </div>

                        <div class="tab-pane" id="changePassword">

                            <form class="form-horizontal form-material" id="formChangePassword" action="/Resource/UpdatePassword" method="post" data-toggle="validator" novalidate="true">
                                <div class="form-group">
                                	<br>
                                    <label class="col-md-12 required">패스워드</label>
                                    <div class="col-md-12">
                                        <input id="password" name="password" type="password" class="form-control" style="background-color:#fff;" placeholder="새로운 패스워드를 입력하세요" data-error="새로운 패스워드를 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <label class="col-md-12 required">패스워드 재확인</label>
                                    <div class="col-md-12">
                                        <input id="password_confirm" name="password_confirm" type="password" class="form-control" style="background-color:#fff;" placeholder="패스워드 재확인을 입력하세요" data-error="패스워드 재확인을 입력하세요" required="">
                                        <span class="help-block with-errors"></span>
                                    </div>
                                </div>

                                <div class="form-group">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <button type="submit" class="passwordBtn"><i class="fas fa-check"></i>&nbsp;패스워드 수정</button>
                                </div>

                            </form>

                        </div>

                        <div class="tab-pane" id="changeProfileImage">

                            <form class="form-horizontal form-material" id="formChangePassword" action="/Resource/UpdateProfileImage" method="post" data-toggle="validator" enctype="multipart/form-data" encoding="multipart/form-data" novalidate="true">
                                <div class="form-group">
                                	<br>
                                    <label class="col-md-12 required">프로필 이미지</label>
                                    <div class="col-md-12">
                                        <div class="k-widget k-upload k-header k-upload-sync k-upload-empty"><div class="k-button k-upload-button" aria-label="Select files..."><input id="profileImage" name="profileImage" type="file" data-role="upload" multiple="multiple" autocomplete="off">
                                        <span>Select files...</span></div></div>
                                        <script>
											kendo.syncReady(function(){
												jQuery("#profileImage").kendoUpload({"validation":{"allowedExtensions":[".gif",".jpg",".png",".bmp"]}});
											});
										</script>
                                    </div>
                                </div>

                                <div class="form-group">
                                    <div class="col-sm-12">
                                    	<button type="submit" class="profileImg"><i class="fas fa-check"></i>&nbsp;프로필이미지 수정</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
		
		
	
	
	</div>
	
	
	
	<script>
	
	//비밀번호
	$(function () {
        $('#password_confirm').on('blur', function () {
            if ($("#password").val() != $('#password_confirm').val()) {
                UIkit.modal.alert("패스워드와 패스워드 재확인 값이 일치하지 않습니다.");
                $("#password").val("");
                $('#password_confirm').val("");
            }
        });
    });
	
	
	
	
	</script>
	
	
	
	
	
</body>
</html>



















