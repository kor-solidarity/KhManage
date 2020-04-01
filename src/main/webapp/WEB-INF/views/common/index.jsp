<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!doctype html>
<html lang="en">
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

	<!-- WRAPPER -->
	<div id="wrapper">
		<!-- NAVBAR -->
		<nav class="navbar navbar-default navbar-fixed-top">
			<div class="brand">
				<a href="index.html"> <img
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


						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fas fa-comment-dots" style="font-size: 25px; color: #1E2B44;"></i>
							</a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"> <i class="fas fa-envelope"
								style="font-size: 25px; color: #1E2B44;"></i></a></li>

						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"><i class="fas fa-user-cog"
								style="font-size: 24px; color: #1E2B44;"></i></a>
							<ul class="dropdown-menu">
								<li><a href="#"><i class="lnr lnr-user"></i> <span>My
											Profile</span></a></li>
								<li><a href="#"><i class="lnr lnr-envelope"></i> <span>Message</span></a></li>
								<li><a href="#"><i class="lnr lnr-cog"></i> <span>Settings</span></a></li>
								<li><a href="#"><i class="lnr lnr-exit"></i> <span>Logout</span></a></li>
							</ul></li>

					</ul>
				</div>
			</div>
		</nav>
		<!-- END NAVBAR -->
		<!-- LEFT SIDEBAR -->
		<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll" style="background: #1E2B44;">
				<nav>
					<ul class="nav">
						<li><a href="index.html" class="active"><i
								class="lnr lnr-home"></i> <span>Dashboard</span></a></li>
						<li><a href="elements.html" class=""><i
								class="lnr lnr-code"></i> <span>Elements</span></a></li>
						<li><a href="charts.html" class=""><i
								class="lnr lnr-chart-bars"></i> <span>Charts</span></a></li>
						<li><a href="panels.html" class=""><i class="lnr lnr-cog"></i>
								<span>Panels</span></a></li>
						<li><a href="notifications.html" class=""><i
								class="lnr lnr-alarm"></i> <span>Notifications</span></a></li>
						<li><a href="#subPages" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-file-empty"></i> <span>Pages</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="page-profile.html" class="">Profile</a></li>
									<li><a href="page-login.html" class="">Login</a></li>
									<li><a href="page-lockscreen.html" class="">Lockscreen</a></li>
								</ul>
							</div></li>
						<li><a href="tables.html" class=""><i
								class="lnr lnr-dice"></i> <span>Tables</span></a></li>
						<li><a href="typography.html" class=""><i
								class="lnr lnr-text-format"></i> <span>Typography</span></a></li>
						<li><a href="icons.html" class=""><i
								class="lnr lnr-linearicons"></i> <span>Icons</span></a></li>
					</ul>
				</nav>
			</div>
		</div>
		<!-- END LEFT SIDEBAR -->
		<!-- MAIN -->
		<div class="main">
			<!-- MAIN CONTENT -->
			<div class="main-content">
				<div class="container-fluid">
					<!-- OVERVIEW -->
					<div class="panel panel-headline">
						<div class="panel-heading">
							<h3 class="panel-title">Weekly Overview</h3>
							<p class="panel-subtitle">Period: Oct 14, 2016 - Oct 21, 2016</p>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-download"></i></span>
										<p>
											<span class="number">1,252</span> <span class="title">Downloads</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-shopping-bag"></i></span>
										<p>
											<span class="number">203</span> <span class="title">Sales</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-eye"></i></span>
										<p>
											<span class="number">274,678</span> <span class="title">Visits</span>
										</p>
									</div>
								</div>
								<div class="col-md-3">
									<div class="metric">
										<span class="icon"><i class="fa fa-bar-chart"></i></span>
										<p>
											<span class="number">35%</span> <span class="title">Conversions</span>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<!-- END MAIN CONTENT -->
			</div>
			<!-- END MAIN -->
			<footer> </footer>
		</div>
</body>

</html>
