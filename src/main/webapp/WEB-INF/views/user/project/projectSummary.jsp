<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*, com.kh.manage.forum.model.vo.*"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  	
<%
	List<Statistics> list3 = (ArrayList<Statistics>) request.getAttribute("list3"); 
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.titleText{
		color:#5E738B; 
		font-weight:600;
		padding-left: 25px;
		padding-top: 10px;
	}
	.titleName{
		width:130px;
		margin-left: 30px;
		font-weight: 600;
	}
	.tdValue{
		width:100px;
		font-size: 14px;
		color: #666666;
		text-align: center;
	}
	.titleName{
		color:#5E738B;
		font-size: 14px;
		text-align: center;
	}
	#chartArea1{
		text-align: center;
	}
	.history{
		width:70px;
		height:20px;
		border:1px solid lightgray;
		border-radius: 5px;
		font-size: 12px;
	}
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
</head>
<body onload="$('#route1').text('프로젝트 센터')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp" />


	<div class="panel panel-headline" style="background: #F5F5FA;">
		<div class="panel-heading" style="margin-left: 40px; margin-top: 10px;">
			<div style="width: 47%; height: 360px; margin: 0 auto; background:white; overflow: auto; display: inline-block;">
				<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">프로젝트 정보 &nbsp;&nbsp;
							<button class="history">히스토리</button>
						</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 5px;"></div></td>
						</tr>
						<tr height="10px;"></tr>
					</table>
					<table class="menuTable" align="center" style="width:90%;">
						<tr>
							<td class="tdValue" colspan="3" style="font-size:20px; text-align: left;">${project.projectName}</td>
						</tr>
						<tr height="30px;"></tr>
						<tr>
							<td class="titleName">시작일</td>
							<td class="titleName">종료일</td>
							<td></td>
							<td class="titleName" style="width: 200px;">진행율</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="tdValue"><div style="background:skyblue; width:80px; height:30px; border-radius:10px; line-height:30px; color:white; text-align: center; margin: 0 auto;">${project.startDate}</div></td>
							<td class="tdValue"><div style="background:pink; width:80px; height:30px; border-radius:10px; line-height:30px; color:white; text-align: center; margin: 0 auto;">${project.endDate}</div></td>
							<td style="width: 30px;"></td>
							<td class="tdValue">
								 <div class="w3-light-grey w3-round-xlarge">
								 <c:set var="sum" value="${(100/ project.allWork)*project.workClear}" />
								   <c:if test="${project.workClear >0 }">
								    <div class="w3-container w3-blue w3-round-xlarge" style="width: ${(100/project.allWork)* project.workClear}%; background:#1E2B44 !important;">${sum+(1-(sum%1))%1}%</div>
								    </c:if>
								    <c:if test="${project.workClear ==0 }">
								    <div class="w3-container w3-blue w3-round-xlarge" style="background: #EEEEEE !important;">0%</div>
								    </c:if>
								  </div>
							</td>
						</tr>
						<c:if test="${loginUser.memberNo eq project.projectManager }">
						<tr>
							<c:if test="${sum+(1-(sum%1))%1 < 100  and project.status != '개발완료' and project.status != '납품완료' }">
								<td class="tdValue" colspan="4" ><button type="button" style="float:right; background:lightgray; border-radius: 5px; border:1px solid lightgray; outline:none; color:white;">완료</button></td>
							</c:if>
							<c:if test="${sum+(1-(sum%1))%1 eq 100 and project.status != '개발완료' and project.status != '납품완료' }">
								<td class="tdValue" colspan="4" ><button type="button" id="projectComplete" style="float:right; background:skyblue; border-radius: 5px; border:2px solid #1E2B44; outline:none; color:#1E2B44; ">완료</button></td>
							</c:if>
							<c:if test="${project.status == '개발완료' }">
								<td class="tdValue" colspan="4" style="text-align: right; color:#1E2B44;"><i class="fas fa-exclamation-circle"></i> &nbsp;납품 대기 중 입니다</td>
							</c:if>
							<c:if test="${project.status == '납품완료' }">
								<td class="tdValue" colspan="4" style="text-align: right; color:#1E2B44;"><i class="fas fa-exclamation-circle"></i> &nbsp;납품완료 된 프로젝트입니다</td>
							</c:if>
						</tr>
						</c:if>
						<tr height="50px;"></tr>
						<tr>
							<td class="titleName" style="font-size: 16px;">PM</td>
							<td class="titleName" style="font-size: 16px;">개발형태</td>
							<td></td>
							<td class="titleName" style="width: 200px; font-size: 16px;">담당부서</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="tdValue">${project.managerName}</td>
							<td class="tdValue">${project.projectTypeName }(${project.projectRank })</td>
							<td></td>
							<td class="tdValue" style="width: 200px;">${project.deptName }</td>
						</tr>
					</table>
					
			</div>
			<div style="width: 47%; height: 360px; margin: 0 auto; margin-left:30px; background:white; overflow: auto; display: inline-block;">
				<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">프로젝트 진행상태</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr height="20px;"></tr>
					</table>
					<div id="chartArea" style="margin: 0 auto;">
						<canvas id="myChart" width="250" height="250" style="margin: 0 auto;"></canvas>
					</div>
			</div>
			
			<div style="width: 47%; height: 360px; margin: 0 auto; background:white; overflow: auto; display: inline-block; margin-top: 30px;">
				<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">이슈현황</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr height="20px;"></tr>
					</table>
					<div id="chartArea1" style="margin: 0 auto;">
						<canvas id="myChart2" width="250" height="250" style="margin: 0 auto;"></canvas>
					</div>
			</div>
			<div style="width: 47%; height: 360px; margin: 0 auto; margin-left:30px; background:white; overflow: auto; display: inline-block;">
				<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">변경요청</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 90%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr height="20px;"></tr>
					</table>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal" role="dialog"
		aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content" style="width:900px;"> 
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
					<h4 class="modal-title" id="gridSystemModalLabel">
						<i class="far fa-list-alt"></i>&nbsp;프로젝트 히스토리
					</h4>
				</div>
				<div class="modal-body" style="overflow: auto;">
					<div class="container-fluid" style="overflow: auto;">
						<div class="row"  style="overflow: auto; height: 500px;">
							<table class="menuTable" style="width: 100%;">
						
						<tr height="20px;"></tr>
						 <c:forEach var="h" items="${hList}">
							<c:if test="${h.type != '프로젝트'}">
								<c:if test="${h.type == '납품완료'}">
								<tr>
									<td style="text-align: left;  color:#1E2B44; padding-left: 40px; color:purple;"><label>『${project.projectName}』</label>프로젝트를 『${loginUser.memberName}』(PMS관리팀)님께서 납품완료 처리 하셨습니다. - ${h.date}</td> 
								</tr>	
								<tr height="8px;"></tr>	
								</c:if>
								<c:if test="${h.type == '개발완료'}">
								<tr>
									<td style="text-align: left;  color:#1E2B44; padding-left: 40px; color:purple;"><label>『${project.projectName}』</label>프로젝트를 『${project.managerName}』PM님께서 개발완료 처리 하셨습니다. - ${h.date}</td> 
								</tr>	
								<tr height="8px;"></tr>	
								</c:if>
								<c:if test="${h.status == '조치완료'}">
								<tr>
									<td style="text-align: left;  color:#1E2B44; padding-left: 40px; color:green;"><label>『${h.historyName}』</label>작업에 대한 『${h.type}』이슈가 조치 완료 되었습니다. - ${h.date}</td> 
								</tr>	
								<tr height="8px;"></tr>	
								</c:if>
								<c:if test="${h.status == '확인중'}">
								<tr>	
									<td style="text-align: left; color:#1E2B44; padding-left: 40px; color:green;"><label>『${h.historyName}』</label>작업에 대한 『${h.type}』이슈가 등록되었습니다. - ${h.date}</td> 
								</tr>	
								<tr height="8px;"></tr>	
								</c:if>
							</c:if>
							<c:if test="${h.type == '프로젝트'}">
								<c:if test="${h.status == '시작전'}">
								<tr>
									<td style="text-align: left; color:#1E2B44; padding-left: 40px; color:orange;"><label>『${h.historyName}』</label>작업을 <label style="color:#1E2B44;">${h.name}</label>님께서 개발을 시작하셨습니다. - ${h.date}</td> 
								</tr>
								<tr height="8px;"></tr>	
								</c:if>	
								<c:if test="${h.status == 'PL승인완료'}">
								<tr>
									<td style="text-align: left; color:#1E2B44; padding-left: 40px; color:orange;"><label>『${h.historyName}』</label>작업을 <label style="color:#1E2B44;">${h.name}</label>님께서 개발을 완료하였습니다. - ${h.date}</td> 
								</tr>
								<tr height="8px;"></tr>	
								</c:if>	
							</c:if>
							</c:forEach>
							<tr>
							<td style="text-align: left;  color:#1E2B44; padding-left: 40px; color:purple;"><label>『${project.projectName}』</label>을(를) 등록 하였습니다. - ${enrollDate}</td> 
						</tr>
					</table>
						</div>
						<div class="row">
							<div class="col-sm-9">
								<div class="row"></div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">확인</button>
				</div>
			</div>
			<!-- /.modal-content -->
		</div>
		<!-- /.modal-dialog -->
	</div>
	
	
	<script>
		$("#projectComplete").click(function(){
			swal({
				  title: "개발 완료 하시겠습니까?",
				  icon: "warning",
				  buttons: ["취소", "완료"],
				  dangerMode: true,
				})
				.then((willDelete) => {
				  if (willDelete) {
				    swal({
				    	title: "개발 완료!",
				      	icon: "success"
				    }).then((value) => {	// 애니메이션 V 나오는 부분!
				    	location.href='projectComplete.pr?pid='+'${pid}';			
				    });
				  } else {
					  swal({
					  	title: "취소 하셨습니다.",
					    icon: "error"
					  });
				  }
			});
			
		});
	</script>
	
	<script type="text/javascript">
	var num = '${project.allWork}';
	
	if(num > 0){
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: ['잔여작업', '완료작업'],
			datasets: [{
				label: '# of Votes',
				data: ['${project.allWork - project.workClear}', '${project.workClear}'],
				backgroundColor: [
					'rgba(54, 162, 235, 0.2)',
					'#1E2B44',
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
		$("#chartArea").text("등록된 작업이 없습니다");
		$("#chartArea").css("text-align", 'center');
	}
	</script>
	<script>
	var ctx = document.getElementById('myChart2');
	
	<% if(list3.size() > 0){ %>
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: [
				<%for (int i = 0; i < list3.size(); i++) {
					Statistics st = (Statistics) list3.get(i);%> 
					'<%=st.getIssueType()%>',
				<%}%>
			],
			datasets: [{
				label: '# of Votes',
				data: [
					<%for (int i = 0; i < list3.size(); i++) {
						Statistics st = (Statistics) list3.get(i);%> 
						<%=st.getCnt2()%>,
					<%}%>	
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
				borderWidth: 1
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
	<% }else {%>  
		$("#chartArea1").text("데이터가 없습니다.");
	
	<%}%>	 
	</script>
	
	<script>
	$(".history").click(function(){
		$('#myModal').modal('show');
	})
	</script>
</body>
</html>