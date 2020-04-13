<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	outline: none;
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
								<button class="okBtn" id="plustChildernDepart" style="width: 120px;">
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
										<c:forEach var="d" items="${list}">
											<c:if test="${ d.deptLevle ==1 }">
											<c:set var="dId" value="${d.deptNo}"/>
												<ul class="depth_2">
													<li><a href="#none" id="title" class="title"
														style="color: #1E2B44; font-size: 16px;"> <img
															id="folderImg"
															src="<c:url value="/resources/assets/img/folder.png"/>"
															style="width: 25px; height: 20px; margin-bottom: 10px;"><c:out value="${d.deptName}" /></a>
															
												</li>
												</ul>
											</c:if>
												<c:if test="${ d.deptLevle==2 and dId eq d.highDept}">
											<ul class="depth_3 a" id="depth3" style="margin-left: 20px;">
													<li><a class="deptSub"><c:out value="${d.deptName}" /></a></li>
											</ul>
												</c:if>
										</c:forEach>
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
							<td><input type="text" id="deptName" class="inputMenu"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">상위부서</td>
							<td><input type="text" id="highName" class="inputMenu"
								style="width: 200px;"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">부서코드</td>
							<td><input type="text" id="deptCode" class="inputMenu"
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

	<div class="modal fade" id="myModal" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<i class="fas fa-th-large"></i>&nbsp;최상위 부서 추가
					</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
						  <form id="highDeptForm" action="insertHighDept.am" method="post">
							<table id="buseoInfoTable">
								<tr>
									<td class="titleId">부서명</td>
									<td><input type="text" id="insertDeptName" name="deptName" class="inputMenu"></td>
								</tr>
								<tr height="10px;"></tr>
								<tr>
									<td class="titleId">부서코드</td>
									<td><input type="text" id="highCode" name="deptNo" class="inputMenu" placeholder="ex) A "
										style="width: 100px;"></td>
								</tr>
							</table>
							</form>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<div class="row"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="insertHighDept"
						style="background: #1E2B44; outline: none; border: none;">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->
	
	<div class="modal fade" id="myModal2" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<i class="fas fa-th-large"></i>&nbsp;자식 부서 추가
					</h4>
				</div>
				<div class="modal-body">
					<div class="container-fluid">
						<div class="row">
						  <form id="childrenDeptInsert" action="childrenDeptInsert.am" method="post">
							<table id="buseoInfoTable">
								<tr>
									<td class="titleId">최상위 부서</td>
									<td>
									<select id="deptSelect" name="highDept">
										<option>==선택==</option>
										<c:forEach var="d" items="${list}">
											<c:if test="${d.deptLevle eq 1}">
											<option value="${d.deptNo}">${d.deptName}</option>
											</c:if>
										</c:forEach>
								</select></td>
								</tr>
								<tr height="10px;"></tr>
								<tr>
									<td class="titleId">부서명</td>
									<td><input type="text" id="insertDeptName" name="deptName" class="inputMenu"></td>
								</tr>
								<tr height="10px;"></tr>
								<tr>
									<td class="titleId">부서코드</td>
									<td><input type="text" id="highCode2" name="deptNo" class="inputMenu" readonly 
										style="width: 100px;"></td>
								</tr>
							</table>
							</form>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<div class="row"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" id="insertChildrenDept"
						style="background: #1E2B44; outline: none; border: none;">저장</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	<!-- /.modal -->

	<script>
		$(".menuTable").find(".deptSub").on('click', function() {
			$(".menuTable").find(".deptSub").css("color", "#3287B2");
			$(this).css("color", "orange");
		});
		
		$("#plustChildernDepart").click(function(){
			$('#myModal2').modal('show');
		});
		
		$("#insertChildrenDept").click(function(){
			$("#childrenDeptInsert").submit();
		});
		
		$("#insertHighDept").click(function(){
			var a = $("#highCode").val();
			$("#highCode").val(a +"01");
			$("#highDeptForm").submit();
		});
		
		$("#deptSelect").on("change", function(){
			var name = $(this).val();
			console.log(name);
			$.ajax({
				url:'newDeptNo.am',
				type: 'post',
				data:{deptNo:name},
			 success:function(data){
				 if(data){
				     var a = data['deptNo']
				     var b = Number(a.substr(a.length-2))+Number(1);
				     if(b>=10){
				     	var c = a.replace(a.substr(a.length-2), b);
				     }else{
				        var c = a.replace(a.substr(a.length-2), "0" + b);
				     }
				     $("#highCode2").val(c);
				     
				 }else{
					 $.ajax({
						url:'highDeptSelectOne.am',
						type: 'post',
						data:{deptNo:name},
					 success:function(data){
							  var a = data['deptNo']
							  var c = a.replace(a.substr(a.length-2), "02");
							  
							  $("#highCode2").val(c);
							}
					}); 
				 }
			 }
			}); 
		});
	</script>

	<script>
		/* $(".menuTable").find(".title").on('click', function(e){
			console.log('sss');
		}); */
	
		function tree_menu() {
			$(".menuTable").find(".title").on('click', function(e){
								var temp_el = $(this).parent().parent().nextUntil(".depth_2");
								var depth_3 = $(this).parent().parent().nextUntil(".depth_2");
								
								
								depth_3.slideUp(300);
								depth_3.parent().find('em').removeClass('on');
								
								if (temp_el.is(':hidden')) {
									temp_el.slideDown(300);
									$(this).find('em').addClass('on').html(
											'하위폴더 열림');
									$(this).css('color', '#F59E1C').css(
											"font-weight", "600");
									$(this).find("#folderImg")
											.attr("src",
													"<c:url value="/resources/assets/img/folderOpen.png"/>");
									
									
								} else {
									temp_el.slideUp(300);
									$(this).find('em').removeClass('on').html(
											'하위폴더 닫힘');
									$(this).css('color', '#1E2B44').css(
											"font-weight", "400");
									$(this).find("#folderImg")
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
	<script>
		$(function(){
			$(".menuTable").find(".deptSub").on('click', function(){
				var name =  $.trim($(this).text());
				 $.ajax({
					url:'deptSelectOne.am',
					type: 'post',
					data:{deptName:name},
					
				 success:function(data){
						if(data){
							$("#deptName").empty();
							$("#highName").empty();
							$("#deptCode").empty();
							$("#deptName").val(data['deptName']);
							$("#highName").val(data['highDept']);
							$("#deptCode").val(data['deptNo']);
						}
				 }
				}); 
			});
			
			
			$(".menuTable").find(".title").click(function(){
				var name = $.trim($(this).text());
				 $.ajax({
					url:'highDeptSelectOne.am',
					type: 'post',
					data:{deptName:name},
				 success:function(data){
							$("#deptName").empty();
							$("#highName").empty();
							$("#deptCode").empty();
							$("#deptName").val(data['deptName']);
							$("#highName").val(data['highDept']);
							$("#deptCode").val(data['deptNo']);
						}
				}); 
			});
			});
	</script>
</body>
</html>