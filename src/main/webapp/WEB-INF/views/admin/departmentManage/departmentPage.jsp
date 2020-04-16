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
#projectTable {
	width: 100%;
	text-align: left;
}

.tdText {
	text-align: center;
	height: 30px;
	font-size: 14px;
}

.thRange {
	background: #F3F3F3;
	color: #626262;
	font-size: 15px;
	border: #B0B0B0 1px solid;
	height: 35px;
	padding: 3px;
}
.thRange1 {
	background: #F3F3F3;
	color: #626262;
	font-size: 15px;
	border: #B0B0B0 1px solid;
	height: 35px;
	padding: 3px;
}



.th1 {
	width: 30px;
	text-indent: 5px;
}

.td1 {
	text-indent: 5px;
	color: #71A8D7;
}

.trRange {
	border: 1px solid #B0B0B0;
	width: 30px;
}

.trRange1 {
	border: 1px solid #B0B0B0;
	width: 30px;
}

.inputCss {
	border-radius: 5px;
	border: none;
}

.buseoSelect {
	width: 180px;
	border: 1px solid #626262;
	height: 25px;
	border-radius: 5px;
}

.pagingArea {
	background: #F3F3F3;
	height: 50px;
	border: 1px solid #B0B0B0;
}

.paging {
	margin-left: 200px;
	width: 50%;
}
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('부서관리');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
	<div class="panel panel-headline"
		style="width: 100%; background: #F5F5FA;">
		<div class="panel-heading">
			<div style="width: 100%; height: 700px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px; overflow: auto;">
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
								<button type="button" class="okBtn" style="width: 100px; background:#F3565D;" onclick="sweetTest();">
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
															style="width: 25px; height: 20px; margin-bottom:10px; margin-right:5px;"><c:out value="${d.deptName}" /></a>
															
												</li>
												</ul>
											</c:if>
												<c:if test="${ d.deptLevle==2 and dId eq d.highDept}">
											<ul class="depth_3 a" id="depth3" style="margin-left: 20px;">
													<li><a class="deptSub" style="margin-left: 27px;"><c:out value="${d.deptName}" /></a></li>
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
							<td><input type="text" id="highName" class="inputMenu" readonly="readonly"
								style="width: 200px;"></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId">부서코드</td>
							<td><input type="text" id="deptCode" class="inputMenu" readonly="readonly"
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
					<table class="menuTable" style="margin-top:70px;">
						<tr>
							<td class="titleText" style="padding-left:15px;">부서인원</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td><div style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto;"></div></td>
						</tr>
					</table>
					<div style="overflow: auto; height: 300px;">
						<table id="projectTable" align="center" style="width:90%; height:30px; margin-top: 20px;">
						<tr id="frontMember">
							<td class="tdText thRange" style="width: 90px">이름</td>
							<td class="tdText thRange" style="width: 120px">부서</td>
							<td class="tdText thRange" style="width: 90px;">직급</td>
							<td class="tdText thRange" style="width: 140px;">이메일</td>
						</tr>
					</table>
					</div>
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
									<select id="deptSelect" name="highDept" class="inputMenu">
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
	
	<!-- 모달_사용자정보수정 begin -->
		<div class="modal fade" id="myModal4" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;부서 이동</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		            <form action="insertDeptHistory.am" id="insertForm" method="post">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">이름</td>
							<td><input type="text" id="memberName" class="inputMenu form-control" style="width: 280px;" readonly="readonly" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">직급</td>
							<td>
								<select id="rank" class="register form-control"  name="rankNo">
									<option id="rank" class="form-control" value="0">선택하세요</option>
									<c:forEach var="r" items="${rlist}">
										<option class="form-control" value="${r.rankNo}">
											<c:out value="${r.rankName}"/>
										</option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">이메일</td>
							<td><input type="text" id="memberEmail" class="inputMenu form-control" style="width: 280px;" readonly="readonly" required="required"></td>
						</tr>
						<tr >
							<td class="titleId">소속 부서</td>
							<td>
							 <select id="deptNo" class="register form-control" name="deptNo">
									<option id="deptSelect" class="form-control" value="0">선택하세요</option>
									<c:forEach var="a" items="${list}">
									<c:if test="${a.deptLevle eq 1}">
										<option class="form-control" value="${a.deptNo}">${a.deptName}</option>
									</c:if>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr >
							<td class="titleId">소속 팀</td>
							<td>
								<select id="deptTeam" class="register form-control" name="deptNo">
								</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">이동 사유</td>
							<td>
								<textarea id="deptReason" name="cContent" class="inputMenu form-control" style="width:280px; height:60px;"></textarea>
								<input type="hidden" id="originDept" name="originDept">
								<input type="hidden" id="changeMember" name="changeMember">
								<input type="hidden" id="changeDept" name="changeDept">
							</td>
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
		          <button type="button" id="insertDeptHistoryBtn" class="btn btn-primary" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	

	<script>
	//부서간 부서원 이동 시 변경이 없을 경우 막아주고 없을 경우만 호출
		$("#insertDeptHistoryBtn").on('click', function(){
			var highDeptNo = $("#deptNo").val()
			var deptNo = $("#deptTeam").val()
			
			$("#changeMember").val(memberNo);
			$("#originDept").val(memberNo);
			
			if(deptNo == null){
				$("#changeMember").val(memberNo);
				$("#originDept").val(highDeptName);
				$("#changeDept").val(highDeptNo);
			}else{
				$("#changeMember").val(memberNo);
				$("#originDept").val(deptName);
				$("#changeDept").val(deptNo);
			}
		
			if(deptNo == deptName ||highDeptNo == highDeptName && deptNo==null){
				swal({
	                 title: "변경 내용이 없습니다",
	                 text: "부서 이동 후 요청해주세요",
	                icon: "error"
	              });
			}else if($("#deptReason").val() == ""){
				swal({
	                 title: "변경 사유를 입력해주세요",
	                 text: "",
	                icon: "error"
	              });
			}else{
				swal({
					  title: "부서이동을 진행하시겠습니까?",
					  icon: "warning",
					  buttons: ["취소", "저장"],
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal({
					    	title: "이동 완료!",
					      	icon: "success"
					    }).then((value) => {	
							$("#insertForm").submit();					    	
					    })
					  }
					   });
			 }
		});
	
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
		
		//상위 부서 생성시 뒤에 01 을 붙여서 생성
		$("#insertHighDept").click(function(){
			var a = $("#highCode").val();
			$("#highCode").val(a +"01");
			$("#highDeptForm").submit();
		});
		
		//다른 스크립트에서 알기 위해서 전역 변수 선언
		var deptName;
		var highDeptName;
		var memberNo;
		var rankNo;
		
		//ajax 사용 후 이벤트 연결이 끊겨서 해당 방법으로 이벤트 생성
		$(document).on('click', '.trRange1', function(){
			$('#myModal4').modal('show');
			//사원 클릭 시 디테일 모달에서 해당 내용을 출력 
			var name = $(this).find(".tdText").eq(0).text();
			var rank = $(this).find(".tdText").eq(2).text();
			var email = $(this).find(".tdText").eq(3).text();
			var dept = $(this).find(".tdText").eq(1).text();
			var highDept = $(this).find(".hiddenText").val();
			rankNo = $(this).find(".rankName").val();
			memberNo = $(this).find(".hiddenMember").val();
			deptName = $(this).find(".hiddenDept").val();
			highDeptName = highDept;
			
			
			$("#memberName").val(name);
			$("#memberRank").val(rank);
			$("#memberEmail").val(email);
			
			// 부서 / 직급 을 동일하게 option에서 selected해줌	
			$('#deptNo option').filter(function(){
				if($(this).val() == highDept && deptNo !=null){
					console.log("출력값 : " + $(this).val());
					console.log(deptName);
					$(this).prop('selected', 'selected').change();
				}else if($(this).val() == deptName){
					console.log("출력값 : " + $(this).val());
					$(this).prop('selected', 'selected').change();
				}
			});
			
			$("#rank option").filter(function(){
				if($(this).val() == rankNo){
					$(this).prop('selected', 'selected').change();	
				}
			});
			
			
		});
	
		// 팀 리스트를 조회 하여 같은 것이 있는경우 selected해줌
		$(function(){
			$("#deptNo").on('change', function(){
				var name = $(this).val();
				 $.ajax({
					url:'selectTeam.me',
					type: 'post',
					data: {deptNo:name},
				 	success:function(data){
						$("#deptTeam").empty();
							 for(key in data) {
								$("#deptTeam").append("<option value='" + data[key]['deptNo']+ "'>"+ data[key]['deptName'] + "</option>");
							 }
							 var dept = $(".trRange1").find(".tdText").eq(1).text();
							 $('#deptTeam option').filter(function(){
										if($(this).val() == deptName){
											$(this).prop('selected', 'selected').change();
										}
								});
					 }
				}); 
			});
		});
		
	//상위/ 하위 부서 생성시 시퀀스 번호를 생성	
		$("#deptSelect").on("change", function(){
			var name = $(this).val();
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
							  var a = data['dm']['deptNo']
							  console.log(a);
							  var c = a.replace(a.substr(a.length-2), "02");
							  
							  $("#highCode2").val(c);
							}
					}); 
				 }
			 }
			}); 
		});
	</script>
	
	<!-- 부서 삭제  -->
	<script>
			function sweetTest(){
				var no = $("#deptCode").val();
				if(no != "CA01"){
				if($("#deptName").val() != ""){
				swal({
					  title: "해당 부서를 삭제하시겠습니까?",
					  icon: "error",
					  buttons: ["취소", "삭제"],
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
					    swal({
					    	title: "삭제 완료!",
					      	icon: "success"
					    }).then((value) => {	// 애니메이션 V 나오는 부분!
					    	var no = $("#deptCode").val();
					    	$.ajax({
								url:'deleteDept.am',
								type: 'post',
								data:{deptNo:no},
							 success:function(data){
									location.href='departmentManage.am';
									}
							});
					    
					    });
					  } else {
						  swal({
						  	title: "취소 하셨습니다.",
						    icon: "error"
						  });
					  }
				});
				}
				}else{
					swal({
		                 title: "미지정 부서는 삭제 할 수 없습니다.",
		                icon: "warning"
		              });
				}
			}
				</script>

	<script>
	//트리 구조 구현
		var open = 1;
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
											var name = $.trim($(this).text());
											 $.ajax({
												url:'highDeptSelectOne.am',
												type: 'post',
												data:{deptName:name},
											 success:function(data){
														$("#deptName").val(data['dm']['deptName']);
														$("#highName").val(data['dm']['highDept']);
														$("#deptCode").val(data['dm']['deptNo']);
														for(var i = 0; i<data['list'].length; i++ ){
															$("#frontMember").after("<tr class='trRange1' id='accessList'><td class='tdText'>"+data['list'][i]['memberName']+"</td><td class='tdText'>"+data['list'][i]['deapTeamNo']+"</td> <td class='tdText'>"+data['list'][i]['rankNo']+"</td><td class='tdText'>"+data['list'][i]['email']+"</td><input type='hidden' class='hiddenText' value='"+data['list'][i]['deptNo']+"'><input type='hidden' class='hiddenDept' value='"+data['list'][i]['memberType']+"'><input type='hidden' class='hiddenMember' value='"+data['list'][i]['memberNo']+"'><input type='hidden' class='rankName' value='"+data['list'][i]['memberPwd']+"'></tr>");
														}
													}
											}); 
									
									
									
								} else {
									temp_el.slideUp(300);
									$(this).find('em').removeClass('on').html(
											'하위폴더 닫힘');
									$(this).css('color', '#1E2B44').css(
											"font-weight", "400");
									$("#deptName").val("");
									$("#highName").val("");
									$("#deptCode").val("");
									$(".trRange1").remove();
									$(".menuTable").find(".deptSub").css("color", "#3287B2");
									$(this).find("#folderImg")
											.attr("src",
													"<c:url value="/resources/assets/img/folder.png"/>");
									
									
								}
								if(temp_el.size() == 0 && open ==1){
									$(this).find('em').addClass('on').html('하위폴더 열림');
									$(this).css('color', '#F59E1C').css("font-weight", "600");
									$(this).find("#folderImg").attr("src","<c:url value="/resources/assets/img/folderOpen.png"/>");
									open = 0;
									var name = $.trim($(this).text());
									 $.ajax({
										url:'highDeptSelectOne.am',
										type: 'post',
										data:{deptName:name},
									 success:function(data){
												$("#deptName").empty();
												$("#highName").empty();
												$("#deptCode").empty();
												$("#deptName").val(data['dm']['deptName']);
												$("#highName").val(data['dm']['highDept']);
												$("#deptCode").val(data['dm']['deptNo']);
												$(".trRange1").remove();
												for(var i = 0; i<data['list'].length; i++ ){
													$("#frontMember").after("<tr class='trRange1' id='accessList'><td class='tdText'>"+data['list'][i]['memberName']+"</td><td class='tdText'>"+data['list'][i]['deapTeamNo']+"</td> <td class='tdText'>"+data['list'][i]['rankNo']+"</td><td class='tdText'>"+data['list'][i]['email']+"</td><input type='hidden' class='hiddenText' value='"+data['list'][i]['deptNo']+"'><input type='hidden' class='hiddenDept' value='"+data['list'][i]['memberType']+"'><input type='hidden' class='hiddenMember' value='"+data['list'][i]['memberNo']+"'><input type='hidden' class='rankName' value='"+data['list'][i]['memberPwd']+"'></tr>");
												}
											}
									}); 
								}else if(open == 0){
									$(this).css('color', '#1E2B44').css("font-weight", "400");
									open = 1;
									$("#deptName").empty();
									$("#highName").empty();
									$("#deptCode").empty();
									$(".trRange1").remove();
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
	//부서 클릭 시 부서원 출력 
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
							$("#deptName").val(data['dm']['deptName']);
							$("#highName").val(data['dm']['highDept']);
							$("#deptCode").val(data['dm']['deptNo']);
							$(".trRange1").remove();
							
							for(var i = 0; i<data['list'].length; i++ ){
								$("#frontMember").after("<tr class='trRange1' id='accessList'><td class='tdText'>"+data['list'][i]['memberName']+"</td><td class='tdText'>"+data['list'][i]['deapTeamNo']+"</td> <td class='tdText'>"+data['list'][i]['rankNo']+"</td><td class='tdText'>"+data['list'][i]['email']+"</td><input type='hidden' class='hiddenText' value='"+data['list'][i]['deptNo']+"'><input type='hidden' class='hiddenDept' value='"+data['list'][i]['memberType']+"'><input type='hidden' class='hiddenMember' value='"+data['list'][i]['memberNo']+"'><input type='hidden' class='rankName' value='"+data['list'][i]['memberPwd']+"'></tr>");
							}
						}
				    }
				}); 
			});
			
		
		});
	</script>
</body>
</html>