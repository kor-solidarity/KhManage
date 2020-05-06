<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	.delete{
	width: 70px;
	height: 20px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
	}
</style>

</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('템플릿 관리');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><a href="insertTemplate.am"><button class="projectBtn"><i class="far fa-plus-square"></i> &nbsp;템플릿 등록</button></a>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">템플릿 명</td>
								<td class="thRange th1">템플릿 설명</td>
								<td class="tdText thRange">템플릿 분류</td>
								<td class="tdText thRange">수정일</td>
								<td class="tdText thRange">생성일</td>
								<td class="tdText thRange"></td>
							</tr>
							<tr>
								<td class="thRange th1"><input type="text" class="inputCss" style="width:390px;"></td>
								<td class="tdText thRange" style="width:370px;"><input type="text" class="inputCss" style="width:400px"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:110px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:110px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:110px;"></td>
								<td class="tdText thRange"><div style="width: 100px;"></div></td>
							</tr>

						<c:forEach var="t" items="${list}">
							<tr class="trRange"	id="accessList">
								<td class="td1" style="display: none;"><c:out value="${t.templatePk}"/></td>
								<td class="td1"><c:out value="${t.templateName}"/></td>
								<td class="tdText"><c:out value="${t.detail}"/></td>
								<td class="tdText"><c:out value="${t.projectTypePk}"/></td>
								<td class="tdText"><c:out value="${t.createDate}"/></td>
								<td class="tdText"><c:out value="${t.editDate}"/></td>
								<td class="tdText"><button class="delete">삭제</button></td>
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
						<!-- <script>
							$(function(){
								$("#projectTable").find('.td1').on('click', function(){
									location.href='accessDetailPage.am?num='+$(this).text();
								});
							});
						</script> -->
					</div>
				</div>
			</div>
</body>
<script>

	$("#projectTable tr").click(function(){
	var tm = $(this).children().eq(0).text();
		
		
		location.href = "selectOneTemplate.am?tm=" + tm;
	}); 
	
	
	$(".delete").click(function(){
		//var delList = $(this).parent().parent().remove();
    	
		var tm2 = $(this).eq(0).text();
		
		console.log(tm2)
		location.href = "templateDelete.am?tNo="+tm2;
	});
</script>




</html>






