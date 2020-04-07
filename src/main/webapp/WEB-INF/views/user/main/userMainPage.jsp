<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.topTable {width: 100%;}
.midTable {width: 40%;}
.tdTop {width: 15%; text-align: right; height: 100px; 
		/* vertical-align:top; */ border: 1px solid lightgray; background: white; border-spacing: 0px;}
.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.bottom1{width:}
.td{background: transparent;}

.panel-heading1{width:100%; border: 1px solid lightgray;}
		 
.bottom1{background: white;}
.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
.tdmidTable{font-size: 14px;}
.midTable2{text-align: center;}
.thmidTable2{border: 1px solid lightgray; height: 38px; text-align: center; border:none}
/* .cellMenu1{font-family: open sands; margin: 2px; font-weight:normal; font-size: 35px; margin-right: 5px; color:#5c9bd1;} */
.mywork{background-image: url("resources/assets/img/main_mywork.png"); background-repeat: no-repeat; 
		background-position:-130% -5%; background-size: 80% 80%;}
.requestModify{background-image: url("resources/assets/img/main_modifyRequest.png"); background-repeat: no-repeat; 
		background-position:-130% -5%; background-size: 80% 80%;}
.issue{background-image: url("resources/assets/img/main_issue.png"); background-repeat: no-repeat; 
		background-position:-130% -5%; background-size: 80% 80%;}
.requestApproval{background-image: url("resources/assets/img/main_approvalRequest.png"); background-repeat: no-repeat; 
		background-position:-130% -5%; background-size: 80% 80%;}
.object{background-image: url("resources/assets/img/main_object.png"); background-repeat: no-repeat; 
		background-position:-130% -5%; background-size: 80% 80%;}
.project{background-image: url("resources/assets/img/main_project.png"); background-repeat: no-repeat; 
		background-position:-130% -5%; background-size: 80% 80%;}
		 
</style>

</head>
<body onload="$('#route1').text('HOME')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<div id="wrap">
	
		<div class="">
			<div class="panel-heading">
			
				<div class="top">
					<table class="topTable">
						<tr>
							<td class="tdTop mywork">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#5c9bd1">3</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">내 작업</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">더 보기
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							
							<td class="td"></td>
							<td class="tdTop requestModify">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#4DB3A2">6</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">변경요청</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop issue">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#8877A9">7</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">이슈</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop requestApproval">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#F36A5A">16</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">승인요청</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop object">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#1BA39C">19</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">산출물</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop project">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#5E738B">19</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">프로젝트</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
						<tr>
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
							<td class="tdMid"><b>작업 진행상태</b>
							<hr>
								<div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>이슈 현황</b>
							<hr>
								<div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				
				<br><br>
				<div class="panel panel-headline">
					<div class="panel-heading" style="height:450px; border:1px solid #D3D3D3">
						<table class="midTable2" style="width:100%;">
							<br>
							<tr>
								<b>예정작업 (금주/차주)</b>
							</tr>
							<hr>
							<tr class="" style="font-weight: bold; height: 38px; background: #FAFAFA; border: 1px solid #EAEAEA;">
								<th class="thmidTable">프로젝트명</th>
								<th class="thmidTable">작업명</th>
								<th class="thmidTable">승인자</th>
								<th class="thmidTable">시작일</th>
								<th class="thmidTable">완료일</th>
								<th class="thmidTable">완료율</th>
							</tr>
							<tr>
								<td class="tdmidTable td"><a href="#">서포트 금형제작</a></td>
								<td class="tdmidTable td">내 작업</td>
								<td class="tdmidTable td">김태원</td>
								<td class="tdmidTable td">2020-04-01</td>
								<td class="tdmidTable td">2020-04-01</td>
								<td class="tdmidTable td">97%</td>
							</tr>
						</table>
					</div>
				</div>
				
				<br>
				
				<div class="panel panel-headline">
					<div class="panel-heading" style="height:450px; border:1px solid #D3D3D3">
						<table class="midTable2" style="width:100%;">
							<br>
							<tr>
								<b>내 산출물</b>
							</tr>
							<hr>
							<tr class="" style="font-weight: bold; height: 38px; background: #FAFAFA; border: 1px solid #EAEAEA;">
								<th class="thmidTable2" style="width:35%">프로젝트</th>
								<th class="thmidTable2" style="width:20%">작업</th>
								<th class="thmidTable2" style="width:25%">파일이름</th>
								<th class="thmidTable2" style="width:20%">등록일자</th>
							</tr>
							<tr>
								<td class="tdmidTable td">서포트 금형제작</td>
								<td class="tdmidTable td">제작회의1</td>
								<td class="tdmidTable td"><a href="#">프로젝트 개발 개요</a></td>
								<td class="tdmidTable td">2020-03-30</td>
							</tr>
						</table>
					</div>
				</div>
				
				
			</div>
		</div>
			









			
	</div>
</body>
</html>