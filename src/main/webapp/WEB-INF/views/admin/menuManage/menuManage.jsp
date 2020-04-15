<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
#accessTr, #useAccessTr{
	width:100%;
	border-bottom: 1px solid #EEEEEE;
}
#accessListTable #accessTr:hover{
	background : #dcdcdc;
	color:black;
	font-weight:600;
	cursor: pointer;
}
#accessTd{
	padding-left: 5px;
}
#useAccessTable #useAccessTr:hover{
	background : #dcdcdc;
	color:black;
	font-weight:600;
	cursor: pointer;
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
								<div style="width: 80%; height: 500px;">
									<ul id="tree_menu" class="tree_menu">
										<c:forEach var="m" items="${list}">
											<c:if test="${ m.menuLevel ==1 }">
											<c:set var="dId" value="${m.menuNo}"/>
												<ul class="depth_2">
													<li><a href="#none" id="title" class="title"
														style="color: #1E2B44; font-size: 16px;"> <img
															id="folderImg"
															src="<c:url value="/resources/assets/img/folder.png"/>"
															style="width: 25px; height: 20px; margin-bottom:10px; margin-right:5px;"><c:out value="${m.menuName}" /></a>
													<input type="hidden" id="highMenuNo" value="${m.menuNo}">		
												</li>
												</ul>
											</c:if>
												<c:if test="${ m.menuLevel==2 and dId eq m.highMenu}">
											<ul class="depth_3 a" id="depth3" style="margin-left: 20px;">
													<li><a class="deptSub" style="margin-left: 27px;"><c:out value="${m.menuName}" /></a>
													<input type="hidden" id="menuNo" value="${m.menuNo}">	
													</li>
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
				 <form id="menuAccessInsertForm" action="insertMenuAccess.am" method="post">
					<table id="buseoInfoTable">
						<tr>
							<td class="titleId">메뉴명</td> 
							<td><input type="text" id="menuName" name="menuName" class="inputMenu"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">메뉴코드</td> 
							<td><input type="text" id="menuCode" name="menuNo" class="inputMenu" readonly="readonly" style="width:130px;"></td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleId">사용여부</td> 
							<td>
								<input type="radio" name="status" value="Y" id="use">&nbsp;&nbsp;<label for="use" style="font-size:14px;">활성화</label>
								<input type="radio" name="status" value="N" id="noUse" style="margin-left:40px;">&nbsp;&nbsp;<label for="noUse" style="font-size:14px;">비활성화</label>
							</td>
						</tr>
						<tr height="30px;"></tr>
						<tr>
							<td class="titleId">메뉴권한 그룹</td> 
							<td>
								<div id="groupList">
									<div align="center" style="width:100%; height:30px; border:1px solid #EEEEEE; border-bottom:3px solid #EEEEEE; padding-top:3px; font-size:14px;">권한그룹리스트</div>
									<table id="accessListTable" align="left" style="width:100%;">
									</table>
								</div>
								<div id="div1">
								<img src="<c:url value="/resources/img/arrow.png"/>" style="width:15px; height:20px; margin:0 atuo; margin-top:140px;">
								
								</div>
								<div id="groupList">
									<div align="center" style="width:100%; height:30px; border:1px solid #EEEEEE; border-bottom:3px solid #EEEEEE; padding-top:3px; font-size:14px;">메뉴사용권한그룹</div>
									<table id="useAccessTable" align="left" style="width:100%;">
									
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
								<button type="button" class="projectBtn"><i class="fas fa-check"></i>&nbsp;저장</button>
							</td>
							<td>
								 <button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button>
							</td>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<script>
			$(".projectBtn").on("click", function(){
				swal({
					  title: "해당 내용을 저장하시겠습니까?",
					  icon: "warning",
					  buttons: ["취소", "저장"],
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal({
					    	title: "저장 완료!",
					      	icon: "success"
					    }).then((value) => {	// 애니메이션 V 나오는 부분!
					    	$("#menuAccessInsertForm").submit();
					    });
					  } else {
						  swal({
						  	title: "취소 하셨습니다.",
						    icon: "error"
						  });
					  }
				});
			});
			
			var accessNoList;
	        //권한 그룹 리스트에서 사용 리스트로 넘기기
			$(document).on('click', '.accessTr', function(){
				var access = $(this).html();
				var no = $(this).find("#hiddenAccessNo").val();
				
				$(this).remove();
				$("#useAccessTable").append("<tr id='useAccessTr' class='useAccessTr'>"+ access +"</tr>");
				$("#useAccessTable").append("<tr id='hiNo' class='hiNo' style='display:none'><td><input type='hidden' class='accessGroup' name='accessGroupNo' value='"+no+"'></td></tr>");
			});
			//사용 권한 리스트에서 권한 그룹 리스트로 넘기기
			$(document).on('click', '.useAccessTr', function(){
				var access = $(this).html();
				var no = $(this).find("#hiddenAccessNo").val();
				$("#useAccessTable").find(".hiNo").filter(function(){
					console.log($(this).find('.accessGroup').val());
					if($(this).find('.accessGroup').val() == no){
						$(this).remove();
					}
				});
				
				$(this).remove();
				$("#accessListTable").append("<tr id='accessTr' class='accessTr'>"+ access +"</tr>");
			});
	
	
			$(".a").children().click(function(){
				$(this).children().css("color", "#F59E1C");
			});
			//하위 메뉴 클릭 시 색상 변경 및 서블릿 을 호출하여 권한 정보와 메뉴 정보 갖고오기
			$(".menuTable").find(".deptSub").on('click', function() {
				var menuNo = $(this).next().val();
				
				$(".menuTable").find(".deptSub").css("color", "#3287B2");
				$(this).css("color", "orange");
				
				 $.ajax({
						url:'selectOneMenu.am',
						type: 'post',
						data:{menuNo:menuNo},
				  	 success:function(data){
							if(data){
								$("#menuName").val(data['me']['menuName']);
								$("#menuCode").val(data['me']['menuNo']);
								if(data['me']['status'] == 'Y'){
									$("#use").prop("checked", true);
								}else{
									$("#noUse").prop("checked", true);
								}
								$("#accessListTable").empty();
								$("#useAccessTable").empty();
								for(var i = 0; i<data['aList'].length; i++ ){
								 $("#accessListTable").append("<tr id='accessTr' class='accessTr'><td id='accessTd'>"+data['aList'][i]['accessName']+"<input type='hidden' id='hiddenAccessNo' name='accessNo' value='"+data['aList'][i]['accessGroupNo'] +"'></td></tr>")
								}
								
								for(var i = 0; i<data['useList'].length; i++ ){
									 $("#useAccessTable").append("<tr id='accessTr' class='accessTr'><td id='accessTd'>"+data['useList'][i]['accessName']+"<input type='hidden' id='hiddenAccessNo' name='accessNo' value='"+data['useList'][i]['accessGroupNo'] +"'></td></tr>")
								}
								for(var i = 0; i<data['useList'].length; i++ ){
									$("#useAccessTable").append("<tr id='hiNo' class='hiNo' style='display:none'><td><input type='hidden' class='accessGroup' name='accessGroupNo' value='"+data['useList'][i]['accessGroupNo'] +"'></td></tr>");
								}
					    }
				  	 }
					}); 
			});
	</script>
	<script>
	//트리 구조 생성 
	var open = 1;
		function tree_menu() {
			$(".menuTable").find(".title").on('click', function(e){
								var temp_el = $(this).parent().parent().nextUntil(".depth_2");
								var depth_3 = $(this).parent().parent().nextUntil(".depth_3");
								console.log(temp_el.size());
								console.log(depth_3);
								
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
								   var menuNo = $(this).next().val();
								   $.ajax({
										url:'selectOneMenu.am',
										type: 'post',
										data:{menuNo:menuNo},
								  	 success:function(data){
											if(data){
												$("#menuName").val(data['me']['menuName']);
												$("#menuCode").val(data['me']['menuNo']);
												if(data['me']['status'] == 'Y'){
													$("#use").prop("checked", true);
												}else{
													$("#noUse").prop("checked", true);
												}
											}
									    }
									}); 
									
								} else {
									temp_el.slideUp(300);
									$(this).find('em').removeClass('on').html(
											'하위폴더 닫힘');
									$(this).css('color', '#1E2B44').css(
											"font-weight", "400");
									$(this).find("#folderImg")
											.attr("src",
													"<c:url value="/resources/assets/img/folder.png"/>");
									$("#menuName").val("");
									$("#menuCode").val("");
									$("#accessListTable").empty();
									$("#useAccessTable").empty();
									$("#use").prop("checked", false);
									$("#noUse").prop("checked", false);
								}
								
								if(temp_el.size() == 0 && open ==1){
									$(this).find('em').addClass('on').html('하위폴더 열림');
									$(this).css('color', '#F59E1C').css("font-weight", "600");
									$(this).find("#folderImg").attr("src","<c:url value="/resources/assets/img/folderOpen.png"/>");
									open = 0;
									  var menuNo = $(this).next().val();
									   $.ajax({
											url:'selectOneMenu.am',
											type: 'post',
											data:{menuNo:menuNo},
									  	 success:function(data){
												if(data){
													$("#menuName").val(data['me']['menuName']);
													$("#menuCode").val(data['me']['menuNo']);
													if(data['me']['status'] == 'Y'){
														$("#use").prop("checked", true);
													}else{
														$("#noUse").prop("checked", true);
													}
												}
										    }
										}); 
								}else if(open == 0){
									$(this).css('color', '#1E2B44').css("font-weight", "400");
									open = 1;
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