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
	.clear {clear:both; height:0; overflow:hidden;}
	
	.rate{
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
					<button id="newWork1">+ 내 작업 추가</button>
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
		<div class="modal fade" id="myModal" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;신규 작업 등록</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		            <form id="workRegForm" action="myWorkReg.wk" method="post">
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
		          <button type="button" class="btn btn-primary" id="workRegSubmit" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	  	
	  	
	  	<!-- 모달_사용자정보수정 begin -->
		<div class="modal fade" id="selectModal" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;작업 등록 정보</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		            <form id="workRegChange" action="myWorkChange.wk" method="post">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">작업명
							<input type="hidden" name="workNo" id="workNo">
							<input type="hidden" name="workStatus" id="workStatus">
							</td>
							<td>
							<input type="text" id="workName" name="workName" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId">프로젝트 번호
							<input type="hidden" name="memberNo" value="${sessionScope.loginUser.memberNo }">
							</td>
							<td><input type="text" name="projectNo" id="projectNo" class="inputMenu form-control" style="width: 280px;" required="required" readOnly></td>
						</tr>
						<tr>
							<td class="titleId">작업유형</td>
							<td>
							<input type="text" id="workType" name="workType" class="inputMenu form-control" style="width: 280px;" readOnly required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">시작일</td>
							<td><input name="beginDate" id="beginDate" type="date" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">완료일</td>
							<td><input name="completeDate" id="completeDate" type="date" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId" style="width: 130px;">선행작업번호</td>
							<td><input name="precedeNo" id="precedeNo" type="text" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId">완료율</td>
							<td><input name="completeRate" id="completeRate" type="number" class="inputMenu form-control" style="width: 280px;" min="0" max="100" readOnly></td>
						</tr>
						<tr>
							<td class="titleId">승인자</td>
							<td>
							<input type="text" id="grantorNo" name="grantorNo" class="inputMenu form-control" style="width: 280px;" readOnly required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">작업단계</td>
							<td>
							<input type="text" id="workLevel" name="workLevel" class="inputMenu form-control" style="width: 280px;" readOnly required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">작업상태</td>
							<td>
							<select name="status" id="status" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="개발중" 
									<c:if test="${data.status == '개발중' }"> selected </c:if>>개발중</option>
									<option value="개발완료" 
									<c:if test="${data.status == '개발완료' }">selected</c:if>>개발완료</option>
									<option value="테스트완료" 
									<c:if test="${data.status == '테스트완료' }">selected</c:if>>테스트완료</option>
									<option value="PL검토중" 
									<c:if test="${data.status == 'PL검토중' }">selected</c:if>>PL검토중</option>
									<option value="PL검토완료" 
									<c:if test="${data.status == 'PL검토완료' }">selected</c:if>>PL검토완료</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">상위작업 번호</td>
							<td><input type="text" name="highWorkNo" id="highWorkNo" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
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
		          <button type="button" class="btn btn-primary" id="workChangeSubmit" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	<script>
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
	
		$("#workArea").find("div").click(function(){
			var workNo = $(this).find("input").eq(0).val();
			$.ajax({
				url:"selectWork.wk",
				type:"post",
				data:{workNo:workNo},
				dataType:"JSON",
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
					
					$("#workNo").val(workNo);
					$("#workName").val(data.workName);
					$("#workType").val(data.workType);
					$("#projectNo").val(data.projectNo);
					$("#beginDate").val(beginDate);
					$("#completeDate").val(completeDate);
					$("#precedeNo").val(data.precedeNo);
					$("#completeRate").val(data.completeRate);
					$("#grantorNo").val(data.grantorNo);
					$("#workLevel").val(data.workLevel);
					$("#status").val(data.status);
					$("#highWorkNo").val(data.highWorkNo);
					$("#workStatus").val(data.workStatus);
					
					$("#selectModal").modal('show');
				},
				error:function(error){
					console.log(error);
				}
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
    	$("#bodyAll").val(text);
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
	});
	
	
	
	</script>
</body>

</html>
