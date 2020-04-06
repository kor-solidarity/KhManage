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
	.side_div1{
		width: 180px;
		height: 50px;
		border: 2px solid white;
		border-radius: 10px; 	
		margin: 0 auto;
		margin-top: 35px;
		background: #49557B;
	}
</style>
</head>
<body>
<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll" style="background: #1E2B44;">
				<nav>
					<div class="side_div1">
						<a href="mailSend.ma">
						<p style="text-align: center; margin-top: 10px; font-size: 16px; color: white; font-weight: bold;">편지쓰기</p>
						</a>
					</div>
					<ul class="nav" style="margin-top: 20px;">
						<li><a href="mailReceived.ma"  class="collapsed">
							<i class="lnr lnr-envelope"></i>
							<span>받은 메일함</span></a>
							<div id="subPages" class="collapse ">
							</div>
						</li>
						
						<li><a href="mailSent.ma" 
							class="collapsed"><i class="lnr lnr-envelope"></i>
							<span>보낸 메일함</span>
								</a>
							<div id="subPages2" class="collapse ">
							</div>
						</li>
						
						<li><a href="mailStorage.ma"
							class="collapsed"><i class="lnr lnr-briefcase"></i>
							<span>임시 보관함</span>
								</a>
							<div id="subPages3" class="collapse ">
							</div>
						</li>
						
						<li><a href="mailNread.ma"
							class="collapsed"><i class="lnr lnr-file-empty"></i>
							<span>안읽은 메일함</span>
								</a>
							<div id="subPages4" class="collapse ">
							</div>
						</li>
						
						<li><a href="mailImportant.ma" 
							class="collapsed"><i class="lnr lnr-star"></i>
							<span>중요 메일함</span>
							</a>
							<div id="subPages5" class="collapse ">
							</div>
						</li>
						
						<li><a href="mailSpam.ma"
							class="collapsed"><i class="lnr lnr-warning"></i>
							<span>스팸 메일함</span>
								</a>
							<div id="subPages5" class="collapse ">
							</div>
						</li>
						
						<li><a href="mailTrash.ma" 
							class="collapsed"><i class="lnr lnr-trash"></i>
							<span>휴지통</span>
								</a>
							<div id="subPages5" class="collapse ">
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