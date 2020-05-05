<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.admin.department.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   List<Dept> list = (ArrayList<Dept>) request.getAttribute("dlist");
%>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>

</head>
<body onload="$('#route1').text('관리자메인')"> <br>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
		
		<!-- 막대차트 1 begin -->
		<div class="panel panel-headline">
			<div class="panel-heading" style="border:1px solid #D3D3D3">
				<br><b>주요 프로젝트 현황</b>&nbsp; (월별 프로젝트)
				<hr>
				<div class="container" style="width:95%; padding-bottom: 30px; margin-top: 30px;">
					<canvas id="myBarChart1" width="600px" height="320px"></canvas>				
				</div>
			</div>
		</div><!-- 막대차트 1 end -->
		
		<script>
			
			var ctx = document.getElementById('myBarChart1').getContext('2d');
			var myBarChart1 = new Chart(ctx, {
				type : 'bar',
				data : {
					labels : [ '1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월' ],
					datasets : [ {
						label : '',
						data : [ 
							
							/* 1, 5, 35, 34, 11, 55, 66, 23, 53, 22, 44, 55, 55 */
							
							/* ${pList.get(0).getCount()}, ${pList.get(1).getCount()}, ${pList.get(2).getCount()}, 
							${pList.get(3).getCount()}, ${pList.get(4).getCount()}, ${pList.get(5).getCount()},
							${pList.get(6).getCount()}, ${pList.get(7).getCount()}, ${pList.get(8).getCount()},
							${pList.get(9).getCount()}, ${pList.get(10).getCount()}, ${pList.get(11).getCount()} */
							
							'${monthlyProject.jan}',
							'${monthlyProject.feb}',
							'${monthlyProject.mar}',
							'${monthlyProject.apr}',
							'${monthlyProject.may}',
							'${monthlyProject.jun}',
							'${monthlyProject.jul}',
							'${monthlyProject.aug}',
							'${monthlyProject.sep}',
							'${monthlyProject.oct}',
							'${monthlyProject.nov}',
							'${monthlyProject.dec}',
							
						],
						backgroundColor : [ 
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
						],
						borderColor : [ 
								/* 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' */
						],
						borderWidth : 1,
						barPercentage: 0.5,
				        barThickness: 4,
				        maxBarThickness: 5,
				        minBarLength: 0.5,
				        categoryPercentage: 0.4
						
					} ]
				},

				options: {
				    tooltips: {
				      displayColors: true,
				      callbacks:{
				        mode: 'x',
				      },
				    },
				    scales: {
				      xAxes: [{
				        stacked: true,
				        gridLines: {
				          display: false,
				        }
				      }],
				      yAxes: [{
				        stacked: true,
				        ticks: {
				          beginAtZero: true,
				        },
				        type: 'linear',
				      }]
				    },
				        responsive: true,
				        maintainAspectRatio: false,
				        legend: { position: 'bottom' },
				    }
				});
		</script>
		
		
		
		
		
		
		<!-- 막대차트 2 begin -->
		<div class="panel panel-headline">
			<div class="panel-heading" style="border:1px solid #D3D3D3">
				<br><b>주요 프로젝트 현황</b>&nbsp; (부서/팀별 프로젝트)
				<hr>
				<div class="container" style="width:95%; padding-bottom: 30px; margin-top: 30px;">
					<canvas id="myBarChart2" width="600px" height="320px"></canvas>				
				</div>
			</div>
			
			<%-- <c:forEach var="aa" items="${dlist}">
				<input id="deptName" type="hidden" value="${aa.dlist.deptName}">			
			</c:forEach> --%>
		</div><!-- 막대차트 2 end -->
		
		<script>
			/* var deptName = $("#deptName").val(); */	
		
			var ctx = document.getElementById('myBarChart2').getContext('2d');
			var myBarChart2 = new Chart(ctx, {
				type : 'bar',
				data : {
					<%-- labels: [
						<%for(int i =0; i < list2.size(); i++){
							 Statistics st = (Statistics)list2.get(i);
						%> 
						
							'<%=st.getwStatus() %>',
						<%
						}
						%>
						], --%>
					labels : [ 
						
						'${dlist.get(0).deptName}'
						
						
					],
					datasets : [ {
						label : '',
						data : [ 
							
							22, 5, 35, 34, 11, 55, 33, 23, 21, 22, 44, 12, 22
							
						],
						backgroundColor : [ 
								'rgba(255, 99, 132, 0.2)',
								'rgba(54, 162, 235, 0.2)',
								'rgba(255, 206, 86, 0.2)',
								'rgba(75, 192, 192, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(153, 102, 255, 0.2)',
								'rgba(255, 159, 64, 0.2)'
						],
						borderColor : [ 
								/* 'rgba(255, 99, 132, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(54, 162, 235, 1)',
								'rgba(255, 206, 86, 1)',
								'rgba(75, 192, 192, 1)',
								'rgba(153, 102, 255, 1)',
								'rgba(255, 159, 64, 1)' */
						],
						borderWidth : 1,
						barPercentage: 0.5,
				        barThickness: 4,
				        maxBarThickness: 5,
				        minBarLength: 0.5,
				        categoryPercentage: 0.4
						
					} ]
				},

				options: {
					legend: { 
						display: false,
						position: 'left'
					}
				  /*   tooltips: {
				      displayColors: true,
				      callbacks:{
				        mode: 'x',
				      },
				    }, */
				    /* scales: {
				      xAxes: [{
				        stacked: true,
				        gridLines: {
				          display: false,
				        }
				      }],
				      yAxes: [{
				        stacked: true,
				        ticks: {
				          beginAtZero: true,
				        },
				        type: 'linear',
				      }]
				    }, */
				        /* responsive: true, */
				       /*  maintainAspectRatio: false,
				        legend: { position: 'bottom' }, */
				    }
				});
		</script>
		
		
		
		
		
		<!-- 막대차트 3 begin -->
		<div class="panel panel-headline">
			<div class="panel-heading" style="height:450px; border:1px solid #D3D3D3">
				<br><b>주요 프로젝트 현황</b>
				<hr>
				<div>
				
				</div>
			</div>
		</div><!-- 막대차트 3 end -->
</body>
</html>