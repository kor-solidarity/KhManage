<%--
  Created by IntelliJ IDEA.
  User: SOY
  Date: 2020-04-03
  Time: 오후 5:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<html>
<head>
	<title>Title</title>
	<style type="text/css">
		.row {
			/*margin-top: 5px;*/
			margin-bottom: 10px;
		}

		.text-align-right {
			text-align: right;
			vertical-align: middle;
		}

		.short-padding {
			padding-right: 5px !important;
			padding-left: 5px !important;
		}

		.table-advance {
			margin-bottom: 10px !important;
		}

		.btn-blue {

		}
	</style>
</head>
<body onload="$('#route1').text('프로젝트 등록')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<div class="panel col-md-12 panel-headline">
		<%--본문 내용을 여기 안에다가 쓰기 시작해야 테두리 간격 등이 맞음.--%>
		<div class="panel-heading col-md-12"><!--
			<table style="width: 100%; border-bottom: 1px solid gray">
				<tr>
					<td style="padding-bottom: 10px;">프로젝트 등록 정보</td>
				</tr>
			</table> -->
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-2 ">프로젝트 등록 정보</div>
				</div>
			</div>
			<hr>
			<form>
				<!-- 주요여부 -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">주요 여부</div>
						<div class="col-md-10">
							<input id="true" name="IS_IMPORTANT" type="radio" value="True">
							<label for="true">주요함</label> <span>&nbsp;</span> <input
								checked="checked" id="false" name="IS_IMPORTANT" type="radio"
								value="False"> <label for="false">주요하지 않음</label> <span>&nbsp;</span>
						</div>
					</div>
				</div>
				<!-- project name -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">프로젝트 명</div>
						<div class="col-md-11">
							<input class="form-control">
						</div>
					</div>
				</div>
				<!-- 개발형태 및 개발등급 -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">개발 형태</div>
						<div class="col-md-5">
							<select class="form-control" name="dev_form" id="dev_form">
								<option value="0">선택하세요</option>
								<option value="0">선택하세요</option>
								<option value="0">선택하세요</option>
							</select>
						</div>
						<div class="col-md-1 text-align-right">개발 등급</div>
						<div class="col-md-5">
							<select class="form-control" name="dev_class" id="dev_class">
								<option value="0">선택하세요</option>
								<option value="0">선택하세요</option>
								<option value="0">선택하세요</option>
							</select>
						</div>
					</div>
				</div>
				<%--프로젝트 관리자 / PMO--%>
				<%--PMO는 부서만.--%>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">프로젝트 관리자</div>
						<div class="col-md-5">
							<div class="col-md-6 short-padding">
								<select class="form-control" name="project_manager" id="project_manager">
									<option value="0">선택하세요</option>
									<option value="0">부서1</option>
									<option value="0">부서2</option>
								</select>
							</div>
							<div class="col-md-6 short-padding">
								<select class="form-control" name="project_dept" id="project_dept">
									<option value="0">선택하세요</option>
									<option value="0">누구1</option>
									<option value="0">누구2</option>
								</select>
							</div>
						</div>
						<div class="col-md-1 text-align-right">PMO</div>
						<div class="col-md-5">
							<select class="form-control" name="dev-class" id="dev-class">
								<option value="0">선택하세요</option>
								<option value="0">부서1</option>
								<option value="0">부서2</option>
							</select>
						</div>
					</div>
				</div>
				<%--sub project managers --%>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">서브 프로젝트 관리자</div>
						<div class="col-md-11">
							<table class="table table-striped <%--table-bordered--%> ">
								<tr style="text-align: center;">
									<th class="col-md-1"></th>
									<th class="col-md-3" style="text-align: center;">부서</th>
									<th class="col-md-2" style="text-align: center;">이름</th>
									<th class="col-md-3" style="text-align: center;">직급</th>
									<th class="col-md-3" style="text-align: center;">이메일</th>
								</tr>
								<tr id="0a6e9b5d-4201-4fef-b382-5cfefe22d92e">
									<td class="highlight" style="text-align: center;">
										<input type="checkbox">
									</td>
									<td class="hidden-xs" style="text-align: center;">인프라건설팀</td>
									<td class="hidden-xs" style="text-align: center;">에코 멤버 01</td>
									<td class="hidden-xs" style="text-align: center;">에코 멤버 01</td>
									<td class="hidden-xs" style="text-align: center;">demouser@gmail.com</td>
								</tr>
							</table>
							<div class="btn btn-primary">
								<i class="fas fa-plus"></i>
								추가
							</div>
							<div class="btn btn-danger">
								<i class="fas fa-minus"></i>
								제거
							</div>
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
</body>
</html>