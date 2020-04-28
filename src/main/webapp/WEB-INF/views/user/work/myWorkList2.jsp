<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.oversort {
		 overflow-x: auto;
		 white-space: nowrap; 
		 min-height: calc(100% - 120px); 
	 }
	.sortable { 
		display: inline-block; 
		vertical-align: top; 
		margin: 0; 
		margin-left: 5px; 
		margin-right: 5px; 
		background: #1E2B44; 
		width: 250px; 
		max-height: 700px;
		min-height: 25px; 
		border-radius: 4px; 
		float:none;
	}
	.sortable .header { 
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
	}
	.workDiv { 
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px;
		height: 110px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	
	.newlistitem { 
		min-width: 240px;
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		border: 1px solid #8e8e8e; 
		background: #fafafa; 
		border-radius: 4px; 
	}
	.newlistinput { 
		margin-left: 10px; 
		min-width: 230px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		border: 1px solid #8e8e8e; 
		background: #fafafa; 
		border-radius: 4px; 
	}
  
  .sortable-placeholder {
  	display: inline-block;
  	vertical-align: top;
  	margin: 0;
  	width: 250px;
  	min-height: 25px;
  	border-radius: 4px;
	border: 1px dotted black;
  }

  .sortable-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
	border-radius: 4px;
	
	}
	#newWork1{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	#newWork2{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	#newWork3{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	
	.header{
		color: white;
	}
	
	::-webkit-scrollbar {

		display:none;

	} 
	
	.workLabel1{
		min-width:10px;
		background:#FFB848;
		color:white;
		float:right;
	}
	.workLabel2{
		min-width:10px;
		background:#45B6AF;
		color:white;
		float:right;
	}
	
	.workLabel3{
		min-width:10px;
		background:#798EF6;
		color:white;
		float:right;
	}
	
	.workLabel4{
		min-width:10px;
		background:#FD3A0F;
		color:white;
		float:right;
	}
	
	.workLabel5{
		min-width:10px;
		background:#009900;
		color:white;
		float:right;
	}
	
	.typeLabel1{
		min-width:10px;
		float:left;
	}
	
	.typeLabel2{
		min-width:10px;
		float:left;
	}
	
	.typeLabel3{
		min-width:10px;
		float:left;
	}
	
	.clear {
		clear:both; 
		height:0; 
		overflow:hidden;
	}
	
	.rate{
		float:right;
	}
	
	.modalTd_T{
		/* width:250px; */
		height:30px;
		text-align:right;
		padding-right:10px;
	}
	
	.modalTd{
		/* width:200px; */
		height:30px;
		text-align:left;
	}
	
	.modalTd2{
		height:15px;
	}
	
	#fileUploadArea{
		height:auto;
		border:1px solid lightgray;
		border-radius: 5px;
	}
	
	#buttonArea1{
		float:right;
	}
	
	#buttonArea2{
		float:right;
	}
	
</style>
</head>
<body id="bodyAll" onload="$('#route1').text('내 작업'), $('#route2').text('작업 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<script src="${path }/resources/js/websocketopen.js"></script>
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<div class="oversort ui-sortable">
				<div class="sortable ui-sortable" id="workArea"  style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style: none;">
					<h5 class="nodrag header">내 할일</h5>
					<button id="newWork1">+ 새 작업 추가</button>
					<c:forEach var="l1" items="${map.list1 }">
					<div class="workDiv"><input type="hidden" value="${l1.workNo }">
					
					<c:if test="${l1.workType == '프로젝트' }">
					<label class="typeLabel1"><c:out value="${l1.workType }"/></label>
					</c:if>
					<c:if test="${l1.workType == '개인' }">
					<label class="typeLabel2"><c:out value="${l1.workType }"/></label>
					</c:if>
					<c:if test="${l1.workType == '일반' }">
					<label class="typeLabel3"><c:out value="${l1.workType }"/></label>
					</c:if>
					<c:if test="${l1.status == '개발중' }">
					<label class="workLabel1"><c:out value="${l1.status }"/></label>
					</c:if>
					<c:if test="${l1.status == '개발완료' }">
					<label class="workLabel2"><c:out value="${l1.status }"/></label>
					</c:if>
					<c:if test="${l1.status == '테스트완료' }">
					<label class="workLabel3"><c:out value="${l1.status }"/></label>
					</c:if>
					<c:if test="${l1.status == 'PL검토중' }">
					<label class="workLabel4"><c:out value="${l1.status }"/></label>
					</c:if>
					<c:if test="${l1.status == 'PL검토완료' }">
					<label class="workLabel5"><c:out value="${l1.status }"/></label>
					</c:if>
					<br>
					<div class="clear"></div>
					<label style="font-size:17px; line-height:280%;"><c:out value="${l1.workName }"/></label>
					<br>
					<c:out value="${l1.projectName }"/>
					<label class="rate"><c:out value="${l1.completeRate }"/>%</label>
					</div>
					</c:forEach>
					
				</div>
				
				<div class="sortable ui-sortable" style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style: none;">
					<h5 class="nodrag header">개발중</h5>
					<c:forEach var="l2" items="${map.list2 }">
					<div class="workDiv"><input type="hidden" value="${l2.workNo }">
					<c:if test="${l2.workType == '프로젝트' }">
					<label class="typeLabel1"><c:out value="${l2.workType }"/></label>
					</c:if>
					<c:if test="${l2.workType == '개인' }">
					<label class="typeLabel2"><c:out value="${l2.workType }"/></label>
					</c:if>
					<c:if test="${l2.workType == '일반' }">
					<label class="typeLabel3"><c:out value="${l2.workType }"/></label>
					</c:if>
					<label class="workLabel1"><c:out value="${l2.status }"/></label>
					<br>
					<div class="clear"></div>
					<label style="font-size:17px; line-height:280%;"><c:out value="${l2.workName }"/></label>
					<br>
					<c:out value="${l2.projectName }"/>
					<label class="rate"><c:out value="${l2.completeRate }"/>%</label>
					</div>
					</c:forEach>
				</div>
				
				<div class="sortable ui-sortable" style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style: none;">
					<h5 class="nodrag header">개발완료</h5>
					<c:forEach var="l3" items="${map.list3 }">
					<div class="workDiv"><input type="hidden" value="${l3.workNo }">
					<c:if test="${l3.workType == '프로젝트' }">
					<label class="typeLabel1"><c:out value="${l3.workType }"/></label>
					</c:if>
					<c:if test="${l3.workType == '개인' }">
					<label class="typeLabel2"><c:out value="${l3.workType }"/></label>
					</c:if>
					<c:if test="${l3.workType == '일반' }">
					<label class="typeLabel3"><c:out value="${l3.workType }"/></label>
					</c:if>
					<label class="workLabel2"><c:out value="${l3.status }"/></label>
					<br>
					<div class="clear"></div>
					<label style="font-size:17px; line-height:280%;"><c:out value="${l3.workName }"/></label>
					<br>
					<c:out value="${l3.projectName }"/>
					<label class="rate"><c:out value="${l3.completeRate }"/>%</label>
					</div>
					</c:forEach>
				</div>
				
				<div class="sortable ui-sortable" style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style: none;">
					<h5 class="nodrag header">개발자 테스트 완료</h5>
					<c:forEach var="l4" items="${map.list4 }">
					<div class="workDiv"><input type="hidden" value="${l4.workNo }">
					<c:if test="${l4.workType == '프로젝트' }">
					<label class="typeLabel1"><c:out value="${l4.workType }"/></label>
					</c:if>
					<c:if test="${l4.workType == '개인' }">
					<label class="typeLabel2"><c:out value="${l4.workType }"/></label>
					</c:if>
					<c:if test="${l4.workType == '일반' }">
					<label class="typeLabel3"><c:out value="${l4.workType }"/></label>
					</c:if>
					<label class="workLabel3"><c:out value="${l4.status }"/></label>
					<br>
					<div class="clear"></div>
					<label style="font-size:17px; line-height:280%;"><c:out value="${l4.workName }"/></label>
					<br>
					<c:out value="${l4.projectName }"/>
					<label class="rate"><c:out value="${l4.completeRate }"/>%</label>
					</div>
					</c:forEach>
				</div>
				<div class="sortable ui-sortable" style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style: none;">
					<h5 class="nodrag header">PL검토중</h5>
					<c:forEach var="l5" items="${map.list5 }">
					<div class="workDiv"><input type="hidden" value="${l5.workNo }">
					<c:if test="${l5.workType == '프로젝트' }">
					<label class="typeLabel1"><c:out value="${l5.workType }"/></label>
					</c:if>
					<c:if test="${l5.workType == '개인' }">
					<label class="typeLabel2"><c:out value="${l5.workType }"/></label>
					</c:if>
					<c:if test="${l5.workType == '일반' }">
					<label class="typeLabel3"><c:out value="${l5.workType }"/></label>
					</c:if>
					<label class="workLabel4"><c:out value="${l5.status }"/></label>
					<br>
					<div class="clear"></div>
					<label style="font-size:17px; line-height:280%;"><c:out value="${l5.workName }"/></label>
					<br>
					<c:out value="${l5.projectName }"/>
					<label class="rate"><c:out value="${l5.completeRate }"/>%</label>
					</div>
					</c:forEach>
				</div>
				<div class="sortable ui-sortable" style="overflow-y:auto; overflow-x:hidden; -ms-overflow-style: none;">
					<h5 class="nodrag header ">PL검토완료</h5>
					<c:forEach var="l6" items="${map.list6 }">
					<div class="workDiv"><input type="hidden" value="${l6.workNo }">
					<c:if test="${l6.workType == '프로젝트' }">
					<label class="typeLabel1"><c:out value="${l6.workType }"/></label>
					</c:if>
					<c:if test="${l6.workType == '개인' }">
					<label class="typeLabel2"><c:out value="${l6.workType }"/></label>
					</c:if>
					<c:if test="${l6.workType == '일반' }">
					<label class="typeLabel3"><c:out value="${l6.workType }"/></label>
					</c:if>
					<label class="workLabel5"><c:out value="${l6.status }"/></label>
					<br>
					<div class="clear"></div>
					<label style="font-size:17px; line-height:280%;"><c:out value="${l6.workName }"/></label>
					<br>
					<c:out value="${l6.projectName }"/>
					<label class="rate"><c:out value="${l6.completeRate }"/>%</label>
					</div>
					</c:forEach>
				</div>
			
    			<!-- <div class="oversort">
					<input type="text" class="newlistinput" name="newlistname" placeholder="Add New List..." />
				</div> -->
				</div>
			</div>
		</div>
	</div>
	  	
	  	
	  	<!-- 모달_사용자정보수정 begin -->
		<div class="modal fade" id="selectModal1" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;작업 등록 정보</h4>
		        </div>
		        <div class="modal-body">
		         <div class="portlet light bordered min-height-600">
                <div class="portlet-body">

                    <ul class="nav customtab nav-tabs" role="tablist">
                        <li role="presentation" class="nav-item active">
                            <a href="#profile" class="nav-link active" aria-controls="profile" role="tab" data-toggle="tab" aria-expanded="true">
                                <span class="visible-xs"><i class="fa fa-cog"></i></span> <span class="hidden-xs"><b>작업 정보</b></span>
                            </a>
                        </li>
                        <li role="presentation" class="nav-item">
                            <a href="#changePassword" class="nav-link" aria-controls="changePassword" role="tab" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs"><b>산출물</b></span>
                            </a>
                        </li>
                        <li role="presentation" class="nav-item">
                            <a href="#changeProfileImage" class="nav-link" aria-controls="changeProfileImage" role="tab" data-toggle="tab" aria-expanded="false">
                                <span class="visible-xs"><i class="fa fa-envelope-o"></i></span> <span class="hidden-xs"><b>히스토리</b></span>
                            </a>
                        </li>
                    </ul>

                    <div class="tab-content">

                        <div class="tab-pane active" id="profile" aria-expanded="true">

                            <form id="workRegForm11" action="myWorkReg.wk" method="post">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">작업명</td>
							<td><input type="text" name="workName" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">프로젝트 번호
							<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo }">
							</td>
							<td>
							<select name="projectNo" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									
									<c:forEach var="wp" items="${wp }">
									<option value="${wp.projectPk }"><c:out value="${wp.projectName }"/></option> 
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">작업유형</td>
							<td>
								<select name="workType" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="개인">개인</option>
									<option value="일반">일반</option>
									<option value="프로젝트">프로젝트</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">시작일</td>
							<td><input name="beginDate" type="date" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">완료일</td>
							<td><input name="completeDate" type="date" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId" style="width: 130px;">선행작업번호</td>
							<td><input name="precedeNo" type="text" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">완료율</td>
							<td><input name="completeRate" type="number" class="inputMenu form-control" style="width: 280px;" min="0" max="100"></td>
						</tr>
						<tr>
							<td class="titleId">승인자</td>
							<td>
							<select name="grantorNo" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="test01">개인</option>
									<option value="test02">일반</option>
									<option value="test03">프로젝트</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">작업단계</td>
							<td>
							<select name="workLevel" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="1">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">작업상태</td>
							<td>
							<select name="status" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="개발중">개발중</option>
									<option value="개발완료">개발완료</option>
									<option value="테스트완료">테스트완료</option>
									<option value="PL검토중">PL검토중</option>
									<option value="PL검토완료">PL검토완료</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">상위작업 번호</td>
							<td><input type="text" name="highWorkNo" class="inputMenu form-control" style="width: 280px;" required="required"></td>
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
		          <button type="button" class="btn btn-primary" id="workRegSubmit11" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		        </div>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	  	
	  	<%--작업 신규등록 모달창--%>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="workDetailTitle">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="workDetailTitle">
						<i class="fas fa-th-large"></i>&nbsp;신규 작업 등록
					</h4>
				</div>
				<div class="modal-body" id="workDetailContent">
					<div class="container-fluid">
						<%--
						<h2>Dynamic Tabs</h2>
						<p>To make the tabs toggleable, add the data-toggle="tab" attribute to each link. Then add a
							.tab-pane class with a unique ID for every tab and wrap them inside a div element with class
							.tab-content.</p>--%>

						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#home">작업정보</a></li>
							<li><a data-toggle="tab" href="#menu1">선행작업</a></li>
							<li><a data-toggle="tab" href="#menu2">산출물</a></li>
							<li><a data-toggle="tab" href="#menu3">가이드</a></li>
							<li><a data-toggle="tab" href="#menu3">히스토리</a></li>
						</ul>

						<div class="tab-content"><br>
							<%--작업정보--%>
							<div id="home" class="tab-pane fade in active"><%--id 홈 --%>
							<form id="workRegForm" action="myWorkReg.wk" method="post">
							<table id="buseoInfoTable" style="width:540px; padding:0px; table-layout: fixed">
								<tr>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
								</tr>
								<tr>
									<td class="modalTd_T">프로젝트명
									<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo }">
									</td>
									<td class="modalTd" colspan="5">
									<select name="projectNo" id="projectNo" class="inputMenu form-control" required="required">
										<option value="#" >선택하세요</option>
									
										<c:forEach var="wp" items="${wp }">
										<option value="${wp.projectPk }"><c:out value="${wp.projectName }"/></option> 
										</c:forEach>
									</select>
								</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">작업명</td>
									<td class="modalTd" colspan="2" >
									<input type="text" name="workName" class="inputMenu form-control">
									</td>
									<td class="modalTd_T">작업유형</td>
									<td class="modalTd" colspan="2">
									<select name="workType" class="inputMenu form-control" required="required">
										<option value="#" >선택하세요</option>
										<option value="개인">개인</option>
										<option value="일반">일반</option>
										<option value="프로젝트">프로젝트</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">시작일</td>
									<td class="modalTd" colspan="2">
									<input name="beginDate" type="date" class="inputMenu form-control" required="required">
									</td>
									<td class="modalTd_T">완료일</td>
									<td class="modalTd" colspan="2">
									<input name="completeDate" type="date" class="inputMenu form-control" required="required">
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">선행작업</td>
									<td class="modalTd" colspan="2" >
									<input name="precedeNo" type="text" class="inputMenu form-control" required="required">
									</td>
									<td class="modalTd_T">완료율</td>
									<td class="modalTd" colspan="2">
									<input name="completeRate" type="number" class="inputMenu form-control" min="0" max="100">	
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">작업단계</td>
									<td class="modalTd" colspan="2" >
										<select name="workLevel" class="inputMenu form-control" required="required">
											<option value="#" >선택하세요</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</td>
									<td class="modalTd_T">작업상태</td>
									<td class="modalTd" colspan="2">
										<select name="status" class="inputMenu form-control" required="required">
											<option value="#" >선택하세요</option>
											<option value="시작전">시작전</option>
											<option value="개발중">개발중</option>
											<option value="개발완료">개발완료</option>
											<option value="테스트완료">테스트완료</option>
											<option value="PL검토중">PL검토중</option>
											<option value="PL검토완료">PL검토완료</option>
											<option value="개발지연">개발지연</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">상위작업</td>
									<td class="modalTd" colspan="2" >
									<input type="text" name="highWorkNo" class="inputMenu form-control" required="required">
									</td>
									<td class="modalTd_T">승인자</td>
									<td class="modalTd" colspan="2">
										<select name="grantorNo" id="grantorList" class="inputMenu form-control" required="required">
											
										</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
								</tr>
								
					 		</table>
					 		<hr style="border:solid 1px lightgray;">
					 		<div id="buttonArea1">
					 		<button type="button" id="workRegCancel" class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="button" id="workRegSubmit" class="btn btn-primary"
									style="background: #1E2B44; outline: none; border: none;">저장
							</button>
							</div>
							</form>
							
							</div><%--id 홈 end --%>
							
							<div id="menu1" class="tab-pane fade">
								<h3>Menu 1</h3>
								<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
									ea commodo consequat.</p>
							</div>
							<div id="menu2" class="tab-pane fade">
								<form>
									<table id="buseoInfoTable" style="width:540px; padding:0px; table-layout: fixed">
								<tr>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
								</tr>
								<tr>
									<td class="modalTd_T">프로젝트명</td>
									<td class="modalTd" colspan="5">
									<input type="text" name="projectName" class="inputMenu form-control"></td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">작업명</td>
									<td class="modalTd" colspan="2" >
									<input type="text" name="projectName" class="inputMenu form-control">
									</td>
									<td class="modalTd_T">작업유형</td>
									<td class="modalTd" colspan="2">
									<input type="text" name="projectName" class="inputMenu form-control">
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">산출물 종류</td>
									<td class="modalTd" colspan="5">
									<select class="inputMenu form-control">
										<option>--선택하세요--</option>
										<option value="UI보고서">UI보고서</option>
										<option value="요구사항 정의서">요구사항 정의서</option>
										<option value="프로세스 정의서">프로세스 정의서</option>
										<option value="테이블 정의서">테이블 정의서</option>
										<option value="통합테스트 시나리오">통합테스트 시나리오</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">제목</td>
									<td class="modalTd" colspan="5" >
									<input type="text" name="projectName" class="inputMenu form-control">
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">내용</td>
									<td class="modalTd" colspan="5" rowspan="3">
									<textarea name="projectName" class="inputMenu form-control" style="resize:none;"></textarea>
									</td>
								</tr>
								<tr>
									<td class="modalTd"></td>
								</tr>
								<tr>
									<td class="modalTd"></td>
								</tr>
								<!-- <tr>
									<td class="modalTd_T">첨부파일</td>
									<td class="modalTd" colspan="5" >
									<div id="fileUploadArea66">
										<a href="#this" id="add" class="btn">파일 추가하기</a> 
									</div>
									</td>
								</tr> -->
								<tr>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
								</tr>
								
					 		</table>
							</form>
							
							<hr style="border:solid 1px lightgray;">
					 		<!-- <div id="buttonArea2">
					 		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="button" id="workFileSubmit" class="btn btn-primary"
									style="background: #1E2B44; outline: none; border: none;">저장
							</button>
							</div> -->
							</div>
							<div id="menu3" class="tab-pane fade">
								<h3>Menu 3</h3>
								<p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta
									sunt explicabo.</p>
							</div>
						</div>
					</div>
				</div>
				
			</div>
		</div>
	</div><%--모달 종료 --%>
	
	<%--작업 상세보기 모달창--%>
		<div class="modal fade" id="selectModal" tabindex="-1" role="dialog" aria-labelledby="workDetailTitle">
		<div class="modal-dialog " role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="workDetailTitle">
						<i class="fas fa-th-large"></i>&nbsp;작업 등록 정보
					</h4>
				</div>
				<div class="modal-body" id="workDetailContent">
					<div class="container-fluid">
						<%--
						<h2>Dynamic Tabs</h2>
						<p>To make the tabs toggleable, add the data-toggle="tab" attribute to each link. Then add a
							.tab-pane class with a unique ID for every tab and wrap them inside a div element with class
							.tab-content.</p>--%>

						<ul class="nav nav-tabs">
							<li class="active">
								<a data-toggle="tab" href="#homeInfo">작업정보</a></li>
							<li><a data-toggle="tab" href="#menuInfo1">선행작업</a></li>
							<li><a data-toggle="tab" href="#menuInfo2">산출물</a></li>
							<li><a data-toggle="tab" href="#menuInfo3">가이드</a></li>
							<li><a data-toggle="tab" href="#menuInfo4">히스토리</a></li>
						</ul>

						<div class="tab-content"><br>
							<%--작업정보--%>
							<div id="homeInfo" class="tab-pane fade in active"><%--id 홈 --%>
							<form id="workRegChange" action="myWorkChange.wk" method="post">
							<table id="workInfoTable" style="width:540px; padding:0px; table-layout: fixed">
								<tr>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
								</tr>
								<tr>
									<td class="modalTd_T">프로젝트명
									<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo }">
									
									</td>
									<td class="modalTd" colspan="5">
									<input type="text" name="projectName" id="projectName" class="inputMenu form-control projectName">
									<%-- <select name="projectNo" id="projectNo" class="inputMenu form-control" required="required">
										<option value="#" >선택하세요</option>
									
										<c:forEach var="wp" items="${wp }">
										<option value="${wp.projectPk }"><c:out value="${wp.projectName }"/></option> 
										</c:forEach>
									</select> --%>
								</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">작업명</td>
									<td class="modalTd" colspan="2" >
									<input type="text" name="workName" class="inputMenu form-control workName">
									</td>
									<td class="modalTd_T">작업유형</td>
									<td class="modalTd" colspan="2">
									<select name="workType" class="inputMenu form-control" required="required">
										<option value="#" >선택하세요</option>
										<option value="개인">개인</option>
										<option value="일반">일반</option>
										<option value="프로젝트">프로젝트</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">시작일</td>
									<td class="modalTd" colspan="2">
									<input name="beginDate" type="date" class="inputMenu form-control" required="required">
									</td>
									<td class="modalTd_T">완료일</td>
									<td class="modalTd" colspan="2">
									<input name="completeDate" type="date" class="inputMenu form-control" required="required">
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">선행작업</td>
									<td class="modalTd" colspan="2" >
									<input name="precedeNo" type="text" class="inputMenu form-control" required="required">
									</td>
									<td class="modalTd_T">완료율</td>
									<td class="modalTd" colspan="2">
									<input name="completeRate" type="number" class="inputMenu form-control" min="0" max="100">	
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">작업단계</td>
									<td class="modalTd" colspan="2" >
										<select name="workLevel" class="inputMenu form-control" required="required">
											<option value="#" >선택하세요</option>
											<option value="1">1</option>
											<option value="2">2</option>
											<option value="3">3</option>
										</select>
									</td>
									<td class="modalTd_T">작업상태</td>
									<td class="modalTd" colspan="2">
										<select name="status" class="inputMenu form-control" required="required">
											<option value="#" >선택하세요</option>
											<option value="시작전">시작전</option>
											<option value="개발중">개발중</option>
											<option value="개발완료">개발완료</option>
											<option value="테스트완료">테스트완료</option>
											<option value="PL검토중">PL검토중</option>
											<option value="PL검토완료">PL검토완료</option>
											<option value="개발지연">개발지연</option>
										</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">상위작업</td>
									<td class="modalTd" colspan="2" >
									<input type="text" name="highWorkNo" class="inputMenu form-control" required="required">
									</td>
									<td class="modalTd_T">승인자</td>
									<td class="modalTd" colspan="2">
										<select name="grantorNo" id="grantorList" class="inputMenu form-control" required="required">
											
										</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
								</tr>
								
					 		</table>
					 		<hr style="border:solid 1px lightgray;">
					 		<div id="buttonArea1">
					 		<button type="button" id="workRegCancel" class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="button" id="workRegSubmit" class="btn btn-primary"
									style="background: #1E2B44; outline: none; border: none;">저장
							</button>
							</div>
							</form>
							
							</div><%--id 홈 end --%>
							
							
							<div id="menuInfo1" class="tab-pane fade">
								<h3>Menu 1</h3>
								<p>Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex
									ea commodo consequat.</p>
							</div>
							
							<%--산출물 --%>
							<div id="menuInfo2" class="tab-pane fade">
							<form id="workFileInsert" action="myWorkFile.wk" method="post" enctype="multipart/form-data" novalidate="true">
							<table id="buseoInfoTable" style="width:540px; padding:0px; table-layout: fixed">
								<tr>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
									<td class="modalTd" style="width:16%;"></td>
								</tr>
								<tr>
									<td class="modalTd_T">프로젝트명
									<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo }">
									<input type="hidden" name="projectNo" class="projectNo">
									</td>
									<td class="modalTd" colspan="5">
									<input type="text" name="projectName" class="inputMenu form-control projectName" readOnly></td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">작업명
									<input type="hidden" name="workNo" class="workNo" readOnly>
									</td>
									<td class="modalTd" colspan="2" >
									<input type="text" name="workName" class="inputMenu form-control workName">
									</td>
									<td class="modalTd_T">작업유형</td>
									<td class="modalTd" colspan="2">
									<input type="text" name="workType" class="inputMenu form-control workType" readOnly>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">산출물 구분</td>
									<td class="modalTd" colspan="5">
									<select class="inputMenu form-control" name="productType">
										<option>--선택하세요--</option>
										<option value="UI보고서">UI보고서</option>
										<option value="요구사항정의서">요구사항 정의서</option>
										<option value="프로세스정의서">프로세스 정의서</option>
										<option value="테이블정의서">테이블 정의서</option>
										<option value="통합테스트 시나리오">통합테스트 시나리오</option>
									</select>
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">제목</td>
									<td class="modalTd" colspan="5" >
									<input type="text" name="productTitle" class="inputMenu form-control">
									</td>
								</tr>
								<tr>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
									<td class="modalTd2"></td>
								</tr>
								<tr>
									<td class="modalTd_T">내용</td>
									<td class="modalTd" colspan="5" rowspan="3">
									<textarea name="productContent" class="inputMenu form-control" style="resize:none;"></textarea>
									</td>
								</tr>
								<tr>
									<td class="modalTd"></td>
								</tr>
								<tr>
									<td class="modalTd"></td>
								</tr>
								<tr>
									<td class="modalTd_T">첨부파일</td>
									<td class="modalTd" colspan="5" >
									<div id="fileUploadArea">
										<a href="#this" id="add" class="btn">파일 추가하기</a> 
									</div>
									</td>
								</tr>
								<tr>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
									<td class="modalTd"></td>
								</tr>
					 		</table>
							</form>
							<table class="table table-striped table-bordered table-advance table-hover"
											   id="workProductTable">
											<thead>
											<tr>
												<th style="text-align: center; width: 20%;">
													산출물 구분
												</th>
												<th style="text-align: center; width: 40%;">
													파일명
												</th>
												<th style="text-align: center; width: 20%;">
													등록일
												</th>
												<th style="text-align: center; width: 7%;">
													삭제
												</th>
											</tr>
											</thead>
											<tbody>
											<tr id="d726674b-be83-4317-8f1f-4b984fc4890c">
												<td class="hidden-xs">
													UI보고서 
												</td>
												<td class="highlight">
													login.png
												</td>
												<td class="hidden-xs" style="text-align: center;">
													2020-04-28
												</td>
												<td style="text-align: center;">
													<button onclick="FileDelete('d726674b-be83-4317-8f1f-4b984fc4890c');"
															file_uid="d726674b-be83-4317-8f1f-4b984fc4890c"
															class="k-upload-action k-button-bare"
															style="display: inline-block;" type="button">
														<span class="glyphicon glyphicon-trash"> </span>
													</button>
												</td>
											</tr>

											</tbody>
							</table>
							<hr style="border:solid 1px lightgray;">
					 		<div id="buttonArea2">
					 		<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
							<button type="button" id="workFileSubmit" class="btn btn-primary"
									style="background: #1E2B44; outline: none; border: none;">저장
							</button>
							</div>
							</div>
							<div id="menuInfo3" class="tab-pane fade">
								<h3>Menu 3</h3>
								<p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta
									sunt explicabo.</p>
							</div>
							<div id="menuInfo4" class="tab-pane fade">
								<h3>Menu 4</h3>
								<p>Eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta
									sunt explicabo.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div><%--모달 종료 --%>
	  
	<script>
	
	$(function(){
		$("#projectNo").change(function(){
			var pno = $(this).val();
			console.log(pno);
			$("#grantorList").empty();
			$.ajax({
				type:"post",
				url:"projectGrantorList.wk",
				data:{pno:pno},
				dataType:"json",
				success:function(data){
					console.log(data);
					for(var i = 0; i < data.gt.length; i++){
						$("#grantorList").append("<option value='" + data.gt[i]['memberPk'] + "'>" + data.gt[i]['memberName'] + "</option>");
						
					}
					
				},
				error:function(error){
					
				}
			});
		});
	
	//모달
		$("#newWork1").click(function(){
			$('#myModal').modal('show');
		});  
	
		$("#workRegSubmit").click(function(){
			$('#workRegForm').submit();
		}); 
		
		$("#workChangeSubmit").click(function(){
			$('#workRegChange').submit();
		}); 
		
		$("#workFileSubmit").click(function(){
			$('#workFileInsert').submit();
		});
	
		$("#workArea").find("div").click(function(){
			var workNo = $(this).find("input").eq(0).val();
			$.ajax({
				url:"selectWork.wk",
				type:"post",
				data:{workNo:workNo},
				dataType:"json",
				success:function(data){
 					console.log(data);
 					
					console.log(data.beginDate);
					//시작일
					//4월 17, 2020
					var test = data.beginDate;
					var beginDateTest = test.split(/월 |, /)
					console.log(beginDateTest);
					// 4
					var month = beginDateTest[0];
					// 17
					var day = beginDateTest[1];
					// 2020
					var year = beginDateTest[2];
					
					var beginDate = 0;
					var rDay = 0;
					
					if(month < 10){
						var rMonth = "0" + month;
						if(day < 10){
							rDay = "0" + day;
							beginDate = year +"-"+ rMonth + "-" + rDay;
						}else{
							beginDate = year +"-"+ rMonth + "-" + day;
						}
					}else{
						if(day < 10){
							rDay = "0" + day;
							beginDate = year +"-"+ month + "-" + rDay;
						}else{
							beginDate = year +"-"+ month + "-" + day;
						}
					}
					//2020-04-17 출력
					console.log(beginDate);
					
					
					var ctest = data.completeDate;
					var completeDateTest = ctest.split(/월 |, /)
					console.log(completeDateTest);
					
					// 4
					var cMonth = completeDateTest[0];
					// 17
					var cDay = completeDateTest[1];
					// 2020
					var cYear = completeDateTest[2];
					
					var completeDate = 0;
					var crDay = 0;
					
					if(cMonth < 10){
						var crMonth = "0" + cMonth;
						if(cDay < 10){
							crDay = "0" + cDay;
							completeDate = cYear +"-"+ crMonth + "-" + crDay;
						}else{
							completeDate = cYear +"-"+ crMonth + "-" + cDay;
						}
					}else{
						if(cDay < 10){
							crDay = "0" + cDay;
							completeDate = cYear +"-"+ cMonth + "-" + crDay;
						}else{
							completeDate = cYear +"-"+ cMonth + "-" + cDay;
						}
					}
					
					//2020-04-17 출력
					console.log(beginDate);
					console.log(completeDate);
					
					$(".workNo").val(workNo);
					$(".workName").val(data.workName);
					$(".workType").val(data.workType);
					$("#projectNoForm").val(data.projectNo);
					$(".projectName").val(data.projectName);
					$(".beginDate").val(beginDate);
					$(".completeDate").val(completeDate);
					$("#precedeNo").val(data.precedeNo);
					$("#completeRate").val(data.completeRate);
					$("#grantorNo").val(data.grantorNo);
					$("#workLevel").val(data.workLevel);
					$("#status").val(data.status);
					$("#highWorkNo").val(data.highWorkNo);
					$("#workStatus").val(data.workStatus);
					
					$("#selectModal").modal('show');
				},
				error:function(request,status,error){
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);

				}
			});
		});
	});
	
	</script>

	<script>

	  
	function send(text){
    	ws.send(text);
    }
    
    function closeSocket(){
        ws.close();
    }
    
    function writeResponse(text){
    	//location.reload();
    	//$("#bodyAll").val(text);
    	//$(".newlistinput").before(text);
    }
	
	function updateListSortables(){
		$( ".sortable" ).sortable({
			connectWith: ".sortable",
			items: ":not(.nodrag)",
			placeholder: "sortable-placeholder ui-corner-all",
			change: function() {
					var list = $(this).closest('.sortable');
					var anchorBottom = $(list).find('.anchorBottom');
					$(list).append($(anchorBottom).detach());
				}
		});
		
		
		$('input[name="newlistitem"]').unbind().keyup(function(event){
			if(event.key == "Enter" || event.keyCode == "13"){
				$(this).before('<div>' + $(this).val() + '</div>');
				//var test = "$(this).before('<div>' + $(this).val() + '</div>')";
				var text = $("#bodyAll").val();
				send(test);
				$(this).val('');
			}
			
			});
		}
	
	
	$(function(){
		updateListSortables();
		
		$(".oversort").sortable({
			items: ":not(.nodrag)", 
			placeholder: "sortable-placeholder" 
		});
	

        
	$('input[name="newlistname"]').keyup(function(event){
		if(event.key == "Enter" || event.keyCode == "13"){
			$(this).before('<div class="sortable"><h5 class="nodrag header">' + 	$(this).val() + '</h5><input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item..." /></div>');
			//var text = '<div class="sortable"><h5 class="nodrag header">' + 	$(this).val() + '</h5><input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item..." /></div>';
			var text = $("#bodyAll").val();
			updateListSortables();
			send(text);
			$(this).val('');
			var oversort = $(this).closest('.oversort');
			$( oversort ).scrollLeft( $(oversort).prop("scrollWidth") - $(oversort).width() );
			}
		
		});
	
	$("a[name='delete']").on("click",function(e){
        e.preventDefault();
        fn_fileDelete($(this));
    });
	
    $("#add").on("click",function(e){
        e.preventDefault();
        fn_fileAdd();
    });
	
    
	});
	
	
	function fn_fileDelete(obj){
        obj.parent().parent().remove();
    }
	
    function fn_fileAdd(){
        var str = "<div style='filePlus'><div style='display: inline-flex;'><input type='file' class='fileCss' name='file'></div><div style='display: inline-flex;'><a href='#this' name='delete' class='btn'><i class='fas fa-minus-square'></i></a></div></div>";
        $("#fileUploadArea").append(str);
         
        $("a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_fileDelete($(this));         
        })
    }
	
	
	</script>
</body>

</html>
