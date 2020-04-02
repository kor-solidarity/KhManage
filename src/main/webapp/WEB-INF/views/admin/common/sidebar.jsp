<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menuName{
		margin-left:30px;
		font-size:14px;
	}
</style>
</head>
<body>
<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll" style="background: #1E2B44;">
				<nav>
					<ul class="nav">
						<li><a href="index.html" class="active"><i
								class="lnr lnr-home"></i> <span>관리자홈</span></a></li>
					
						<li><a href="#subPages" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-cog"></i><span>시스템 기본설정</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
						<li><a href="menuManege.am" 
							class="collapsed"><i class="lnr lnr-sort-amount-asc"></i><span>메뉴관리</span>
						</a>
						</li>
						
						<li><a href="#subPages3" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-hand"></i><span>권한그룹 관리</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
						<li><a href="#subPages4" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-screen"></i><span>프로젝트 현황</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
						<li><a href="#subPages5" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-paperclip"></i><span>템플릿 관리</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
						<li><a href="#subPages5" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-layers"></i><span>부서 관리</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
						<li><a href="#subPages5" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-user"></i><span>사용자 관리</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
						<li><a href="#subPages5" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-bullhorn"></i><span>커뮤니티 관리</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</li>
						
					</ul>
				</nav>
			</div>
		</div>
<div class="main">
	<div class="container-fluid">
	<label id="route1" style="margin-top:5px;"></label> > <label id="route2" style="margin-top:5px;"></label>
</body>
</html>