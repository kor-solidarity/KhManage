<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<head>
<title>test</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<!-- VENDOR CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/assets/vendor/bootstrap/css/bootstrap.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/assets/vendor/font-awesome/css/font-awesome.min.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/assets/vendor/linearicons/style.css"/>">
	<link rel="stylesheet" href="<c:url value="/resources/assets/vendor/chartist/css/chartist-custom.css"/>">
	<!-- MAIN CSS -->
	<link rel="stylesheet" href="<c:url value="/resources/assets/css/main.css"/>">
	<!-- FOR DEMO PURPOSES ONLY. You should remove this in your project -->
	<link rel="stylesheet" href="<c:url value="/resources/assets/css/demo.css"/>">
	<!-- GOOGLE FONTS -->
	<link href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700" rel="stylesheet">
	<!-- ICONS -->
	<link rel="apple-touch-icon" sizes="76x76" href="<c:url value="/resources/assets/img/apple-icon.png"/>">
	<link rel="icon" type="image/png" sizes="96x96" href="<c:url value="/resources/assets/img/favicon.png"/>">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="<c:url value="/resources/assets/vendor/jquery/jquery.min.js"/>"></script>
	<script src=<c:url value="/resources/js/notify.min.js"/>></script>
	<script src=<c:url value="/resources/js/chatsocket.js"/>></script>
	<script src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/vendor/chartist/js/chartist.min.js"/>"></script>
<%--	<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-modal/2.1.0/bootstrap-modal.pack.js" integrity="sha256-RaeejS89s+piuuCGQ6QO7ZRGQyP12ejAj7Rb78YC4GA=" crossorigin="anonymous"></script>--%>
	<script src="<c:url value="/resources/assets/scripts/klorofil-common.js"/>"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	
<style>
.notification-item{
	font-size:12px;
	height: 70px;
	padding-top: 0px;
	padding-left: 5px;
}
.bg-warning{
	background:white;
}
</style>
</head>
<body>
	<c:set var="path" value="${ pageContext.servletContext.contextPath }" scope="application"/>
	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.jsp"> <img
					src="<c:url value="/resources/assets/img/newlogo.png"/>"
					style="width: 30px; height: 35px;"> <img
					src="<c:url value="/resources/assets/img/newlogoText.png"/>"
					style="width: 150px; height: 27px;">
				</a>
			</div>
			<div class="container-fluid" style="background:white;">
				<div class="navbar-btn">
					<button type="button" class="btn-toggle-fullwidth">
						<i class="fas fa-bars" style="color: #1E2B44;"></i>
					</button>
				</div>
				<form class="navbar-form navbar-left">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="검색">
						<span class="input-group-btn"><button type="button"
								style="background: #1E2B44;" class="btn btn-primary">
								<i class="fas fa-search"></i>
							</button></span>
					</div>
				</form>

				<div id="navbar-menu">
					<ul class="nav navbar-nav navbar-right">
						<li class="dropdown"><a href="#"
							class="dropdown-toggle icon-menu" data-toggle="dropdown">
							<i class="fas fa-bell" style="font-size: 25px; color: #1E2B44;"></i>
								<!-- <span class="badge bg-danger" style="background:red;">5</span> -->
								<span id="reportCount" class="badge bg-danger" style="background:red; padding-left:0px; padding-right:0px; left:32px; top:20px; font-size:12px; width:auto; height:18px;"></span>
						</a>
							<ul id="reportArea" class="dropdown-menu notifications" style="height:300px; width:250px; overflow: auto;">
								<li><a href='#' ><span class='dot bg-warning'><button type="button" id="checkBtn" style="border:1px solid lightgray; margin-left:20px; width:150px; background:lightgray; color:white; border-radius: 5px;">전체 확인</button></span></a></li>
							</ul>

							
						<li class="dropdown"><a id="chat" class="dropdown-toggle icon-menu" data-toggle="dropdown">
							<i class="fas fa-comment-dots" style="font-size: 25px; color: #1E2B44;"></i>
								<span id="chatCount" class="badge bg-danger" style="background:red; padding-left:0px; padding-right:0px; left:32px; top:20px; font-size:12px; width:auto; height:18px;"></span>
						</a></li>
							

						<!-- 메일 -->
						<li class="dropdown"><a href="mailMain.ma" class="dropdown-toggle"> <i class="fas fa-envelope"
								style="font-size: 25px; color: #1E2B44;"></i></a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fas fa-user-cog"
								style="font-size: 24px; color: #1E2B44;"></i></a>
							<ul class="dropdown-menu">
								<li><a href="myProfile.me"><i class="lnr lnr-user"></i><span>나의 정보</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>메일함</span></a></li>
								<!-- 접근권한설정 -->
								
								<!-- <li><a href="adminShowMain.me"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li> -->
								<li><a href="logout.me"><i class="lnr lnr-exit"></i> <span>로그아웃</span></a></li>
							</ul></li>

					</ul>
				</div>
			</div>
			
		</nav>
		
		<script>
			$(function(){
				$("#chat").click(function(){
					window.open('showChatPage.ct', 'pop01', 'top=160, left=800, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
				});
			});
			

			/* $(function(){
				        $.notifyDefaults({
				            placement: {
				                from: "bottom",
				                align: "left"
				            },
				            animate:{
				                enter: "animated bounceIn",
				                exit: "animated fadeOutDown"
				            },
				            template:'<div data-notify="container" class="col-xs-11   col-sm-3 p-3 text-center alert alert-{0}" role="alert">' +

				            '<img data-notify="icon" class="img-circle pull-left">' +
				            '<span data-notify="title">{1}</span>' +
				            '<span data-notify="message">{2}</span>' +
				            '</div>'
				        });
				    }); */

			
			$(function(){
				$.ajax({
					url:'selectAllMessageCount.ct',
					type: 'post',
					async: false,
					data:{},
				 success:function(data){
					 $("#chatCount").text(data);
					 if(data == 0){
						 $("#chatCount").hide();
					 }else{
						 $("#chatCount").show();
					 }
				 }
			});
			});
			
			$("#checkBtn").on("click", function(){
				 var memberNo = "${loginUser.memberNo}";
				 
				 $.ajax({
						url:'checkAllReport.re',
						type: 'post',
						async: false,
						data:{memberNo:memberNo},
					 success: function(data){
						 if(data == 1){
							 $("#reportArea").empty();
							 $("#reportArea").append("<li><a href='#' ><span class='dot bg-warning'><button type='button' id='checkBtn' style='border:1px solid lightgray; margin-left:20px;  width:150px; background:lightgray; color:white; border-radius: 5px;'>전체 확인</button></span></a></li>");
							 $("#reportCount").hide();
						 }
					 }
				});			
			});
			
			$(function(){
				 var memberNo = "${loginUser.memberNo}";
				 
				 $.ajax({
						url:'selectIssueList.re',
						type: 'post',
						async: false,
						data:{memberNo:memberNo},
					 success: function(data){
						 
						 
						 $.notify.addStyle('happyblue', {
							  html: "<div><i class='far fa-bell'></i>&nbsp;&nbsp;&nbsp;<span data-notify-text/></div>",
							  classes: {
							    base: {
							      "white-space": "nowrap",
							      "background-color": "#1BA39C",
							      "color":"white",
							      "padding": "5px",
							      "font-size" : "12px",
							      "border-radius":"5px"
							    },
							    superblue: {
							      "color": "white",
							      "background-color": "blue"
							    }
							  }
							});
						 $.notify.defaults( {position:"bottom right"} );
						 var i = 0;
						 for(key in data) {
							
							if(data[key]['createMemberNo'] == memberNo && data[key]['ihStatus'] == "조치중"){
								$("#reportArea").append("<li><a href='issueList.iu' class='notification-item'><span class='dot bg-warning'>『"+ data[key]['projectName']+"』" +"<br>《이슈》&nbsp;"+ data[key]['issueType'] + "<br>" + data[key]['teamWorkerName'] +"님 께서 조치승인 하셨습니다.</span></a></li>");
								$.notify("등록하신 이슈를 " + data[key]['teamWorkerName'] + "님 께서 조치승인 하셨습니다." ,{
									  style: 'happyblue'
									});
								i++;
							}else if(data[key]['ihStatus'] == '확인중' && data[key]['createMemberNo'] != memberNo){
								$.notify("『" + data[key]['projectName']+"』" + "에서 이슈가 등록되었습니다." ,{
									  style: 'happyblue'
									});
								$("#reportArea").append("<li><a href='issueList.iu' class='notification-item'><span class='dot bg-warning'>『"+ data[key]['projectName']+"』" +"<br>《이슈》&nbsp;"+ data[key]['issueType'] + "<br>"+"등록자 : " +data[key]['createMemberName'] + "//조치자 : " + data[key]['teamWorkerName'] +"</span></a></li>");
								i++;
							}
						 }
						 
						 if(i == 0){
							 $("#checkBtn").css("background", "lightgray");
							 $("#reportCount").text(i);
							 $("#reportCount").hide();
						 }else{
							 $("#checkBtn").css("background", "#1E2B44");
							 $("#reportCount").show();
							 $("#reportCount").text(i);
						 }
					 }
				});
			});
			
			  function writeResponse(text){
				  console.log(text);
				  if(text == '이슈'){
					  var memberNo = "${loginUser.memberNo}";
					  console.log(memberNo);
					  
					  $.ajax({
							url:'selectIssueList.re',
							type: 'post',
							data:{memberNo:memberNo},
						 success:function(data){
							 var i = 0;
							 $("#reportArea").empty();
							 $("#reportArea").append("<li><a href='#' ><span class='dot bg-warning'><button type='button' id='checkBtn' style='border:1px solid lightgray; margin-left:20px;  width:150px; background:lightgray; color:white; border-radius: 5px;'>전체 확인</button></span></a></li>");
							 
							 console.log(data);
							 
							 for(key in data) {
								if(data[key]['createMemberNo'] == memberNo && data[key]['ihStatus'] == "조치중"){
									$("#reportArea").append("<li><a href='issueList.iu' class='notification-item'><span class='dot bg-warning'>『"+ data[key]['projectName']+"』" +"<br>《이슈》&nbsp;"+ data[key]['issueType'] + "<br>" + data[key]['teamWorkerName'] +"님 께서 조치승인 하셨습니다.</span></a></li>");
									i++;
								}else if(data[key]['ihStatus'] == '확인중'){
									$("#reportArea").append("<li><a href='issueList.iu' class='notification-item'><span class='dot bg-warning'>『"+ data[key]['projectName']+"』" +"<br>《이슈》&nbsp;"+ data[key]['issueType'] + "<br>"+"등록자 : " +data[key]['createMemberName'] + "//조치자 : " + data[key]['teamWorkerName'] +"</span></a></li>");
									i++;
								}
								
							 }
							 if(i != 0){
								 $("#checkBtn").css("background", "#1E2B44");
								 $("#reportCount").text(i);
							 }else{
								 $("#reportCount").hide();
							 }
						 }
					});
					  
				  }else{
					  console.log("채팅 카운트");
					  $.ajax({ 
							url:'selectAllMessageCount.ct',
							type: 'post',
							async: false,
							data:{},
						 success:function(data){
							 if(data == 0){
								 $("#chatCount").hide();
							 }else{
								 $("#chatCount").show();
								 $("#chatCount").text(data);
							 }
						 }
					});
				  }
		        }
		</script>
</body>

</html>
