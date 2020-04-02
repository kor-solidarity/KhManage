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
								class="lnr lnr-home"></i> <span>HOME</span></a></li>
					
						<li><a href="#subPages" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-chart-bars"></i><span>대시보드</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages" class="collapse ">
								<ul class="nav">
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">종합대시보드</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">상세대시보드</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">개인대시보드</label></a></li>
								</ul>
							</div>
						</li>
						
						<li><a href="#subPages2" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-screen"></i><span>프로젝트</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages2" class="collapse ">
								<ul class="nav">
									<li><a href="projectCenter.pr" class="" style="background:#24415C; height:56px;"><label class="menuName">프로젝트 센터</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">프로젝트 산출물</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">프로젝트 작업 승인</label></a></li>
								</ul>
							</div>
						</li>
						
						<li><a href="#subPages3" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-file-add"></i><span>내 작업</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages3" class="collapse ">
								<ul class="nav">
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">내 작업</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">상세대시보드</label></a></li>
								</ul>
							</div>
						</li>
						
						<li><a href="#subPages4" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-file-empty"></i><span>일반작업</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages4" class="collapse ">
								<ul class="nav">
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">이슈관리</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">변경요청</label></a></li>
								</ul>
							</div>
						</li>
						
						<li><a href="#subPages5" data-toggle="collapse"
							class="collapsed"><i class="lnr lnr-pencil"></i><span>커뮤니티</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
							<div id="subPages5" class="collapse ">
								<ul class="nav">
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">공지사항</label></a></li>
									<li><a href="#" class="" style="background:#24415C; height:56px;"><label class="menuName">정보공유게시판</label></a></li>
								</ul>
							</div>
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