<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">

<head>
<head>
<title>Dashboard | Klorofil - Free Bootstrap Dashboard Template</title>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=0">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
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
	<script src="https://use.fontawesome.com/releases/v5.2.0/js/all.js"></script>
	<script src="<c:url value="/resources/assets/vendor/jquery/jquery.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/vendor/bootstrap/js/bootstrap.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/vendor/jquery-slimscroll/jquery.slimscroll.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/vendor/chartist/js/chartist.min.js"/>"></script>
	<script src="<c:url value="/resources/assets/scripts/klorofil-common.js"/>"></script>
	
<style>
</style>
</head>
<body>
	<c:set var="path" value="${ pagecontext.servletcontext.contextpath }"/> 
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
								<span class="badge bg-danger" style="background:red;">5</span>
						</a>
							<ul class="dropdown-menu notifications">
								<li><a href="#" class="notification-item"><span
										class="dot bg-warning"></span>System space is almost full</a></li>
								<li><a href="#" class="notification-item"><span
										class="dot bg-danger"></span>You have 9 unfinished tasks</a></li>
								<li><a href="#" class="notification-item"><span
										class="dot bg-success"></span>Monthly report is available</a></li>
								<li><a href="#" class="notification-item"><span
										class="dot bg-warning"></span>Weekly meeting in 1 hour</a></li>
								<li><a href="#" class="notification-item"><span
										class="dot bg-success"></span>Your request has been approved</a></li>
								<li><a href="#" class="more">See all notifications</a></li>
							</ul></li>

						<!-- 채팅 -->
						<li class="dropdown"><a id="chat" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fas fa-comment-dots" style="font-size: 25px; color: #1E2B44;"></i>
							</a></li>
						
						<!-- 메일 -->
						<li class="dropdown"><a href="mailMain.ma" class="dropdown-toggle"> <i class="fas fa-envelope"
								style="font-size: 25px; color: #1E2B44;"></i></a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fas fa-user-cog"
								style="font-size: 24px; color: #1E2B44;"></i></a>
							<ul class="dropdown-menu">
								<li><a href="myProfile.me"><i class="lnr lnr-user"></i><span>My Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="adminShowMain.me"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="logout.me"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul></li>

					</ul>
				</div>
			</div>
		</nav>
		<script>
			$(function(){
				$("#chat").click(function(){
					window.open('showChatPage.ct', 'pop01', 'top=190, left=900, width=500, height=600, status=no, menubar=no, toolbar=no, resizable=no');
				});
			});
		</script>
</body>

</html>
