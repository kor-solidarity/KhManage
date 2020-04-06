<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<style>
		#projectTable {
			width: 100%;
			text-align: left;
		}

		.projectBtn {
			width: 130px;
			height: 27px;
			border: none;
			background: #1E2B44;
			color: white;
			font-weight: 600;
			border-radius: 5px;
			margin-right: 6px;
			font-size: 14px;
		}

		.tdText {
			text-align: center;
			height: 30px;
			font-size: 14px;
		}

		.thRange {
			background: #F3F3F3;
			color: #626262;
			font-size: 15px;
			border: #B0B0B0 1px solid;
			height: 35px;
			padding: 3px;
		}

		.th1 {
			width: 220px;
			text-indent: 5px;
		}

		.td1 {
			text-indent: 5px;
			color: #71A8D7;
		}

		.trRange {
			border: 1px solid #B0B0B0;
			width: 30px;
		}

		.inputCss {
			border-radius: 5px;
			border: none;
		}

		.buseoSelect {
			width: 180px;
			border: 1px solid #626262;
			height: 25px;
			border-radius: 5px;
		}
	</style>
</head>
<body onload="$('#route1').text('프로젝트')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
				<table align="left" style="margin-bottom:10px;">
					<tr>
						<td>
							<button class="projectBtn"
									onclick="location.href = '${ pageContext.servletContext.contextPath }/projectRegister.pr'">
								<i class="fas fa-edit"></i> &nbsp;프로젝트 등록
							</button>
						<td>
							<button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
						<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<label style="color:#626262">수행부서 </label>&nbsp;&nbsp;
							<select class="buseoSelect">
								<option>선택하세요</option>
							</select>
						</td>
					</tr>
				</table>
				<table id="projectTable" align="center">
					<tr>
						<td class="thRange th1">프로젝트</td>
						<td class="tdText thRange">개발형태</td>
						<td class="tdText thRange">PM</td>
						<td class="tdText thRange">담당부서</td>
						<td class="tdText thRange">진행상태</td>
						<td class="tdText thRange">시작일</td>
						<td class="tdText thRange">완료일</td>
						<td class="tdText thRange">실적</td>
						<td class="tdText thRange">산출물</td>
						<td class="tdText thRange">이슈</td>
					</tr>
					<tr>
						<td class="thRange th1"><input type="text" class="inputCss" style="width:200px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss"
														  style="visibility:hidden; width:70px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss"
														  style="visibility:hidden; width:60px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss"
														  style="visibility:hidden; width:60px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss"
														  style="visibility:hidden; width:50px;"></td>
					</tr>


					<tr class="trRange">
						<td class="td1" onclick="viewProject(0)">KH대학교 학사시스템 개발</td>
						<td class="tdText">SW개발</td>
						<td class="tdText">김태원</td>
						<td class="tdText">개발1부서</td>
						<td class="tdText">시작전</td>
						<td class="tdText">20.04.02</td>
						<td class="tdText">20.05.12</td>
						<td class="tdText">10%</td>
						<td class="tdText">0</td>
						<td class="tdText">0</td>
					</tr>

				</table>

			</div>
		</div>
	</div>
	<script>

        /* 프로젝트 생성창으로 보내버린다. */
        function gotoProjectCreate () {
            location.href = '${ pageContext.servletContext.contextPath }/projectRegister.pr';
        }

        /**
         * 프로젝트 내용 조회
         *
         * @param num 프로젝트 번호
         */
        function viewProject (num) {
            // num 은 지금은 안쓰고 실제 코드를 짜기 시작할때 넣는걸로
            location.href = '${ pageContext.servletContext.contextPath }/viewProject.pr';
        }
	</script>
</body>
</html>