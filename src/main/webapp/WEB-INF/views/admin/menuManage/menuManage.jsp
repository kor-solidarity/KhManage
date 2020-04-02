<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.menuArea {
	width: 47%;
	background: white;
	height: 650px;
	display: inline-flex;
	margin: 0 auto;
}

.menuTable {
	width: 100%;
}

.titleText {
	padding-top: 13px;
	padding-left: 13px;
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
}
ul{
	list-style:none;
}
.tree_box { width:400px; border:1px solid #ccd3d9;margin: 30px auto;}
.tree_box .title { padding:5px 0 5px 19px ;background:#f8f8f9;border-bottom:1px solid #ccd3d9;}
.tree_box .title strong {margin-right:12px;}
.tree_menu {line-height:18px;}
.tree_menu strong {font-weight:normal;}
.tree_menu label input {vertical-align:-2px;}
.tree_menu .depth_1 a {vertical-align:bottom;text-decoration:none;}
.tree_menu .depth_2 li a em {display:inline-block;width:31px;height:11px;  background:url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;font-size:0;line-height:0;vertical-align:middle;}
.tree_menu .depth_2 li a em.on {background-position:0 100%;}
.tree_menu li.last {background:none;}
.tree_menu li.last {background:none;}
.tree_menu .depth_3 {display:none;padding-left:23px;}
.tree_menu .depth_5 {display:none;padding-left:23px;}
.msie6 .tree_menu .depth_3 li a {display:inline-block;}
.tree_menu li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}

</style>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('메뉴관리');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
	<div class="panel panel-headline"
		style="width: 100%; background: #F5F5FA;">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 700px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
					<table class="menuTable">
						<tr>
							<td class="titleText">메뉴 리스트</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto;"></div></td>
						</tr>
						<tr style="height: 10px;"></tr>
						<tr>
							<td>
								<div
									style="width: 80%; height: 500px;">
											<ul id="tree_menu" class="tree_menu">
													<ul class="depth_2">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:5px;">
														대시보드</a>
															<ul class="depth_3" style="margin-left:20px;">
																<li><a href="#none">종합 대시보드</a></li>
																<li><a href="#none">상세 대시보드</a></li>
																<li><a href="#none">개인 대시보드</a></li>
															</ul></li>
													</ul>
													<ul class="depth_4">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg2"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:5px;">
														프로젝트</a>
															<ul class="depth_5" id="depth_5" style="margin-left:20px;">
																<li><a href="#none">프로젝트 센터</a></li>
																<li><a href="#none">프로젝트 산출물</a></li>
																<li><a href="#none">프로젝트 산출물</a></li>
															</ul></li>
													</ul>
													
													
											</ul>
										</div>

							</td>
						</tr>
					</table>
				</div>
				<div style="width: 45px; display: inline-flex;"></div>
				<div class="menuArea">
					<table class="menuTable">
						<tr>
							<td class="titleText">메뉴정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto;"></div></td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
	
	function tree_menu() {
		  $('ul.depth_2 >li > a').click(function(e) {
		    var temp_el = $(this).next('ul');
		    var depth_3 = $('.depth_3');

		    // 처음에 모두 슬라이드 업 시켜준다.
		    depth_3.slideUp(300);
		    // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
		    depth_3.parent().find('em').removeClass('on');

		    if (temp_el.is(':hidden')) {
		      temp_el.slideDown(300);
		      $(this).find('em').addClass('on').html('하위폴더 열림');
		      $(this).css('color', '#F59E1C').css("font-weight", "600");
		      $("#folderImg").attr("src", "<c:url value="/resources/assets/img/folderOpen.png"/>");
		    } else {
		      temp_el.slideUp(300);
		      $(this).find('em').removeClass('on').html('하위폴더 닫힘');
		      $(this).css('color', '#1E2B44').css("font-weight", "400");
		      $("#folderImg").attr("src", "<c:url value="/resources/assets/img/folder.png"/>");
		    }

		    return false;

		  });
		  
		      $('ul.depth_4 >li > a').click(function(e) {
				    var temp_el = $(this).next('ul');
				    var depth_3 = $('#depth_5');

				    // 처음에 모두 슬라이드 업 시켜준다.
				    depth_3.slideUp(300);
				    // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
				    depth_3.parent().find('em').removeClass('on');

				    if (temp_el.is(':hidden')) {
				      temp_el.slideDown(300);
				      $(this).find('em').addClass('on').html('하위폴더 열림');
				      $(this).css('color', '#F59E1C').css("font-weight", "600");
				      $("#folderImg2").attr("src", "<c:url value="/resources/assets/img/folderOpen.png"/>");
				    } else {
				      temp_el.slideUp(300);
				      $(this).find('em').removeClass('on').html('하위폴더 닫힘');
				      $(this).css('color', '#1E2B44').css("font-weight", "400");
				      $("#folderImg2").attr("src", "<c:url value="/resources/assets/img/folder.png"/>");
				    }

				    return false;

				  });
		}
		if ($('#tree_menu').is(':visible')) {
		  tree_menu();
		}
	</script>
</body>
</html>