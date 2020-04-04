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
	display: inline-block;
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
.titleId{
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
	padding-right:10px;
}
.radioTitle{
	color: #5E738B;
	font-weight: 600;
	font-size: 13px;
}
.inputMenu{
	border:1px solid #EBCCD1;
	width:300px;
	border-radius: 5px;
}
#buseoInfoTable{
	margin:0 auto;
	margin-top:20px;
	width:80%;
}
.projectBtn{
		width:70px;
		height:30px;
		border:none;
		background:#1E2B44;
		color:white;
		font-weight:600;
		border-radius: 5px;
		margin-left:50px;
		font-size:14px;
		margin-top:10px;
	}
.cancleBtn{
		width:70px;
		height:30px;
		border:none;
		background:#E5E5E5;
		color:white;
		font-weight:600;
		border-radius: 5px;
		margin-left:50px;
		font-size:14px;
		margin-top:10px;
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
.tree_menu .depth_7 {display:none;padding-left:23px;}
.tree_menu .depth_9 {display:none;padding-left:23px;}
.tree_menu .depth_12 {display:none;padding-left:23px;}
.msie6 .tree_menu .depth_3 li a {display:inline-block;}
.tree_menu li.end {background:url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C) no-repeat 0 0;}

.a>li{
	margin-bottom:5px;
}
.depth>li{
	margin-bottom:5px;
}
#groupList{
	width:45%;
	height:300px;
	border:1px solid #EEEEEE;
	display:inline-block;
	overflow:auto; 
}
#div1{
	width:15px;
	height:300px;
	display:inline-block;
	overflow:hidden; 
}
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
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom:10px;"></div></td>
						</tr>
						<tr style="height: 10px;"></tr>
						<tr>
							<td>
								<div
									style="width: 80%; height: 500px;">
											<ul id="tree_menu" class="tree_menu">
													<ul class="depth_2">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:10px; mar">
														대시보드</a>
															<ul class="depth_3 a" id="depth3"style="margin-left:20px;">
																<li><a href="#none">종합 대시보드</a></li>
																
																<li><a href="#none">상세 대시보드</a></li>
																<li><a href="#none">개인 대시보드</a></li>
															</ul></li>
													</ul>
													<ul class="depth_4">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg2"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:10px;">
														프로젝트</a>
															<ul class="depth_5 a" id="depth_5" style="margin-left:20px;">
																<li><a href="#none">프로젝트 센터</a></li>
																<li><a href="#none">프로젝트 산출물</a></li>
																<li><a href="#none">프로젝트 작업승인</a></li>
															</ul></li>
													</ul>
													
													<ul class="depth_6">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg3"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:10px;">
														내작업</a>
															<ul class="depth_7 a" id="depth_5" style="margin-left:20px;">
																<li><a href="#none">나의작업</a></li>
																<li><a href="#none">프로젝트 산출물</a></li>
															</ul></li>
													</ul>
													
													<ul class="depth_8">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg4"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:10px;">
														일반업무</a>
															<ul class="depth_9 a" id="depth_5" style="margin-left:20px;">
																<li><a href="#none">이슈관리</a></li>
																<li><a href="#none">변경요청</a></li>
															</ul></li>
													</ul>
													
													<ul class="depth_10">
														<li><a href="#none" id="title" style="color:#1E2B44; font-size:16px;"> 
														<img id="folderImg5"src="<c:url value="/resources/assets/img/folder.png"/>" style="width:25px; height:20px; margin-bottom:10px;">
														포럼</a>
															<ul class="depth_12 a" id="depth_5" style="margin-left:20px;">
																<li><a href="#none">공지사항</a></li>
																<li><a href="#none">정보공유게시판</a></li>
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
					<table id="buseoInfoTable">
						<tr>
							<td class="titleId">메뉴명</td> 
							<td><input type="text" class="inputMenu"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">사용여부</td> 
							<td><input type="radio" id="use" style="margin-left:20px;"><label for="use" style="font-size:14px;">사용</label>
								<input type="radio" id="noUse" style="margin-left:40px;"><label for="noUse" style="font-size:14px;">사용안함</label>
							</td>
						</tr>
						<tr height="40px;"></tr>
						<tr>
							<td class="titleId">메뉴권한 그룹</td> 
							<td>
								<div id="groupList">
									<div align="center" style="width:100%; height:30px; border:1px solid #EEEEEE; border-bottom:3px solid #EEEEEE; padding-top:3px; font-size:14px;">권한그룹리스트</div>
									<table>
										<tr>
											<td>ss</td>
										</tr>
									</table>
								</div>
								<div id="div1">
								<img src="<c:url value="/resources/img/arrow.png"/>" style="width:15px; height:20px; margin:0 atuo; margin-top:140px;">
								
								</div>
								<div id="groupList">
									<div align="center" style="width:100%; height:30px; border:1px solid #EEEEEE; border-bottom:3px solid #EEEEEE; padding-top:3px; font-size:14px;">메뉴사용권한그룹</div>
									<table>
										<tr>
											<td>PL담당그룹</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
						<tr height="40px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto;"></div></td>
						</tr>
						<tr>
							<td>
								<button class="projectBtn"><i class="fas fa-check"></i>&nbsp;저장</button>
							</td>
							<td>
								 <button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script>
			$(".a").children().click(function(){
				$(this).children().css("color", "#F59E1C");
			});
	</script>
	
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
		      
				      $('ul.depth_6 >li > a').click(function(e) {
						    var temp_el = $(this).next('ul');
						    var depth_3 = $('#depth_7');

						    // 처음에 모두 슬라이드 업 시켜준다.
						    depth_3.slideUp(300);
						    // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
						    depth_3.parent().find('em').removeClass('on');

						    if (temp_el.is(':hidden')) {
						      temp_el.slideDown(300);
						      $(this).find('em').addClass('on').html('하위폴더 열림');
						      $(this).css('color', '#F59E1C').css("font-weight", "600");
						      $("#folderImg3").attr("src", "<c:url value="/resources/assets/img/folderOpen.png"/>");
						    } else {
						      temp_el.slideUp(300);
						      $(this).find('em').removeClass('on').html('하위폴더 닫힘');
						      $(this).css('color', '#1E2B44').css("font-weight", "400");
						      $("#folderImg3").attr("src", "<c:url value="/resources/assets/img/folder.png"/>");
						    }

						    return false;

						  });
				      
						      $('ul.depth_8 >li > a').click(function(e) {
								    var temp_el = $(this).next('ul');
								    var depth_3 = $('#depth_9');

								    // 처음에 모두 슬라이드 업 시켜준다.
								    depth_3.slideUp(300);
								    // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
								    depth_3.parent().find('em').removeClass('on');

								    if (temp_el.is(':hidden')) {
								      temp_el.slideDown(300);
								      $(this).find('em').addClass('on').html('하위폴더 열림');
								      $(this).css('color', '#F59E1C').css("font-weight", "600");
								      $("#folderImg4").attr("src", "<c:url value="/resources/assets/img/folderOpen.png"/>");
								    } else {
								      temp_el.slideUp(300);
								      $(this).find('em').removeClass('on').html('하위폴더 닫힘');
								      $(this).css('color', '#1E2B44').css("font-weight", "400");
								      $("#folderImg4").attr("src", "<c:url value="/resources/assets/img/folder.png"/>");
								    }

								    return false;

								  });
						      
								      $('ul.depth_10 >li > a').click(function(e) {
										    var temp_el = $(this).next('ul');
										    var depth_3 = $('#depth_12');

										    // 처음에 모두 슬라이드 업 시켜준다.
										    depth_3.slideUp(300);
										    // 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
										    depth_3.parent().find('em').removeClass('on');

										    if (temp_el.is(':hidden')) {
										      temp_el.slideDown(300);
										      $(this).find('em').addClass('on').html('하위폴더 열림');
										      $(this).css('color', '#F59E1C').css("font-weight", "600");
										      $("#folderImg5").attr("src", "<c:url value="/resources/assets/img/folderOpen.png"/>");
										    } else {
										      temp_el.slideUp(300);
										      $(this).find('em').removeClass('on').html('하위폴더 닫힘');
										      $(this).css('color', '#1E2B44').css("font-weight", "400");
										      $("#folderImg5").attr("src", "<c:url value="/resources/assets/img/folder.png"/>");
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