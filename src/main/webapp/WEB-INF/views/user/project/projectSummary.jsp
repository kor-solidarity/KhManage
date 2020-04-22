<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
		width:180px;
		margin-left: 30px;
	}
	.tdValue{
		width:140px;
		font-size: 14px;
		color: #666666;
	}
	.titleName{
		color:#5E738B;
		font-size: 14px;
	}
</style>
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
							<td class="titleName">프로젝트 명</td>
							<td class="tdValue" colspan="3">${project.projectName}</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleName">프로젝트 번호</td>
							<td class="tdValue" colspan="3">${project.projectPk }</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleName">개발 형태</td>
							<td class="tdValue">${project.projectTypeName }</td>
							<td class="titleName">개발 등급</td>
							<td class="tdValue">${project.projectRank }</td>
						</tr>
						<tr height="10px;"></tr>
						<tr>
							<td class="titleName">PMO</td>
							<td class="tdValue">${project.deptName}</td>
							<td class="titleName">PM</td>
							<td class="tdValue">${project.managerName}</td>
						</tr>
						<tr height="15px;"></tr>
						<tr>
							<td class="titleName">설명</td>
							<td class="tdValue" colspan="3">${project.detail}</td>
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
</body>
</html>