<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.titleTd{
		width:20%;
		color:#5E738B;
		font-weight:600;
	}
	.tdValue{
		color:#666666;
	}
</style>
</head>
<body onload="$('#route1').text('일반 작업'); $('#route2').text('상세페이지');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 600px; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
					<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">일반작업 등록 정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr height="20px;"></tr>
						</table>
					<table class="menuTable" style="width:100%">
						<tr>
							<td class="titleTd" align="center">작업종류</td>
							<td class="tdValue">${work.gwType}</td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">시작일</td>
							<td class="tdValue">${work.beginDate}</td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">종료일</td>
							<td class="tdValue">${work.endDate}</td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">작업제목</td>
							<td class="tdValue">${work.gwName}</td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">작업설명</td>
							<td class="tdValue">${work.gwMemo}</td>
						</tr>
						<tr height="30px;"></tr>
						<tr>
							<td class="titleTd" align="center" style="line-height: 10px;">첨부파일</td>
							<td class="tdValue">
								<table style="width:80%;">
									<tr style="border:1px solid lightgray;">
									<th class="titleTd" style="font-size:14px; height:30px; background: #EEEEEE;">&nbsp;&nbsp;등록된 첨부 파일</th>
									</tr>
									<tr style="border:1px solid lightgray; height:60px;">
									<c:if test="${list != null }">
									  <c:forEach var="a" items="${list }">
										<td class="td1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i class="fas fa-file-upload"></i>&nbsp;&nbsp;<c:out value="${a.originName}"/><input id="hiddenAtNo" class="hiddenAtNo" type="hidden" value="${a.atNo}"></td>
									  </c:forEach>
									 </c:if>
									 <c:if test="${list == null }">
									 	<td class="td1" style="height:30px;"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;첨부파일 없음</td>
									 </c:if> 
									</tr>
								</table>
							</td>
						</tr>
					</table>
					<script>
						$(function(){
							$(document).on('click', '.td1', function(){
								var downNo =  $(this).find(".hiddenAtNo").val();
								location.href = "download.fo?no="+downNo;
							});
						});
					</script>
			</div>			
		</div>
	</div>
</div>				
</body>
</html>