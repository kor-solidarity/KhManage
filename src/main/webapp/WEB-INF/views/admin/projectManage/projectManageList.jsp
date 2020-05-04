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
	#projectTable{
		width:100%;
		text-align:left;
	}
	.trRange:hover{
		background:#EEEEEE;
		font-weight:800;
	}
	.projectBtn{
		width:130px;
		height:27px;
		border:none;
		background:#1E2B44;
		color:white;
		font-weight:600;
		border-radius: 5px;
		margin-right:6px;
		font-size:14px;
	}
	.tdText{
		text-align:center;
		height:30px;
		font-size:14px;
	}
	.thRange{
		background:#F3F3F3;
		color:#626262;
		font-size:15px;
		border:#B0B0B0 1px solid;
		height:35px;
		padding:3px;
	}
	.th1{
		width:400px;
		text-indent: 5px;
	}
	.td1{
		text-indent: 5px;
		color:#71A8D7;
	}
	.trRange{
		border:1px solid #B0B0B0;
		width:30px;
	}
	.inputCss{
		border-radius: 5px;
		border:none;
	}
	.buseoSelect{
		width:180px;
		border:1px solid #626262;
		height:25px;
		border-radius: 5px;
	}
	.pagingArea{
		background:#F3F3F3;
		height:50px;
		border:1px solid #B0B0B0;
	}
	.paging{
		margin-left:200px;
		width:50%;
	}
	.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
	.tdmidTable{height: 38px; text-align: center; font-size: 14px;}
</style>

</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('프로젝트 관리');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:700px; margin:0 auto; overflow-x:hidden;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><a href="projectRegister.pr"><button class="projectBtn"><i class="far fa-plus-square"></i> &nbsp;프로젝트 등록</button></a>
								<td>
								<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr class="th1" style="font-weight: bold; height: 38px; background: #FAFAFA; border: 1px solid #EAEAEA;">
									<th class="thmidTable">프로젝트명</th>
									<th class="thmidTable">유형</th>
									<th class="thmidTable">등급</th>
									<th class="thmidTable">PM</th>
									<th class="thmidTable">책임부서</th>
									<th class="thmidTable">상태</th>
									<th class="thmidTable">시작일</th>
									<th class="thmidTable">완료일</th>
									<th class="thmidTable">계획/실적</th>
									<th class="thmidTable">마감일</th>
								</tr>
						
							<c:forEach var='d' items="${list}">
								<tr>
									<td class="tdmidTable td td1" style="text-align: left; padding-left: 10px;"><a href="#">${d.projectName}</a>
										<input type="hidden" id="hiddenPid" value="${d.projectPk}">
									</td>
									<td class="tdmidTable td">${d.projectTypeName }</td>
									<td class="tdmidTable td">${d.projectRank }</td>
									<td class="tdmidTable td">${d.managerName }</td>
									<td class="tdmidTable td">${d.deptName }</td>
									<td class="tdmidTable td">
										<div>
											${d.status}
										</div>
									</td>
									<td class="tdmidTable td">${d.startDate}</td>
									<td class="tdmidTable td">${d.endDate}</td>
									<td class="tdmidTable td">
									<c:set var="sum" value="${(100/ d.allWork)*d.workClear}" />
									<c:if test="${(100/ d.allWork)*d.workClear != Double.NaN}">
										<label style="font-size: 7px; margin: 0px;">${sum+(1-(sum%1))%1}%</label>
									</c:if>
									<c:if test="${(100/ d.allWork)*d.workClear == Double.NaN}">
										<label style="font-size: 7px; margin: 0px;">0%</label>
									</c:if>
									
										<div class="bar-container">
										    <progress class="progressTag" value="${sum+(1-(sum%1))%1}" max="100" style="width:70px;"/>
										  </div>
									</td>
									<c:if test="${d.dDay >0 and d.status != '완료'}">
									<td class="tdmidTable td"><a href="#" style="color:#F3565D; font-weight: 600;">${d.dDay}일 지연</a></td>
									</c:if>
									<c:if test="${d.dDay <=0 and d.status != '완료' }">
									<td class="tdmidTable td"><a href="#" style="color:#1E2B44; font-weight: 600;">${fn:substring(d.dDay,1,8)}일 남음</a></td>
									</c:if>
									<c:if test="${d.status == '완료' }">
									<td class="tdmidTable td"><a href="#" style="color:#1E2B44; font-weight: 600;">-</a></td>
									</c:if>
								</tr>
						</c:forEach>
							<tr class="pagingArea">
								<td colspan="11">
									<div class="paging">
										<c:if test="${pi.currentPage <= 1 }">
												이전 &nbsp;
												</c:if>
												<c:if test="${ pi.currentPage > 1 }">
												<c:url var="alistBack" value="projectList.am">
													<c:param name="currentPage" value="${pi.currentPage - 1 }"/>
												</c:url>
													<a href="${ alistBack }">이전</a>&nbsp;
												</c:if>
												&nbsp;&nbsp;
												<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
													<c:if test="${p eq pi.currentPage }">
														<font color="#1E2B44" size="4"><b>${p }</b></font>
													</c:if>
													
													<c:if test="${p ne pi.currentPage }">
														<c:url var="alistCheck" value="projectList.am">
															<c:param name="currentPage" value="${p }"/>
														</c:url>
														<a href="${alistCheck }"> ${p}</a>
													</c:if>
													&nbsp;
												</c:forEach>
												&nbsp;&nbsp;
												<c:if test="${pi.currentPage >= pi.endPage }">
													다음 &nbsp;
												</c:if>
												<c:if test="${pi.currentPage < pi.endPage }">
												<c:url var="alistEnd" value="projectList.am">
													<c:param name="currentPage" value="${pi.currentPage + 1 }"/>
												</c:url>
													<a href="${alistEnd}">다음</a>
												</c:if>	
									</div>
								</td>
							</tr>
						</table>
						<script>
							$(function(){
								$(document).on('click', '.td1', function(){
									var a = $(this).find("#hiddenPid").val();
									location.href='projectDetail.am?pid='+ a;
								});
							});
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>