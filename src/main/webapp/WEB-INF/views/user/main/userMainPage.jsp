<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*, com.kh.manage.forum.model.vo.*"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>

<%
	
	//List<Statistics> list2 = (ArrayList<Statistics>) request.getAttribute("list2");
	/* List<Statistics> list3 = (ArrayList<Statistics>) request.getAttribute("list3");
	List<Statistics> list4 = (ArrayList<Statistics>) request.getAttribute("list4");
	List<Mwork> list5 = (ArrayList<Mwork>) request.getAttribute("list5"); */
	
%>
    
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#4DB3A2">6</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">변경요청</div>
								<div style="width: 100%">
									<a href="changeRequestList.iu" style="background:#F1F1F1; width: 100%">더 보기
										<i class="m-icon-swapright m-icon-gray"></i>
									</a>
								</div>
							</td>
							<td class="td"></td>
							<td class="tdTop issue">
								<div class="cellMenu1" style="font-weight:normal; font-size: 35px; margin-right: 10px; color:#8877A9">7</div>
								<div style="margin-right: 10px; font-size: 13px; color:#AAB5BC">이슈</div>
								<div style="width: 100%">
									<a href="issueList.iu" style="background:#F1F1F1; width: 100%">view more
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
		console.log("멤버No : " + memberNo);
		
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
		
		
		
		
		</script>
		
		
				
		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>작업 진행상태</b>
							<hr>
								
								<div id="workStatus" style="width: 350px; margin:0 auto;">
									<canvas id="workStatusCanvas" width="280px;" height="280px;"></canvas>
								</div>
								
								<script>

								var ctx = document.getElementById('workStatusCanvas');
								var myChart = new Chart(ctx, {
									type: 'doughnut',
									data: {
										labels: [
											
											//'시작전', '개발중', '개발완료', '테스트완료', 'PL검토중', 'PL검토완료', '개발지연')
											
									        '시작 전',
									        '개발중',
									        '개발완료',
									        'PL검토중',
									        'PL검토완료',
											'개발지연',
									        '테스트완료'
											
										],
										datasets: [{
											label: '# of Votes',
											data: [

												7, 3, 9, 1, 1, 1, 1, 1
												
											],
											backgroundColor: [
												'rgba(243, 106, 90, 1)',
												'rgba(54, 162, 235, 1)',
												'rgba(64, 174, 223, 0.2)',
												'rgba(64, 174, 223, 0.2)',
												'rgba(64, 174, 223, 0.2)',
												'rgba(64, 174, 223, 0.2)',
												'rgba(64, 174, 223, 0.2)',
												'rgba(64, 174, 223, 0.2)',
												'rgba(64, 174, 223, 0.2)'
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
										
										/* legend:{
									          position: 'bottom',
									          labels:{
									            fontColor: "white"
									          }
								        }, */
										cutoutPercentage: 45,
										responsive: true,
										scales: {
												ticks: {
													//cutoutPercentage: 30,
													//percentageInnerCutout: 30,
													beginAtZero: true
												}
										},
									}
								});
								
								</script>
								
								
								<div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>이슈 현황</b>
							<hr>
							
							<div id="issue" style="width:280px; margin:0 auto;">
								<canvas id="issueCanvas" width="280px;" height="280px;"></canvas>
							</div>
							
							<script>
								
								var ctx = document.getElementById('issueCanvas');
								var myChart = new Chart(ctx, {
									type: 'doughnut',
									data: {
										labels: [
											
											'Red',
									        'Yellow',
									        'Blue'
											
										],
										datasets: [{
											label: '# of Votes',
											data: [

												10, 20, 30
												
											],
											backgroundColor: [
												'rgba(255, 99, 132, 0.2)',
												'rgba(255, 206, 86, 0.2)',
												'rgba(54, 162, 235, 0.2)'
											],
											borderColor: [
												'rgba(255, 99, 132, 1)',
												'rgba(255, 206, 86, 1)',
												'rgba(54, 162, 235, 1)'
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
								
								
								
								</script>	
							
							
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





