<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*, com.kh.manage.project.model.vo.*,com.kh.manage.member.model.vo.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<% 
	List<ProjectDetail> pList = (ArrayList<ProjectDetail>)request.getAttribute("pList");
	List<ProjectRank> rList = (ArrayList<ProjectRank>)request.getAttribute("rList");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<style>
#myChart, #myChart3, #myChart4{
	margin: 0 auto;
	height: 300px !important;
	width: 300px !important;
	font-size:14px;
}
#myChart5{
	margin: 0 auto;
	widows: 500px;
}
#myChart2{
	margin: 0 auto;
	height: 270px !important;
	width: 270px !important;
}

.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
.tdmidTable{height: 38px; text-align: center; font-size: 14px;}
.panel-heading

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
#datepicker{
	width:100px;
	border-radius: 5px;
	border: 1px solid lightgray;
	margin-left: 20px;
}    
#searchProjectBtn{
	border-radius: 5px;
	background:#1E2B44;
	color:white;
	border:none;
	font-size: 12px;
	width:40px;
	height: 20px;
	line-height: 10px;
	border: 1px solid #1E2B44;
}
</style>

</head>
<body onload="$('#route1').text('대시보드'); $('#route2').text('종합대시보드')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<div id="wrap">
	
		<div class="">
			<div class="panel-heading" style="margin-top: -20px;">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid" style="height: 350px;"><b>주요 프로젝트 현황</b>&nbsp;&nbsp;&nbsp;<i id="stop" class="far fa-stop-circle" style="color:gray; cursor: pointer;"></i>
							<label style="color:gray; font-weight:400; float:right;">more ＞</label>
							<hr style="margin-top: 5px; margin-bottom: 0px;">
							<table class="midTable2" style="width:100%;">
								<tr class="th1" style="font-weight: bold; height: 38px; background: #FAFAFA; border: 1px solid #EAEAEA;">
									<th class="thmidTable">프로젝트명</th>
									<th class="thmidTable">유형</th>
									<th class="thmidTable">등급</th>
									<th class="thmidTable">PM</th>
									<th class="thmidTable">부서</th>
									<th class="thmidTable">상태</th>
									<th class="thmidTable">시작일</th>
									<th class="thmidTable">완료일</th>
									<th class="thmidTable">계획/실적</th>
									<th class="thmidTable">이슈</th>
									<th class="thmidTable">산출물</th>
								</tr>
							<c:forEach var='d' items="${list}">
								<tr>
									<td class="tdmidTable td" style="text-align: left; padding-left: 10px;"><a href="#">${d.projectName}</a></td>
									<td class="tdmidTable td">${d.projectTypeName }</td>
									<td class="tdmidTable td">${d.projectRank }</td>
									<td class="tdmidTable td">${d.managerName }</td>
									<td class="tdmidTable td">${d.deptName }</td>
									<td class="tdmidTable td">
										<div>
											${d.status}
										</div>
									</td>
									<td class="tdmidTable td">${d.startDate}</td>
									<td class="tdmidTable td">${d.endDate}</td>
									<td class="tdmidTable td">
									<c:set var="sum" value="${(100/ d.allWork)*d.workClear}" />
									<c:if test="${(100/ d.allWork)*d.workClear != Double.NaN}">
										<label style="font-size: 7px; margin: 0px;">${sum+(1-(sum%1))%1}%</label>
									</c:if>
									<c:if test="${(100/ d.allWork)*d.workClear == Double.NaN}">
										<label style="font-size: 7px; margin: 0px;">0%</label>
									</c:if>
									
										<div class="bar-container">
										    <progress class="progressTag" value="${sum+(1-(sum%1))%1}" max="100" style="width:70px;"/>
										  </div>
									</td>
									<td class="tdmidTable td"><a href="#">${d.issue}</a></td>
									<td class="tdmidTable td"><a href="#">${d.workProduct}</a></td>
									
								</tr>
						</c:forEach>
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
								<div class="tableDiv">
									<div class="kt-portlet__body" style="overflow-y: auto; height:320px; max-height:320px;">

        <table id="deptProjectCount" class="table table-light table-light--info" style="margin-top: 10px;">
            <colgroup>
                <col class="col-md-2" style="width:34%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
            </colgroup>
            <thead>
                <tr>
                    <th style="text-align: center;">부서</th>
                    <th style="text-align: center;">시작전</th>
                    <th style="text-align: center;">진행</th>
                    <th style="text-align: center;">지연</th>
                    <th style="text-align: center;">완료</th>

                </tr>
            </thead>
            <tbody style="">
             <c:forEach var = "d" items="${dList}">
                        <tr style="background-color:#fff;">
                            <td style="padding: 10px 10px; text-align: center;">
                             ${d.deptName}
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-brand kt-badge--lg kt-badge--bold">
                                    ${d.before}
                                </span>
                                
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-nonestart kt-badge--lg kt-badge--bold">${d.proceeding }</span>
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-success kt-badge--lg kt-badge--bold">${d.delay }</span>
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-danger kt-badge--lg kt-badge--bold">${d.complete}</span>
                            </td>
                           
			                  </tr>
			               </c:forEach>         
			            </tbody>
			        </table>
			
			    </div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid" style="height:430px;">
							<div class="kt-portlet__head-toolbar">
					            <ul class="nav nav-tabs nav-tabs-line nav-tabs-bold nav-tabs-line-brand" role="tablist" style="margin-bottom: 30px;">
					            <li><b>프로젝트 현황</b>
							<input type="text" id="datepicker" value="${sysdate }">
							</li>
					                <li class="nav-item" id="chartStatus"  style="float: right;">
					                    <a class="nav-link" data-toggle="tab" href="#tabStatusChart" role="tab" aria-selected="false">
					                       유형별
					                    </a>
					                </li>
					                <li class="nav-item active" id="chartKind" style="float: right;">
					                    <a class="nav-link active" data-toggle="tab" href="#tabTypeChart" role="tab" aria-selected="false" aria-expanded="true">
					                        상태별
					                    </a>
					                </li>
					            </ul>
					        </div>	
								<div id="chartArea">
								<canvas id="myChart" width="300" height="300"></canvas>
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
							<td class="tdMid">
							   <ul class="nav nav-tabs nav-tabs-line nav-tabs-bold nav-tabs-line-brand" role="tablist" style="margin-bottom: 30px;">
					            <li><b>이슈 현황</b></li>
					                <li class="nav-item" id="issueStatus"  style="float: right;">
					                    <a class="nav-link" data-toggle="tab" href="#tabStatusChart" role="tab" aria-selected="false">
					                      구분별
					                    </a>
					                </li>
					                <li class="nav-item active" id="issueKind" style="float: right;">
					                    <a class="nav-link active" data-toggle="tab" href="#tabTypeChart" role="tab" aria-selected="false" aria-expanded="true">
					                        상태별
					                    </a>
					                </li>
					            </ul>
								<div class="chartArea2">
									<canvas id="myChart3" width="300" height="300"></canvas>
								</div>
							</td>
							
							<td class="td2"></td>
							<td class="tdMid">
							<ul class="nav nav-tabs nav-tabs-line nav-tabs-bold nav-tabs-line-brand" role="tablist" style="margin-bottom: 30px;">
					            <li><b>월별 프로젝트</b></li>
					                <li class="nav-item active" id="issueStatus" style="float: right;">
					                    <a class="nav-link active" data-toggle="tab" href="#tabTypeChart" role="tab" aria-selected="false" aria-expanded="true">
					                        등급별
					                    </a>
					                </li>
					            </ul>
								<div class="tableDiv">
									<canvas id="myChart5" width="300" height="300"></canvas>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	<script>
	$.datepicker.setDefaults({
		showOn : "button",
		buttonImage : "/manage/resources/img/calendar.png",
		buttonImageOnly : true,
		dateFormat : 'yy-mm-dd'

	});
	$(function() {
		$("#datepicker").datepicker({});
		/* 달력버튼 */
		$("img.ui-datepicker-trigger")
				.attr("style","margin-left:2px; margin-bottom:2px; vertical-align:middle; line-height:23px; cursor: Pointer; width:25px; height:25px");

	});
	
	$("#myChart2").hide();
		
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ['시작전', '진행중', '지연', '완료'],
			datasets: [{
				label: '# of Votes',
				data: ['${aList.before}', '${aList.pro}', '${aList.del}', '${aList.com}'],
				backgroundColor: [
					'#1E2B44',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'#1E2B44',
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
	
	//월별 프로젝트 차트
	var ctx = document.getElementById('myChart5');
	var myChart = new Chart(ctx, {
	    type: 'bar',
	    data: {
	        labels: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	        datasets: [{
	            label: 'SS',
	            backgroundColor: "#caf270",
	            data: [${rList.get(0).getSsCount()}, ${rList.get(1).getSsCount()}, ${rList.get(2).getSsCount()},
	            	${rList.get(3).getSsCount()}, ${rList.get(4).getSsCount()}, ${rList.get(5).getSsCount()},
	            	${rList.get(6).getSsCount()}, ${rList.get(7).getSsCount()}, ${rList.get(8).getSsCount()}, ${rList.get(9).getSsCount()},
	            	${rList.get(10).getSsCount()}, ${rList.get(11).getSsCount()}],
	        }, {
	            label: 'S',
	            backgroundColor: "#45c490",
	            data: [${rList.get(0).getsCount()}, ${rList.get(1).getsCount()}, ${rList.get(2).getsCount()},
	            	${rList.get(3).getsCount()}, ${rList.get(4).getsCount()}, ${rList.get(5).getsCount()},
	            	${rList.get(6).getsCount()}, ${rList.get(7).getsCount()}, ${rList.get(8).getsCount()}, ${rList.get(9).getsCount()},
	            	${rList.get(10).getsCount()}, ${rList.get(11).getsCount()}],
	        }, {
	            label: 'A',
	            backgroundColor: "#008d93",
	            data: [${rList.get(0).getaCount()}, ${rList.get(1).getaCount()}, ${rList.get(2).getaCount()},
	            	${rList.get(3).getaCount()}, ${rList.get(4).getaCount()}, ${rList.get(5).getaCount()},
	            	${rList.get(6).getaCount()}, ${rList.get(7).getaCount()}, ${rList.get(8).getaCount()}, ${rList.get(9).getaCount()},
	            	${rList.get(10).getaCount()}, ${rList.get(11).getaCount()}], 
	        }, {
	            label: 'B',
	            backgroundColor: "#2e5468",
	            data: [${rList.get(0).getbCount()}, ${rList.get(1).getbCount()}, ${rList.get(2).getbCount()},
	            	${rList.get(3).getbCount()}, ${rList.get(4).getbCount()}, ${rList.get(5).getbCount()},
	            	${rList.get(6).getbCount()}, ${rList.get(7).getbCount()}, ${rList.get(8).getbCount()}, ${rList.get(9).getbCount()},
	            	${rList.get(10).getbCount()}, ${rList.get(11).getbCount()}],
	        }, {
	            label: 'C',
	            backgroundColor: "#2e5468",
	            data: [${rList.get(0).getcCount()}, ${rList.get(1).getcCount()}, ${rList.get(2).getcCount()},
	            	${rList.get(3).getcCount()}, ${rList.get(4).getcCount()}, ${rList.get(5).getcCount()},
	            	${rList.get(6).getcCount()}, ${rList.get(7).getcCount()}, ${rList.get(8).getcCount()}, ${rList.get(9).getcCount()},
	            	${rList.get(10).getcCount()}, ${rList.get(11).getcCount()}],     
	        }],
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
	
	<script>
	//이슈 구분별 상태
	$("#issueStatus").click(function(){
		$("#myChart3").hide();
		$("#myChart4").remove();
		if('${iType.pro}'> 0 || '${iType.before}'>0 || '${iType.com}' > 0){
		$(".chartArea2").append("<canvas id='myChart4' style='width:300px; height:300px;'></canvas>");
		var ctx = document.getElementById('myChart4');
		var myChart = new Chart(ctx, {
			type: 'doughnut',
			data: {
				labels: ['새기능', '버그발생', '개선사항'],
				datasets: [{
					label: '# of Votes',
					data: ['${iType.pro}', '${iType.before}', '${iType.com}'],
					backgroundColor: [
						'rgba(75, 192, 192, 0.2)',
						'rgba(153, 102, 255, 0.2)',
						'rgba(255, 159, 64, 0.2)'
					],
					borderColor: [
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
		}else{
			$(".chartArea2").text("데이터가 없습니다.");
		}
	});
	
	$("#issueKind").click(function(){
		$("#myChart4").remove();
		$("#myChart3").show();
	});
	
	
	//이슈상태 차트
	if('${iList.before}'>0 || '${iList.pro}'>0 || '${iList.del}'>0|| '${iList.com}'>0){
	var ctx = document.getElementById('myChart3');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ['확인중', '조치중', '조치완료', '취소'],
			datasets: [{
				label: '# of Votes',
				data: ['${iList.before}', '${iList.pro}', '${iList.del}', '${iList.com}'],
				backgroundColor: [
					'#1E2B44',
					'rgba(54, 162, 235, 0.2)',
					'green',
					'skyblue'
				],
				borderColor: [
					'#1E2B44',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
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
	}else{
		$(".chartArea2").text("데이터가 없습니다.");
	}
	
	
	</script>
	
	<script>
		$("#chartStatus").click(function(){
			$("#myChart").hide();
			$("#myChart2").remove();
			$("#chartArea").empty();
			var date = $("#datepicker").val();
			var check = true;
			var sum = 0;
			$("#chartArea").append("<canvas id='myChart2' style='width:370px; height:370px;'></canvas>");
			
			$.ajax({ 
				url:'searchChartStatus.me',
				type: 'post',
				data:{date:date},
			 success:function(data){
				 <% for(int i = 0; i < pList.size(); i ++) {%>
					var a = data['tList'][<%=i%>]['allWork'];
					console.log(a);
					sum += a;
				<% }%>  
				if(sum >0){
				var ctx = document.getElementById('myChart2');
 					var myChart = new Chart(ctx, {
						type: 'doughnut',
						data: {
							labels: [
								<% for(int i = 0; i < pList.size(); i ++) {%>
									data['pList'][<%=i%>]['projectTypeName'],
								<% }%>  
							],
							datasets: [{
								data: [
									<% for(int i = 0; i < pList.size(); i ++) {%>
										data['tList'][<%=i%>]['allWork'],
									<% }%>   
									],
								backgroundColor: [
									'orange',
									'skyblue',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)'
								],
								borderColor: [
									'orange',
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
							legend: { display: false },
							responsive: false,
							scales: {
									ticks: {
										cutoutPercentage: 60,
										beginAtZero: true,
									}
							},
						}
					});
				}else{
					$("#chartArea").text("데이터가 없습니다");
				}
			 }
			});
		});
		
		//상태별 실시간 통계 조회
		$("#chartKind").click(function(){
			$("#chartArea").empty();
			$("#chartArea").append("<canvas id='myChart' style='width:300px; height:300px;'></canvas>");
			var date = $("#datepicker").val();
			var sum = 0;
			$.ajax({ 
				url:'searchChartKind.me',
				type: 'post',
				data:{date:date},
			 success:function(data){
				console.log("시작전 : " + data['before']);		
				var before = data['before'];
				var pro = data['pro'];
				var com = data['com'];
				var del = data['del'];
				
				if(del > 0 || com >0 || pro >0 || before >0){
					var ctx = document.getElementById('myChart');
					var myChart = new Chart(ctx, {
						type: 'doughnut',
						data: {
							labels: ['시작전', '진행중', '지연', '완료'],
							datasets: [{
								label: '# of Votes',
								data: [before, pro, del, com],
								backgroundColor: [
									'#1E2B44',
									'rgba(54, 162, 235, 0.2)',
									'rgba(255, 206, 86, 0.2)',
									'rgba(75, 192, 192, 0.2)',
									'rgba(153, 102, 255, 0.2)',
									'rgba(255, 159, 64, 0.2)'
								],
								borderColor: [
									'#1E2B44',
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
				}else{
					$("#chartArea").text("데이터가 없습니다");
				}
				 
			 	}
			});
			
			$("#myChart").show();
			
			
			
		});
	</script>
	
	<script>
		$("#datepicker").on("change", function(){
			var text = $(".nav-item.active").text();
			if($.trim(text) == '유형별'){
				$("#chartKind").trigger("click");
			}else{
				$("#chartStatus").trigger("click");
			}
		});
	</script>
	
	<script>
	 var start = 6;
	 var end = 10;
	 
	 var timer = setInterval(function(){
		 var result = projectUpdate(start, end);
		 
		 if(result <5){
			start = 1;
			end = 5;
		 }else if(result ==6){
			 start += 5;
			 end += 5;
		 }
		 
		
		 
    }, 5000)
    $(document).on('click', '#stop', function(){
    	clearInterval(timer);
    	$("#stop").css("color", "red");
    })
    
    function projectUpdate(a, b){
		var i = 1;
		 $.ajax({ 
				url:'changeAllDahboard.me',
				type: 'post',
				async: false,
				data:{start:a,
					  end:b},
			 success:function(data){
				 var th = $(".midTable2").find(".th1").html();
				 $('.midTable2 tr').not(".th1").empty();

				 for(key in data) {
					 var allWork = data[key]['allWork'];
					 var issue = data[key]['issue'];
					 var workProduct =  data[key]['workProduct'];
					 var workClear =  data[key]['workClear'];
			           //4월 17, 2020
		               var test = data[key]['startDate'];
		               var beginDateTest = test.split(/월 |, /)
		               // 4
		               var month = beginDateTest[0];
		               // 17
		               var day = beginDateTest[1];
		               // 2020
		               var year = beginDateTest[2];
		               
		               var beginDate = 0;
		               var rDay = 0;
		               
		               if(month < 10){
		                  var rMonth = "0" + month;
		                  if(day < 10){
		                     rDay = "0" + day;
		                     beginDate = year +"-"+ rMonth + "-" + rDay;
		                  }else{
		                     beginDate = year +"-"+ rMonth + "-" + day;
		                  }
		               }else{
		                  if(day < 10){
		                     rDay = "0" + day;
		                     beginDate = year +"-"+ month + "-" + rDay;
		                  }else{
		                     beginDate = year +"-"+ month + "-" + day;
		                  }
		               }
		               
		               var ctest = data[key]['endDate'];
		               var completeDateTest = ctest.split(/월 |, /)
		               
		               // 4
		               var cMonth = completeDateTest[0];
		               // 17
		               var cDay = completeDateTest[1];
		               // 2020
		               var cYear = completeDateTest[2];
		               
		               var completeDate = 0;
		               var crDay = 0;
		               
		               if(cMonth < 10){
		                  var crMonth = "0" + cMonth;
		                  if(cDay < 10){
		                     crDay = "0" + cDay;
		                     completeDate = cYear +"-"+ crMonth + "-" + crDay;
		                  }else{
		                     completeDate = cYear +"-"+ crMonth + "-" + cDay;
		                  }
		               }else{
		                  if(cDay < 10){
		                     crDay = "0" + cDay;
		                     completeDate = cYear +"-"+ cMonth + "-" + crDay;
		                  }else{
		                     completeDate = cYear +"-"+ cMonth + "-" + cDay;
		                  }
		               }
		               i++;
		               var re = (100/allWork)* workClear;
					 if(isNaN(re)){
						 re = 0;
					 }else{
					 	 re= Math.round(re/100 * 100).toFixed(0);
					 }
					 
					 $(".midTable2").append("<tr>" +
								"<td class='tdmidTable td' style='text-align: left; padding-left: 10px;'><a href='#'>"+data[key]['projectName']+"</a></td>"
								+"<td class='tdmidTable td'>"+ data[key]['projectTypeName'] +"</td>"
								+"<td class='tdmidTable td'>"+ data[key]['projectRank'] + "</td>"
								+"<td class='tdmidTable td'>"+ data[key]['managerName'] + "</td>"
								+"<td class='tdmidTable td'>"+ data[key]['deptName'] + "</td>"
								+"<td class='tdmidTable td'>"
								+  "<div>"
								+	 data[key]['status'] 
								+	"</div>"
								+"</td>" 
								+"<td class='tdmidTable td'>"+  beginDate + " </td>"
								+"<td class='tdmidTable td1'>"+ completeDate + "</td>"
					   
					    	    + "<td class='tdmidTable td'>"
					    	    + "<label style='font-size: 7px; margin: 0px;'>"+ re +"%</label>"
					    	    + "<div class='bar-container'>"
								+ "<progress class='progressTag' value='"+ (100 / allWork)* workClear +"' max='100' style='width:70px;'/></div>"
								+ "</td>" 
								+ "<td class='tdmidTable td'><a href='#''>"+ issue + "</a></td>"
								+"<td class='tdmidTable td'><a href='#'>"+ workProduct + "</a></td></tr>").fadeIn();
  				 }
			 }
		});
		 
		 return i;
	 }
	</script>
</body>
</html>