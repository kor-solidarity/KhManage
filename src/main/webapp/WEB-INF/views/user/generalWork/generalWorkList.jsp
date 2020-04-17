<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>        
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
	.trRange:hover{
		background:#EEEEEE;
		font-weight:800;
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
</style>

</head>
<body onload="$('#route1').text('일반업무')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
		<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:400px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><a href="showInsertGeneralWorkPage.gw"><button class="projectBtn"><i class="far fa-plus-square"></i> &nbsp;일반작업 등록</button></a>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">작업제목</td>
								<td class="tdText thRange">작업 설명</td>
								<td class="tdText thRange">작업종류</td>
								<td class="tdText thRange">시작일</td>
								<td class="tdText thRange">완료일</td>
								<td class="tdText thRange">생성일</td>
							</tr>
							<tr class="front">
								<td class="thRange th1"><input type="search" id="nameSearch" class="inputCss" style="width:280px;"></td>
								<td class="tdText thRange" style="width:370px;"><input type="text" class="inputCss" style="width:360px"></td>
								<td class="tdText thRange" style="width:370px;"><input type="text" class="inputCss" style="width:160px"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:200px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:200px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:200px;"></td>
							</tr>
							<c:forEach var="a" items="${list}">
							<tr class="trRange"	id="accessList">
								<td class="td1"><c:out value="${a.gwName}"/><input type="hidden" id="gwNo" class="gwNo" value="${a.gwNo}"></td>
								<td class="tdText"><c:out value="${a.gwMemo}"/></td>
								<c:if test="${a.gwType eq '출장' }">
								<td class="tdText"><div style="width:80px; height:20px; background:#428BCA; line-height:20px; font-size:12px;  margin:0 auto; color:white; font-weight:600; text-align:center; border-radius: 5px;">${a.gwType}</div></td>
								</c:if>
								<c:if test="${a.gwType eq '일반작업'}">
								<td class="tdText"><div style="width:80px; height:20px; background:#44B6AE; line-height:20px; font-size:12px;  margin:0 auto; color:white; font-weight:600; text-align:center; border-radius: 5px;">${a.gwType}</div></td>
								</c:if>
								<td class="tdText"><c:out value="${a.beginDate}"/></td>
								<td class="tdText"><c:out value="${a.endDate}"/></td>
								<td class="tdText"><c:out value="${a.enrollDate}"/></td>
							</tr>
								
							</c:forEach>
							<tr class="pagingArea">
								<td colspan="6">
									<div class="paging">
										<c:if test="${pi.currentPage <= 1 }">
												[이전] &nbsp;
												</c:if>
												<c:if test="${ pi.currentPage > 1 }">
												<c:url var="alistBack" value="accessManage.am">
													<c:param name="currentPage" value="${pi.currentPage - 1 }"/>
												</c:url>
													<a href="${ alistBack }">[이전]</a>&nbsp;
												</c:if>
												<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
													<c:if test="${p eq pi.currentPage }">
														<font color="red" size="4"><b>[${p }]</b></font>
													</c:if>
													<c:if test="${p ne pi.currentPage }">
														<c:url var="alistCheck" value="accessManage.am">
															<c:param name="currentPage" value="${p }"/>
														</c:url>
														
														<a href="${alistCheck }"> ${p}</a>
													</c:if>
												</c:forEach>
												
												<c:if test="${pi.currentPage >= pi.endPage }">
													[다음] &nbsp;
												</c:if>
												<c:if test="${pi.currentPage < pi.endPage }">
												<c:url var="alistEnd" value="accessManage.am">
													<c:param name="currentPage" value="${pi.currentPage + 1 }"/>
												</c:url>
													<a href="${alistEnd}">[다음]</a>
												</c:if>									
									</div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		<script>
			$(function(){
				$(document).on('click', '.td1', function(){
					location.href='generalWorkDetailPage.gw?gwNo='+ $(this).find(".gwNo").val();
				});
			});
		</script>
	
</body>
</html>