<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>  	
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
</style>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
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
							<td class="titleText" colspan="2">프로젝트 정보</td>
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
							<td class="tdValue"><div style="background:skyblue; width:55%; height:30px; border-radius:10px; line-height:30px; color:white; text-align: center; margin: 0 auto;">${project.startDate}</div></td>
							<td class="tdValue"><div style="background:pink; width:55%; height:30px; border-radius:10px; line-height:30px; color:white; text-align: center; margin: 0 auto;">${project.endDate}</div></td>
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
						<tr>
							<c:if test="${sum+(1-(sum%1))%1 eq 100 and project.status != '완료' }">
								<td class="tdValue" colspan="4" ><button type="button" id="projectComplete" style="float:right; background:skyblue; border-radius: 5px; border:2px solid #1E2B44; outline:none; color:#1E2B44; ">완료</button></td>
							</c:if>
							<c:if test="${sum+(1-(sum%1))%1 < 100  and project.status != '완료' }">
								<td class="tdValue" colspan="4" ><button type="button" style="float:right; background:lightgray; border-radius: 5px; border:1px solid lightgray; outline:none; color:white;">완료</button></td>
							</c:if>
							<c:if test="${project.status == '완료' }">
								<td class="tdValue" colspan="4" style="text-align: right; color:#1E2B44;"><i class="fas fa-exclamation-circle"></i> &nbsp;개발완료 된 프로젝트입니다</td>
							</c:if>
						</tr>
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
</body>
</html>