<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
.tdmidTable{height: 38px; text-align: center;}


</style>

</head>
<body onload="$('#route1').text('대시보드'); $('#route2').text('종합대시보드')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	
	<div id="wrap">
	
		<div class="">
			<div class="panel-heading">
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
									<td class="tdmidTable td"></td>
								</tr>
							</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>



			
	</div>
</body>
</html>