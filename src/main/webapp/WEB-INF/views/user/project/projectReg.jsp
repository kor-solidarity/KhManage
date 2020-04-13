<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--프로젝트 등록 페이지--%>
<html>
<head>
	<title>Title</title>
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/css/bootstrap-datepicker.min.css">
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
							<input class="form-control" type="text" name="project_name" id="project_name">
						</div>
					</div>
				</div>
				<!-- 개발형태 및 개발등급 -->
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">개발 형태</div>
						<div class="col-md-5">
							<select class="form-control" name="dev_form" id="dev_form">
								<c:forEach var="t" items="${projectTypes}">
									<option value="${t.typePk}">${t.typeName}</option>
								</c:forEach>
							</select>
						</div>
						<div class="col-md-1 text-align-right">개발 등급</div>
						<div class="col-md-5">
							<select class="form-control" name="dev_class" id="dev_class">
								<option value="0">선택하세요</option>
								<option value="SS">SS</option>
								<option value="S">S</option>
								<option value="A">A</option>
								<option value="B">B</option>
								<option value="C">C</option>
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
								<%--부서 --%>
								<select onchange="changeDeptMemberList()" class="form-control" name="project_dept"
										id="project_dept">
									<option value="0">선택하세요</option>
									<c:forEach var="d" items="${deptList}">
										<c:choose>
											<c:when test="${d.highDept==nul}">
												<option value="0">${d.deptName}</option>
											</c:when>
											<c:otherwise>
												<option value="${d.deptNo}">
													&nbsp;&nbsp;&nbsp;&nbsp;${d.deptName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
							<div class="col-md-6 short-padding">
								<select class="form-control" name="project_manager" id="project_manager">
									<option value="0">선택하세요</option>
									<option value="1">누구1</option>
									<option value="2">누구2</option>
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
							<table class="table table-striped table-bordered ">
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
							<div class="btn btn-primary" style="background: #1E2B44;">
								<i class="fas fa-plus"></i>
								추가
							</div>
							<div class="btn" style="background: #E5E5E5;">
								<i class="fas fa-minus"></i>
								제거
							</div>
						</div>
					</div>
				</div>
				<%--project template and date--%>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">프로젝트 템플릿</div>
						<div class="col-md-5">
							<select class="form-control" name="project_template" id="project_template">
								<option value="0">선택하세요</option>
								<option value="0">선행개발</option>
								<option value="0">이것저것</option>
							</select>
						</div>
						<div class="col-md-1 text-align-right">프로젝트 시작일</div>
						<div class="col-md-2 text-align-right">
							<%--<input type="date" class="" name="" id="">--%>
							<div class="form-group">
								<%--								<div class='input-group date' id='datetimepicker1'>--%>
								<%--									<input type='text' class="form-control"/>--%>
								<%--									<span class="input-group-addon">--%>
								<%--										<span class="glyphicon glyphicon-calendar"></span>--%>
								<%--									</span>--%>
								<%--								</div>--%>
								<%--							</div>--%>
								<input type="date" name="startDate" id="startDate">
							</div>
						</div>
						<div class="col-md-1 text-align-right">프로젝트 종료일</div>
						<div class="col-md-2 text-align-right">
							<%--<input type="date" class="" name="" id="">--%>
							<div class="form-group">
								<input type="date" name="endDate" id="endDate">
							</div>
						</div>
					</div>
				</div>
				<%--project excel--%>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">프로젝트 엑셀</div>
						<div class="col-md-5">
							<input type="file" name="project_excel" id="project_excel">
							<span style="padding-top: 10px">Excel, Xml 파일 업로드 가능</span>
						</div>
						<div class="col-md-1 text-align-right">엑셀 템플릿</div>
					</div>
				</div>
				<%--project details--%>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">프로젝트 설명</div>
						<div class="col-md-11">
							<textarea class="form-control" type="text" name="project_details" id="project_details"
									  rows="5"></textarea>
						</div>
					</div>
				</div>
				<br>
				<div class="row">
					<div class="col-md-12">
						<div class="btn btn-primary" style="background: #1E2B44;" onclick="alert('boo');">
							<i class="fas fa-check"></i>
							프로젝트 저장
						</div>
						<div class="btn" style="background: #E5E5E5;">
							<i class="fas fa-undo"></i>
							취소
						</div>
					</div>
				</div>
			</form>
		</div>
	</div>
	<script>

        function changeDeptMemberList () {
            // 우선 다 초기화
            $("#project_manager option:not([value='0'])").remove();
            // 부서의 값이 몇인지 확인한다.
            // 0이면 아무것도 선택된게 아님
            if ($("#project_dept option:selected").val() !== '0') {
                console.log('$("#project_dept option:selected").val(): '
                    + $("#project_dept option:selected").val());
                $.ajax({
                    url: '${path}/getMemberFromDept.pr',
                    type: 'post',
                    data: { deptNo: $("#project_dept option:selected").val() },
                    success: function (data) {
                        list = data;

                        for (m in data) {
                            $("#project_manager").
                                append("<option value=" + data[m]['memberNo'] + ">" +
                                    data[m]['memberName'] + "</option>");
                        }
                    }
                });

            }
        }

        $

	</script>
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
</body>
</html>
