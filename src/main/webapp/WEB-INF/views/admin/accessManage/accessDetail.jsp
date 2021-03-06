<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%> 	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.titleText {
	padding-top: 13px;
	padding-left: 13px;
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
}

.inputMenu {
	border: 1px solid lightgray;
	width: 300px;
	outline: none;
	border-radius: 5px;
}

.titleId {
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
	padding-right: 10px;
	width: 200px;
}

.insertForm {
	width: 100%;
	margin: 0 auto;
}

.cancleBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
}

.deleteBtn {
	width: 60px;
	height: 25px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 12px;
}

.okBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 100px;
}

.plusMember {
	width: 60px;
	height: 25px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 12px;
}

#projectTable {
	width: 100%;
	text-align: left;
}

#projectTable1 {
	width: 100%;
	text-align: left;
}

.projectBtn {
	width: 130px;
	height: 27px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 600;
	border-radius: 5px;
	margin-right: 6px;
	font-size: 14px;
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
<body onload="$('#route1').text('관리자'); $('#route2').text('권한그룹 등록');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp" />
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 700px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
					<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">권한그룹 등록 정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
					</table>
					<form action="insertAccessMember.am" id="form1">
					<table align="left" style="width: 100%;">
						<tr>
							<td class="titleId" style="padding-left: 100px;">권한그룹 명</td>
							<td><input type="text" class="inputMenu" name="accessName" value="${aDetail.accessName}"
								style="width: 100%;">
								<input type="hidden" name="accessNo" value="${aDetail.accessGroupNo}">
								</td>

						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleId" style="padding-left: 90px;">권한그룹 설명</td>
							<td><textarea class="inputMenu" rows="" cols="" name="aContent"
									style="width: 100%; height: 150px;">${aDetail.aContent}</textarea></td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button"class="okBtn" id="save"  onclick="sweetTest();">
									<i class="fas fa-check"></i>&nbsp;저장
								</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="accessManage.am">
									<button type="button" class="cancleBtn" onclick="history.go(-1)">
										<i class="fas fa-ban"></i>&nbsp;취소
									</button>
							</a>
							<c:if test="${loginUser.memberId eq 'admin'}">
							<a href="accessManage.am">
								<button type="button" class="cancleBtn" style="background:lightgray; margin-left: 20px;" onclick="history.go(-1)">
									<i class="fas fa-ban"></i>&nbsp;삭제
								</button>
								</a>
								</c:if>
							</td>
						</tr>
						<tr height="30px;"></tr>
						<tr>
							<td class="titleText" colspan="2">권한그룹 사용자</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<div style="overflow: auto;">
									<table id="projectTable1" align="center">
										<tr>
											<td class="thRange th1"></td>
											<td class="tdText thRange">부서</td>
											<td class="tdText thRange">이름</td>
											<td class="tdText thRange">직급</td>
											<td class="tdText thRange" style="width: 600px;">이메일</td>
										</tr>
										<tr class="mainFront">
											<td class="thRange th1"></td>
											<td class="tdText thRange"><input type="text"
												class="inputCss" style="width: 100px"></td>
											<td class="tdText thRange"><input type="text"
												class="inputCss" style="width: 100px;"></td>
											<td class="tdText thRange"><input type="text"
												class="inputCss" style="width: 100px;"></td>
											<td class="tdText thRange"><input type="text"
												class="inputCss" style="width: 570px;"></td>
										</tr>
										<c:if test="${list.size()>0}">
										<c:forEach var="a" items="${list}">
										<tr class='trRange1'> 
											<td class='td1'>
												<input type='checkbox' id='idCheckMain' name='idCheck' class='inputCss' style='width: 30px;'>
											</td> 
											<td class='td1'><c:out value="${a.deptName}"/></td> 
											<td class='tdText'><c:out value="${a.memberName}"/></td> 
											<td class='tdText'><c:out value="${a.rankName}"/>
											<input type='hidden' id='memberNo' name='memberNo' class='memberNo' value='${a.memberNo}'>
											</td> <td class='tdText'><c:out value="${a.email}"/></td> 
										</tr>
										</c:forEach>
										</c:if>
										
										<tr class="pagingArea">
											<td colspan="5">
												<div class="paging"></div>
											</td>
										</tr>
										<tr height="10px;"></tr>
										<tr>
											<td colspan="5">
												<button type="button" class="plusMember" id="memberPlus">
													<i class="fas fa-plus"></i>&nbsp;추가
												</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">
													<button type="button" class="deleteBtn" id="memberDelete">
														<i class="fas fa-minus"></i>&nbsp;삭제
													</button>
											</a>
											</td>
										</tr>
									</table>
								</div>
							</td>
						</tr>
					</table>
				</form>
					<!-- 모달 창 -->
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
										<i class="fas fa-th-large"></i>&nbsp;권한그룹 사용자
									</h4> 
								</div>
								<div class="modal-body">
									<div class="container-fluid">
										<div class="row" style="overflow: auto;">
											<table id="projectTable" align="center" style="width:200px;">
												<tr>
													<td class="thRange th1"></td>
													<td class="thRange th1">부서</td>
													<td class="tdText thRange">이름</td>
													<td class="tdText thRange">직급</td>
													<td class="tdText thRange">이메일</td>
													
												</tr>
												<tr class="front">
													<td class="thRange th1" align="center"><input type="checkbox"></td>
													<td class="thRange th1">
														<select id="searchDept" class="inputCss">
															<option>선택</option>
															<c:forEach var="d" items="${dList}">
																<option value="${d.deptName}"><c:out value="${d.deptName}"/></option>
															</c:forEach>
														</select>
													</td>
													<td class="tdText thRange"><input type="text"
														class="inputCss" style="width: 90px"></td>
													<td class="tdText thRange"><input type="text"
														class="inputCss" style="width: 90px;"></td>
													<td class="tdText thRange"><input type="text"
														class="inputCss" style="width: 170px;"></td>
												</tr>
												
												<tr class="pagingArea">
													<td colspan="5">
												<div class="paging"></div>
														</td>
												</tr>
													
											</table>

										</div>
										<div class="row">
											<div class="col-sm-9">
												<div class="row"></div>
											</div>
										</div>
									</div>
								</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-default"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary" id="saveBtn"
										style="background: #1E2B44; outline: none; border: none;">저장</button>
								</div>
							</div>
							<!-- /.modal-content -->
						</div>
						<!-- /.modal-dialog -->
					</div>
					<!-- /.modal -->
					<script>
					$("#memberPlus").click(function(){
						$('#myModal').modal('show');
					});
					
					$("#memberDelete").click(function(){
						$("input:checkbox[name=idCheck]:checked").filter(function(){
							$(this).parent().siblings().parent().empty();
						});
					});
					
					
					</script>
					<script>
					var memberList = new Array();
					var bool = true;
					var mlist;
					var count = 1;
					$("#saveBtn").on('click', function(){
					    var b = $(".trRange").siblings().find(".memberNo").val();
					    $("#projectTable1 tr").filter(function(){
							var a =  $(this).find(".memberNo").val();
							
							if(a != undefined && count ==1){
								mlist = a;
								count ++;
							}else if(a != undefined){
								mlist += "," + a;
							}
						});
					    console.log(mlist);
					    var check = true;
						$("input:checkbox[name=idCheck]:checked").filter(function(){
								var a = $(this).parent().siblings().find(".memberNo").val();
								if(mlist != undefined){
									var str = mlist.split(',');
									console.log(str);
									for(var i = 0; i < str.length; i++){
										if(str[i] == a){
											console.log("중복!")
											i = str.length;
											check = false;
										}
									}
								}
								
							  if(check == true){
									for(key in list){
										if(list[key]['memberNo']== a){
											$(".mainFront").after("<tr class='trRange1'> <td class='td1'><input type='checkbox' id='idCheckMain' name='idCheck' class='inputCss' style='width: 30px;'></td> <td class='td1'>"+list[key]['deptName'] +"</td> <td class='tdText'>"+list[key]['memberName']+"</td> <td class='tdText'>"+list[key]['rankNo']+"<input type='hidden' id='memberNo' name='memberNo' class='memberNo' value='"+ list[key]['memberNo']+"'></td> <td class='tdText'>"+list[key]['email']+"</td> </tr>");
											memberList = list[key]['memberNo'];
										}         
									}
						       }else{
						    	   swal({
						                 title: "이미 포함된 회원입니다.",
						                icon: "error"
						             });
						       }
						    
							});
							if(check = false){
								swal({
					                 title: "이미 포함된 회원입니다.",
					                icon: "error"
					              });
							}else{
								$('#myModal').modal('hide');
							}
							
						});
					</script>
					 <script>
						function sweetTest(){
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
								    	$("#form1").submit();
								    });
								  } else {
									  swal({
									  	title: "취소 하셨습니다.",
									    icon: "error"
									  });
								  }
							});
						}
				</script>
						<script>
						var list;
							$("#searchDept").on("change",function(){
								var name = $(this).val();
								if(name == " "){
									name = null;
								}
								 $.ajax({
									url:'searchDeptMember.am',
									type: 'post',
									data:{deptName:name},
								 success:function(data){
									 list = data;
									 if(data != ""){
									 $(".trRange").empty();	
									 for(key in data) {
											$(".front").after("<tr class='trRange'> <td class='td1'><input type='checkbox' id='idCheck' name='idCheck' class='inputCss' style='width: 30px;'></td> <td class='td1'>"+data[key]['deptName'] +"</td> <td class='tdText'>"+data[key]['memberName']+"</td> <td class='tdText'>"+data[key]['rankNo']+"<input type='hidden' id='memberNo' class='memberNo' value='"+ data[key]['memberNo']+"'></td> <td class='tdText'>"+data[key]['email']+"</td> </tr>");
									 }
									 }else{
										 $(".trRange").empty();	
									 }
								 }
								}); 
							});
						</script>
				</div>
			</div>
		</div>
	</div>
</body>
</html>