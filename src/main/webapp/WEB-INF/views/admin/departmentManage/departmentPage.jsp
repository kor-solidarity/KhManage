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

.menuArea2 {
	width: 47%;
	background: white;
	height: 300px;
	display: inline-block;
	margin: 0 auto;
	margin-bottom: 350px;
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

ul {
	list-style: none;
}

.titleId {
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
	padding-right: 10px;
}

.radioTitle {
	color: #5E738B;
	font-weight: 600;
	font-size: 13px;
}

.inputMenu {
	border: 1px solid lightgray;
	width: 300px;
	outline:none;
	border-radius: 5px;
}

#buseoInfoTable {
	margin: 0 auto;
	margin-top: 20px;
	width: 80%;
}

.projectBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 600;
	border-radius: 5px;
	margin-left: 50px;
	font-size: 14px;
	margin-top: 10px;
}

.cancleBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	margin-left: 50px;
	font-size: 14px;
	margin-top: 10px;
}

.okBtn {
	width: 130px;
	height: 28px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
}

.searchModal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 10; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
}
.search-modal-content {
	background-color: #fefefe;
	margin: 15% auto; /* 15% from the top and centered */
	padding: 20px;
	border: 1px solid #888;
	width: 70%; /* Could be more or less, depending on screen size */
}

.tree_box {
	width: 400px;
	border: 1px solid #ccd3d9;
	margin: 30px auto;
}

.tree_box .title {
	padding: 5px 0 5px 19px;
	background: #f8f8f9;
	border-bottom: 1px solid #ccd3d9;
}

.tree_box .title strong {
	margin-right: 12px;
}

.tree_menu {
	line-height: 18px;
}

.tree_menu strong {
	font-weight: normal;
}

.tree_menu label input {
	vertical-align: -2px;
}

.tree_menu .depth_1 a {
	vertical-align: bottom;
	text-decoration: none;
}

.tree_menu .depth_2 li a em {
	display: inline-block;
	width: 31px;
	height: 11px;
	background:
		url(http://cfile27.uf.tistory.com/image/2265AB4B569457FD1306CB) 100% 0;
	font-size: 0;
	line-height: 0;
	vertical-align: middle;
}

.tree_menu .depth_2 li a em.on {
	background-position: 0 100%;
}

.tree_menu li.last {
	background: none;
}

.tree_menu li.last {
	background: none;
}

.tree_menu .depth_3 {
	display: none;
	padding-left: 23px;
}

.tree_menu .depth_5 {
	display: none;
	padding-left: 23px;
}

.tree_menu .depth_7 {
	display: none;
	padding-left: 23px;
}

.tree_menu .depth_9 {
	display: none;
	padding-left: 23px;
}

.tree_menu .depth_12 {
	display: none;
	padding-left: 23px;
}

.msie6 .tree_menu .depth_3 li a {
	display: inline-block;
}

.tree_menu li.end {
	background:
		url(http://cfile23.uf.tistory.com/image/2272CF4B5694580418FF9C)
		no-repeat 0 0;
}

.a>li {
	margin-bottom: 5px;
}

.depth>li {
	margin-bottom: 5px;
}

#groupList {
	width: 45%;
	height: 300px;
	border: 1px solid #EEEEEE;
	display: inline-block;
	overflow: auto;
}

#div1 {
	width: 15px;
	height: 300px;
	display: inline-block;
	overflow: hidden;
}
</style>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('부서관리');">
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
							<td class="titleText">부서 리스트</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td align="left">&nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
								<button class="okBtn" id="plusDepart">
									<i class="fas fa-th-large"></i>&nbsp;최상위부서추가
								</button> &nbsp;
								<button class="okBtn" style="width: 120px;">
									<i class="fas fa-align-right"></i>&nbsp;자식부서추가
								</button>&nbsp;&nbsp;
								<button class="okBtn" style="width: 100px;">
									<i class="fas fa-ban"></i>&nbsp;부서삭제
								</button>
							</td>
						</tr>
						<tr style="height: 30px;"></tr>
						<tr>
							<td>
								<div style="width: 80%; height: 500px;">
									<ul id="tree_menu" class="tree_menu">
										<ul class="depth_2">
											<li><a href="#none" id="title"
												style="color: #1E2B44; font-size: 16px;"> <img
													id="folderImg"
													src="<c:url value="/resources/assets/img/folder.png"/>"
													style="width: 25px; height: 20px; margin-bottom: 10px;">
													프로젝트 개발부
											</a>
												<ul class="depth_3 a" id="depth3" style="margin-left: 20px;">
													<li><a href="#none">UI/UX 1팀</a></li>
													<li><a href="#none">SW 개발1팀</a></li>
													<li><a href="#none">DA 1팀</a></li>
													<li><a href="#none">SW아키텍트 1팀</a></li>
													<li><a href="#none">TA 1팀</a></li>
												</ul></li>
										</ul>
									</ul>
								</div>
							</td>
						</tr>
					</table>
				</div>
				<div style="width: 45px; display: inline-flex;"></div>
				<div class="menuArea2">
					<table class="menuTable">
						<tr>
							<td class="titleText">부서정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto;"></div></td>
						</tr>
					</table>
					<table id="buseoInfoTable">
						<tr>
							<td class="titleId">부서명</td>
							<td><input type="text" class="inputMenu"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">상위부서</td>
							<td><input type="text" class="inputMenu"
								style="width: 200px;"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">부서코드</td>
							<td><input type="text" class="inputMenu"
								style="width: 100px;"></td>
						</tr>
						<tr height="40px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto;"></div></td>
						</tr>
						<tr>
							<td>
								<button class="projectBtn">
									<i class="fas fa-check"></i>&nbsp;저장
								</button>
							</td>
							<td>
								<button class="cancleBtn">
									<i class="fas fa-ban"></i>&nbsp;취소
								</button>
							</td>
						</tr>
					</table>

				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal"role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;최상위 부서 추가</h4>
        </div>
        <div class="modal-body">
          <div class="container-fluid">
            <div class="row">
              <table id="buseoInfoTable">
						<tr>
							<td class="titleId">부서명</td>
							<td><input type="text" class="inputMenu"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">부서코드</td>
							<td><input type="text" class="inputMenu"
								style="width: 100px;"></td>
						</tr>
					</table>
            </div>
            <div class="row">
              <div class="col-sm-9">
                <div class="row">
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
          <button type="button" class="btn btn-primary" style="background:#1E2B44; outline:none; border:none;">저장</button>
        </div>
      </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
  </div><!-- /.modal -->
	
	<script>
		$(".a").children().click(function() {
			$(this).children().css("color", "#F59E1C");
		});
	</script>

	<script>
		function tree_menu() {
			$('ul.depth_2 >li > a')
					.click(
							function(e) {
								var temp_el = $(this).next('ul');
								var depth_3 = $('.depth_3');

								// 처음에 모두 슬라이드 업 시켜준다.
								depth_3.slideUp(300);
								// 클릭한 순간 모두 on(-)을 제거한다.// +가 나오도록
								depth_3.parent().find('em').removeClass('on');

								if (temp_el.is(':hidden')) {
									temp_el.slideDown(300);
									$(this).find('em').addClass('on').html(
											'하위폴더 열림');
									$(this).css('color', '#F59E1C').css(
											"font-weight", "600");
									$("#folderImg")
											.attr("src",
													"<c:url value="/resources/assets/img/folderOpen.png"/>");

								} else {
									temp_el.slideUp(300);
									$(this).find('em').removeClass('on').html(
											'하위폴더 닫힘');
									$(this).css('color', '#1E2B44').css(
											"font-weight", "400");
									$("#folderImg")
											.attr("src",
													"<c:url value="/resources/assets/img/folder.png"/>");
								}

								return false;

							});

		}
		if ($('#tree_menu').is(':visible')) {
			tree_menu();
		}
		
		$("#plusDepart").click(function(){
			$('#myModal').modal('show');
		})
	</script>
</body>
</html>