<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
.tdmidTable{height: 38px; text-align: center; font-size: 14px;}
.panel-heading

</style>

</head>
<body onload="$('#route1').text('대시보드'); $('#route2').text('종합대시보드')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	
	<div id="wrap">
	
		<div class="">
			<div class="panel-heading" style="margin-top: -20px;">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>주요 프로젝트 현황</b>
							<hr>
							<table class="midTable2" style="width:100%;">
								<tr class="" style="font-weight: bold; height: 38px; background: #FAFAFA; border: 1px solid #EAEAEA;">
									<th class="thmidTable">프로젝트명</th>
									<th class="thmidTable">유형</th>
									<th class="thmidTable">등급</th>
									<th class="thmidTable">PM</th>
									<th class="thmidTable">부서</th>
									<th class="thmidTable">상태</th>
									<th class="thmidTable">시작일</th>
									<th class="thmidTable">완료일</th>
									<th class="thmidTable">계획/실적</th>
									<th class="thmidTable">산출물</th>
									<th class="thmidTable">이슈</th>
									<th class="thmidTable">상태</th>
								</tr>
								<tr>
									<td class="tdmidTable td" style="text-align: left; padding-left: 10px;"><a href="#">서포트 금형제작</a></td>
									<td class="tdmidTable td">신약개발</td>
									<td class="tdmidTable td">S</td>
									<td class="tdmidTable td">pmo01</td>
									<td class="tdmidTable td">신약개발팀</td>
									<td class="tdmidTable td">
										<div>
											지연
										</div>
									</td>
									<td class="tdmidTable td">2019-02-04</td>
									<td class="tdmidTable td">2020-01-26</td>
									<td class="tdmidTable td">97%</td>
									<td class="tdmidTable td"><a href="#">0</a></td>
									<td class="tdmidTable td"><a href="#">2</a></td>
									<td class="tdmidTable td">
										<%-- <a href="#"> <img src="<c:url value="/resources/assets/img/searchMark.png"/>" style="width: 12px; height: 12px;"> --%>
									</td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>프로젝트 진행현황</b>
							<hr>
								<div class="tableDiv">
									<table border="1" class="projectInfoTable">
										<tr>
											<td class="pjtTd td">프로젝트 명</td>
											<td class="pjtTd2 td">프로젝트X</td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">프로젝트 번호</td>
											<td class="pjtTd2 td"></td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">개발 형태</td>
											<td class="pjtTd2 td">양산개발</td>
											<td class="pjtTd3 td">개발 등급</td>
											<td class="pjtTd4 td">SS</td>
										</tr>
										<tr>
											<td class="pjtTd td">PMO</td>
											<td class="pjtTd2 td">데모사용자</td>
											<td class="pjtTd3 td">제품유형</td>
											<td class="pjtTd4 td">-</td>
										</tr>
										<tr>
											<td colspan="4" class="pjtTd td">제품기능(설명)</td>
										</tr>
										<tr>
									 		<td colspan="4" class="pjtTd td">설명입니다.</td>
										</tr>
									</table>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>프로젝트 현황</b>
							<hr>
								<div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>이슈 현황</b>
							<hr>
								<div class="tableDiv">
									<table border="1" class="projectInfoTable">
										<tr>
											<td class="pjtTd td">프로젝트 명</td>
											<td class="pjtTd2 td">프로젝트X</td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">프로젝트 번호</td>
											<td class="pjtTd2 td"></td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">개발 형태</td>
											<td class="pjtTd2 td">양산개발</td>
											<td class="pjtTd3 td">개발 등급</td>
											<td class="pjtTd4 td">SS</td>
										</tr>
										<tr>
											<td class="pjtTd td">PMO</td>
											<td class="pjtTd2 td">데모사용자</td>
											<td class="pjtTd3 td">제품유형</td>
											<td class="pjtTd4 td">-</td>
										</tr>
										<tr>
											<td colspan="4" class="pjtTd td">제품기능(설명)</td>
										</tr>
										<tr>
									 		<td colspan="4" class="pjtTd td">설명입니다.</td>
										</tr>
									</table>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>월별 프로젝트</b>
							<hr>
								<div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
			
	</div>
</body>
</html>