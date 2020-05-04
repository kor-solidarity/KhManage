<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*, com.kh.manage.forum.model.vo.*"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<script src="resources/daypilot/demo/helpers/jquery-1.12.2.min.js" type="text/javascript"></script>
<!-- daypilot libraries -->
<script src="resources/daypilot/demo/js/daypilot-all.min.js" type="text/javascript"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js" integrity="sha256-qE/6vdSYzQu9lgosKxhFplETvWvqAAlmAuR+yPh/0SI=" crossorigin="anonymous"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>



<style>

.topTable {width: 100%;}
.midTable {width: 40%; border-left: 1px solid #EAEAEA; border-right: 1px solid #EAEAEA;}
.tdTop {width: 15%; text-align: right; height: 100px; 
		/* vertical-align:top; */ border: 1px solid lightgray; background: white; border-spacing: 0px;}
.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.bottom1{width:}
.td{background: transparent;}

.panel-heading1{width:100%; border: 1px solid lightgray;}
		 
.bottom1{background: white;}
.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
.tdmidTable{font-size: 14px; height: 35px; border-bottom: 1px solid #EAEAEA;}
.midTable2{text-align: center; border-left: 1px solid #EAEAEA; border-right: 1px solid #EAEAEA;}
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
		
.progress-sm.progress {
    height: 7px;
    background-color: #f5f5f5;
    box-shadow: inset 0px 1px 2px rgba(0,0,0,0.1);
}

.k-grouping-row td {
    text-align: left !important;
    padding: 8px;
}
.progressTag{
	width:70px;
}

.kt-badge.kt-badge--unified-brand {
	color: #5d78ff;
	background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-nonestart {
    color: #bbbbbb;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-success {
    color: #0abb87;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-danger {
    color: #fd397a;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-complete {
    color: #428bca;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-warning {
    color: #ffb822;
    background: rgba(234, 234, 234, 0.3);
}
		 
</style>

</head>
<body onload="$('#route1').text('HOME')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	<div id="wrap">
	
		<div class="">
			<div class="panel-heading">
			
				<div class="top">
					<table class="topTable">
						<tr>
							<td class="tdTop mywork">
								<!-- <div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#5c9bd1">3</div> -->
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">내 작업</div>
								<div style="width: 100%">
									<a href="myWorkList.wk" style="background:#F1F1F1; width: 100%">더 보기
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							
							<td class="td"></td>
							<td class="tdTop requestModify">
								<!-- <div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#4DB3A2">6!</div> -->
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">변경요청</div>
								<div style="width: 100%">
									<a href="changeRequestList.iu" style="background:#F1F1F1; width: 100%">더 보기
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop issue">
								<!-- <div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#8877A9">7!</div> -->
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">이슈</div>
								<div style="width: 100%">
									<a href="issueList.iu" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop requestApproval">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#F36A5A">16!</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">승인요청</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop object">
								<!-- <div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#1BA39C">19!</div> -->
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">산출물</div>
								<div style="width: 100%">
									<a href="#" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop project">
								<!-- <div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#5E738B">19</div> -->
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">프로젝트</div>
								<div style="width: 100%">
									<a href="projectCenter.pr" style="background:#F1F1F1; width: 100%">view more
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
						<tr>
					</table>
				</div>
			</div>
		</div>
		
		
		<script>
								
		var memberNo = "${loginUser.memberNo}";
		console.log("memberNo : " + memberNo);
		
		//상단 내 프로젝트 관련 count 불러오기

		//1. 내작업 count
		$.ajax({
			url: 'myWorkCount.me',
			type: 'post',
			data: {
			 memberNo : memberNo
			},
			success: function(data){
				$(".mywork").prepend(     
					  "<div class='cellMenu1' style='font-weight:normal; font-size: 35px; margin-right: 10px; color:#5c9bd1'>" + data + "</div>"
				);
			}
		});
				
		//2. 변경요청 count
		$.ajax({
			url: 'myChangeCount.me',
			type: 'post',
			data: {
			 memberNo : memberNo
			},
			success: function(data){
				
				console.log("변경요청 : " + data);
				
				if(data > 0) {
					$(".requestModify").prepend(     
						  "<div class='cellMenu1' style='font-weight:normal; font-size: 35px; margin-right: 10px; color:#4DB3A2'>" + data + "</div>"
					);
				} else {
					$(".requestModify").prepend(     
						  "<div class='cellMenu1' style='font-weight:normal; font-size: 35px; margin-right: 10px; color:#4DB3A2'>" + 0 + "</div>"
					);
				}
			}
		});
		
		//3. 이슈 count
		$.ajax({
			url: 'myIssueCount.me',
			type: 'post',
			data: {
			 memberNo : memberNo
			},
			success: function(data){
				$(".issue").prepend(     
					  "<div class='cellMenu1' style='font-weight:normal; font-size: 35px; margin-right: 10px; color:#8877A9'>" + data + "</div>"
				);
			}
		});
		
		//4. 승인요청 count

		//5. 산춞물 count
		$.ajax({
			url: 'myWorkProductCount.me',
			type: 'post',
			data: {
			 memberNo : memberNo
			},
			success: function(data){
				$(".object").prepend(     
					  "<div class='cellMenu1' style='font-weight:normal; font-size: 35px; margin-right: 10px; color:#1BA39C'>" + data + "</div>"
				);
			}
		});

		//6. 프로젝트 count
		$.ajax({
			url: 'myProjectCount.me',
			type: 'post',
			data: {
			 memberNo : memberNo
			},
			success: function(data){
			 
			 $(".project").prepend(     
				  "<div class='cellMenu1' style='font-weight:normal; font-size: 35px; margin-right: 10px; color:#5E738B'>" + data + "</div>"
			 );
			}
		});


</script>
		
		
				
		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>작업 진행상태</b>
							<hr>
								
								<div id="workStatus" style="width: 400px; padding-left: 10px; margin: 0 auto;">
									<canvas id="workStatusCanvas" width="350px;" height="350px;"></canvas>
								</div>
								
								<script>
								if('${myStatic.before}' > 0 || '${myStatic.developing}' > 0 || '${myStatic.completed}' > 0 || '${myStatic.plChecking}' > 0 || '${myStatic.testCompleted}' > 0 || '${myStatic.plChecked}' > 0 || '${myStatic.delayed}' > 0 ) {
									var ctx = document.getElementById('workStatusCanvas');
									var myChart = new Chart(ctx, {
										type: 'doughnut',
										data: {
											labels: [
												//'시작전', '개발중', '개발완료', '테스트완료', 'PL검토중', 'PL검토완료', '개발지연'
										        '시작 전',
										        '개발중',
										        '개발완료',
										        'PL검토중',
										        '테스트완료',
										        'PL승인완료',
												'개발지연'
											],
											datasets: [{
												label: '# of Votes',
												data: [
													//MyStatic 객체
													//before, developing, completed, testCompleted, plChecking, plChecked, delayed
													'${myStatic.before}',	 		//시작 전
													'${myStatic.developing}',		//개발중
													'${myStatic.completed}',		//개발완료
													'${myStatic.plChecking}',		//PL검토중
													'${myStatic.testCompleted}',	//테스트완료
													'${myStatic.plChecked}',		//PL승인완료
													'${myStatic.delayed}'			//개발지연
												],
												
												backgroundColor: [
													'rgba(219, 219, 219, 0.5)',		//시작 전
													'rgba(0, 128, 255, 0.2)',		//개발중
													'rgba(0, 128, 255, 0.6)',		//개발완료
													'rgba(0, 128, 255, 0.8)',		//PL검토중
													'rgba(0, 255, 115, 0.3)',		//테스트완료
													'rgba(0, 255, 115, 1.2)',		//PL승인완료
													'rgba(243, 106, 90, 1)'			//개발지연
												],
												borderColor: [
													/* 'rgba(255, 99, 132, 1)',
													'rgba(255, 206, 86, 1)',
													'rgba(54, 162, 235, 1)',
													'rgba(54, 162, 235, 1)',
													'rgba(54, 162, 235, 1)',
													'rgba(54, 162, 235, 1)',
													'rgba(54, 162, 235, 1)',
													'rgba(54, 162, 235, 1)' */
												],
												borderWidth: 1,
												hoverBorderWidth : 1
											}]
										},
										options: {
											
											legend:{
									          position: 'right',
									          labels:{
									            fontColor: "gray",
									            weight: "bold"
									          }
									        },
											cutoutPercentage: 45,
											responsive: true,
											scales: {
													ticks: {
														//cutoutPercentage: 30,
														//percentageInnerCutout: 30,
														beginAtZero: true
													}
											},
											/* animation {
												animation.animateRotate	: true
											}, */
											
										}
									});
									
								} else {
									$("#workStatus").text("데이터가 없습니다.");
								}
								
								</script>
								
							</td>
							<td class="td2"></td>
							<td class="tdMid">
							   <ul class="nav nav-tabs nav-tabs-line nav-tabs-bold nav-tabs-line-brand" role="tablist" style="margin-bottom: 30px;">
					            <li><b>이슈 현황</b></li>
					                <li class="nav-item" id="issueStatus"  style="float: right;">
					                    <a class="nav-link" data-toggle="tab" href="#tabStatusChart" role="tab" aria-selected="false"><b>구분별</b></a>
					                </li>
					                <li class="nav-item active" id="issueKind" style="float: right;">
					                    <a class="nav-link active" data-toggle="tab" href="#tabTypeChart" role="tab" aria-selected="false" aria-expanded="true"><b>상태별</b></a>
					                </li>
					            </ul>
								<div class="chartArea2" style="width: 400px; padding-left: 50px; margin: 0 auto;">
									<canvas id="myChart3" width="350px;" height="350px;"></canvas>
								</div>
								
								
								<script>
								
								//이슈 구분별 상태
								$("#issueStatus").click(function(){
									$(".chartArea2").empty();

									if('${issueTypeList.pro}' > 0 || '${issueTypeList.before}' > 0 || '${issueTypeList.com}' > 0) {
										$(".chartArea2").append("<canvas id='myChart4' width='350px;' height='350px;'></canvas>");
										var ctx = document.getElementById('myChart4');
										var myChart = new Chart(ctx, {
											type: 'doughnut',
											data: {
												labels: ['새기능', '버그발생', '개선사항'],
												datasets: [{
													label: '# of Votes',
													data: [
														'${issueTypeList.pro}',
														'${issueTypeList.before}',
														'${issueTypeList.com}'
													],
													backgroundColor: [
														'rgba(75, 192, 192, 0.2)',
														'rgba(153, 102, 255, 0.2)',
														'rgba(255, 159, 64, 0.2)'
													],
													borderColor: [
													/* 	'rgba(75, 192, 192, 1)',
														'rgba(153, 102, 255, 1)',
														'rgba(255, 159, 64, 1)' */
													],
													borderWidth: 1,
													
													hoverBorderWidth : 1
												}]
											},
											options: {
												
												legend:{
											          position: 'right',
											          labels:{
											            fontColor: "gray",
											            weight: "bold"
											          }
											        },
										        cutoutPercentage: 45,
												responsive: false,
												scales: {
														ticks: {
															//cutoutPercentage: 60,
															beginAtZero: true
														}
												},
											}
										});
									} else {
										$(".chartArea2").text("데이터가 없습니다.");
									}
								});

								
								$("#issueKind").click(function(){
									$(".chartArea2").empty();

									$(".chartArea2").append("<canvas id='myChart3' width='350px;' height='350px;'></canvas>");
									if('${issueList.before}' > 0 || '${issueList.pro}' > 0 || '${issueList.del}' > 0 || '${issueList.com}' > 0) {
										var ctx = document.getElementById('myChart3');
										var myChart = new Chart(ctx, {
											type: 'doughnut',
											data: {
												labels: ['확인중', '조치중', '조치완료', '취소'],
												datasets: [{
													label: '# of Votes',
													data: [
														
														'${issueList.before}',
														'${issueList.pro}',
														'${issueList.del}',
														'${issueList.com}'
													],
													backgroundColor: [
														'rgba(0, 128, 255, 0.6)',
														'rgba(0, 128, 255, 0.8)',
														'rgba(0, 255, 115, 1.2)',
														'rgba(243, 106, 90, 1)'	
													],
													borderColor: [
														/* '#1E2B44',
														'rgba(54, 162, 235, 1)',
														'rgba(255, 206, 86, 1)',
														'rgba(75, 192, 192, 1)', */
													],
													borderWidth: 1,
													
													hoverBorderWidth : 1
												}]
											},
											options: {
												
												legend:{
											          position: 'right',
											          labels:{
											            fontColor: "gray",
											            weight: "bold"
											          }
										        },
										        cutoutPercentage: 45,
												responsive: false,
												scales: {
														ticks: {
															//cutoutPercentage: 60,
															beginAtZero: true
														}
												},
											}
										});
									
								} else {
									$(".chartArea2").text("데이터가 없습니다.");
								}
								});
								
								
								//이슈상태 차트
								if('${issueList.before}' > 0 || '${issueList.pro}' > 0 || '${issueList.del}' > 0 || '${issueList.com}' > 0) {
										var ctx = document.getElementById('myChart3');
										var myChart = new Chart(ctx, {
											type: 'doughnut',
											data: {
												labels: ['확인중', '조치중', '조치완료', '취소'],
												datasets: [{
													label: '# of Votes',
													data: [
														
														'${issueList.before}',
														'${issueList.pro}',
														'${issueList.del}',
														'${issueList.com}'
													],
													backgroundColor: [
														'rgba(0, 128, 255, 0.6)',
														'rgba(0, 128, 255, 0.8)',
														'rgba(0, 255, 115, 1.2)',
														'rgba(243, 106, 90, 1)'	
													],
													borderColor: [
														/* '#1E2B44',
														'rgba(54, 162, 235, 1)',
														'rgba(255, 206, 86, 1)',
														'rgba(75, 192, 192, 1)', */
													],
													borderWidth: 1,
													
													hoverBorderWidth : 1
												}]
											},
											options: {
												
												legend:{
											          position: 'right',
											          labels:{
											            fontColor: "gray",
											            weight: "bold"
											          }
										        },
										        cutoutPercentage: 45,
												responsive: false,
												scales: {
														ticks: {
															//cutoutPercentage: 60,
															beginAtZero: true
														}
												},
											}
										});
									
								} else {
									$(".chartArea2").text("데이터가 없습니다.");
								}
									
								</script>
								
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
							<c:forEach var="ww" items="${myWorkList}">
							<tr>
								<td class="tdmidTable td"><a href="#">${ww.projectName}</a></td>
								<td class="tdmidTable td">${ww.workName}</td>
								<td class="tdmidTable td">${ww.grantorName}</td>
								<td class="tdmidTable td">${ww.beginDate}</td>
								<td class="tdmidTable td">${ww.completeDate}</td>
								<td class="tdmidTable td">${ww.completeRate}%</td>
							</tr>
							</c:forEach>
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
							<c:forEach var="w" items="${wpList}">
							<tr>
								<td class="tdmidTable td">${w.projectName}</td>
								<td class="tdmidTable td">${w.workName}</td>
								<td class="tdmidTable td"><a href="#">${w.originName}</a></td>
								<td class="tdmidTable td">${w.enrollDate}</td>
							</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				
				
			</div>
		</div>

			
	</div>
	
	
	
	
	
	
	<!-- ------------------------------------------------- -->
	<%-- <script>
	
	
		$(".select").change(function(){
			console.log("dsadsadsa");
			console.log($(this).val());
			var	pNo = $(this).val();
			
			location.href = "selectDashBoard.gwm?pNo="+pNo;
			
			
		});
		
	</script>
	<script>
	<% if(list2.size() > 0){ %>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: [
			<%for(int i =0; i < list2.size(); i++){
				 Statistics st = (Statistics)list2.get(i);
			%> 
			
				'<%=st.getwStatus() %>',
			<%
			}
			%>
			],
			datasets: [{
				label: '# of Votes',
				data: [
					<%for(int i =0; i < list2.size(); i++){
						 Statistics st = (Statistics)list2.get(i);
					%> 
					
						<%=st.getCnt()%>,
					<%
					}
					%>	
				],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1,
				
				hoverBorderWidth : 1
			}]
		},
		options: {
			responsive: false,
			scales: {
					ticks: {
						cutoutPercentage: 60,
						beginAtZero: true
					}
			},
		}
	});
	<%}else {%>
	$("#task").text("No data available");
	<%}%>
</script> --%>
	
	
	
</body>
</html>





