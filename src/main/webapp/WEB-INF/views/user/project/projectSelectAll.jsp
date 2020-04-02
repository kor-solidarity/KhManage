<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#projectTable{
		width:100%;
		text-align:left;
	}
	.projectBtn{
		width:140px;
		height:30px;
		border:none;
		background:#1E2B44;
		color:white;
		font-weight:600;
		border-radius: 5px;
		margin-right:6px;
	}
</style>
</head>
<body onload="$('#route1').text('프로젝트 센터')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:1250px; height:300px; margin:0 auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><button class="projectBtn"><i class="fas fa-edit"></i> &nbsp;프로젝트 등록</button>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td colspan="8"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<label>수행부서 : </label>
									<select>
										<option>선택하세요</option>
									</select>
								</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td>프로젝트</td>
								<td>개발형태</td>
								<td>PM</td>
								<td>담당부서</td>
								<td>진행상태</td>
								<td>시작일</td>
								<td>완료일</td>
								<td>실적</td>
								<td>산출물</td>
								<td>이슈</td>
							</tr>
							
						</table>
					
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>