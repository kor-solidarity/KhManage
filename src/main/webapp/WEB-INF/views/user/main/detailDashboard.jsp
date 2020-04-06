<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.select{width: 49%; height: 25px; border-radius: 5px;}
.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.tableDiv{margin-left: 40px;}
.projectInfoTable{width:90%; margin: 5px; font-size: 13px;}
.pjtTd{width: 25%; height: 40px; font-weight:bold; color:#5E738B}
.pjtTd2{width: 30%;}
.pjtTd3{width: 20%; font-weight:bold; color:#5E738B}
.pjtTd4{width: 30%;}
.td{padding-left: 5px;}

</style>

</head>
<body onload="$('#route1').text('대시보드'); $('#route2').text('상세대시보드')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	
	<div id="wrap">
	
		<br>
		<div class="panel-heading">
			<select class="select">
				<option>111111111</option>			
				<option>111111111</option>
				<option>111111111</option>			
				<option>111111111</option>			
				<option>111111111</option>			
			</select>
		</div>

		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>프로젝트 정보</b>
							<hr>
								<div class="tableDiv">
									<table border="0" class="projectInfoTable">
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
							<td class="tdMid"><b>프로젝트 태스크 진행상태</b>
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
								<div class="chart-none-data">
									<div>No data available</div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>변경요청</b>
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
							<td class="tdMid"><b>작업배정 현황</b>
							<hr>
								<div class="">
									<div></div>
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