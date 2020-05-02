<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	</style>
</head>
<body onload="$('#route1').text('프로젝트 센터')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp"/>

	<div class="panel col-md-12 panel-headline">
		<%--본문 내용을 여기 안에다가 쓰기 시작해야 테두리 간격 등이 맞음.--%>
		<div class="panel-heading col-md-12">
			<div class="row">
				<div class="col-md-12">
					<div class="col-md-2 ">프로젝트 기본 정보</div>
				</div>
				<hr>
				<form enctype="multipart/form-data" id="aktivate" method="post" action="registerProject.pr">
					<!-- 주요여부 -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">주요 여부</div>
							<div class="col-md-10">
								<c:if test="${project.isImportant eq 'Y'}">
									<label for="true">주요함</label>
								</c:if>
								<c:if test="${project.isImportant eq 'N'}">
									<label for="true">주요하지 않음</label>
								</c:if>
								<%--								<input id="true" name="IS_IMPORTANT" type="radio" value="Y">--%>
								<%--								<label for="true">주요함</label> <span>&nbsp;</span>--%>
								<%--								<input checked="checked" id="false" name="IS_IMPORTANT"--%>
								<%--									   type="radio" value="N">--%>
								<%--								<label for="false">주요하지 않음</label>--%>
								<%--								<span>&nbsp;</span>--%>
							</div>
						</div>
					</div>
					<!-- project name -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">프로젝트 명</div>
							<div class="col-md-11">
								<%--<input class="form-control" type="text" name="project_name" id="project_name">--%>
								${project.projectName}
							</div>
						</div>
					</div>
					<!-- 개발형태 및 개발등급 -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">개발 형태</div>
							<div class="col-md-5">
								<%--
								<select class="form-control" name="projectType" id="projectType">
									<option value="0">선택하세요</option>
									<c:forEach var="t" items="${projectTypes}">
										<option value="${t.typePk}">${t.typeName}</option>
									</c:forEach>
								</select>
								--%>
								${project.projectTypeName}
							</div>
							<div class="col-md-1 text-align-right">개발 등급</div>
							<div class="col-md-5">
								<%--
								<select class="form-control" name="projectRank" id="projectRank">
									<option value="0">선택하세요</option>
									<option value="SS">SS</option>
									<option value="S">S</option>
									<option value="A">A</option>
									<option value="B">B</option>
									<option value="C">C</option>
								</select>
								--%>
								${project.projectRank}
							</div>
						</div>
					</div>
					<%--프로젝트 관리자 / PMO - PMO는 부서만--%>
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">프로젝트 관리자</div>
							<div class="col-md-5">
								<div class="col-md-6 short-padding">
									<%--부서 --%>
									<select onchange="changeDeptMemberList(this)" class="form-control"
											name="project_dept"
											id="project_dept">
										<option value="0">선택하세요</option>
										<c:forEach var="d" items="${deptList}">
											<c:choose>
												<c:when test="${d.highDept==null}">
													<option value="${d.deptNo}">${d.deptName}</option>
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
									</select>
								</div>
							</div>
							<div class="col-md-1 text-align-right">PMO</div>
							<div class="col-md-5">
								<select class="form-control" name="pmo" id="pmo">
									<option value="0">선택하세요</option>
									<c:forEach var="d" items="${deptList}">
										<%--
										<option value="${d.deptNo}">
											&nbsp;&nbsp;&nbsp;&nbsp;${d.deptName}</option>
										--%>
										<c:choose>
											<c:when test="${d.highDept==null}">
												<option value="${d.deptNo}">${d.deptName}</option>
											</c:when>
											<c:otherwise>
												<option value="${d.deptNo}">
													&nbsp;&nbsp;&nbsp;&nbsp;${d.deptName}</option>
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>
						</div>
					</div>
					<%--sub project managers --%>
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">서브 프로젝트 관리자</div>
							<div class="col-md-11">
								<table class="table table-striped table-bordered " id="subManager-table">
									<tr style="text-align: center;" class="mainFront">
										<th class="col-md-1"><input type="text" name="subManager" id="subManager"
																	style="display: none;"></th>
										<th class="col-md-3" style="text-align: center;">부서</th>
										<th class="col-md-2" style="text-align: center;">이름</th>
										<th class="col-md-3" style="text-align: center;">직급</th>
										<th class="col-md-3" style="text-align: center;">이메일</th>
									</tr>
									<%--<tr id="0a6e9b5d-4201-4fef-b382-5cfefe22d92e">
										<td class="highlight" style="text-align: center;">
											<input type="checkbox">
										</td>
										<td class="hidden-xs" style="text-align: center;">인프라건설팀</td>
										<td class="hidden-xs" style="text-align: center;">에코 멤버 01</td>
										<td class="hidden-xs" style="text-align: center;">에코 멤버 01</td>
										<td class="hidden-xs" style="text-align: center;">demouser@gmail.com</td>
									</tr>--%>
								</table>
								<div class="btn btn-primary" style="background: #1E2B44;" data-toggle="modal"
									 data-target="#myModal">
									<i class="fas fa-plus"></i>
									추가
								</div>
								<div class="btn" style="background: #E5E5E5;" id="memberDelete">
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
									<c:forEach var="t" items="${templateList}">
										<option value="${t.templatePk}">${t.templateName}</option>
									</c:forEach>
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
							<div class="btn btn-primary" style="background: #1E2B44;" onclick="submitForm()">
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

		<%----%>
		<div class="modal fade" id="myModal" role="dialog"
			 aria-labelledby="gridSystemModalLabel" aria-hidden="true">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<button type="button" class="close" data-dismiss="modal"
								aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
						<h4 class="modal-title" id="gridSystemModalLabel">
							<i class="fas fa-th-large"></i>&nbsp;서브 프로젝트 관리자
						</h4>
					</div>
					<div class="modal-body">
						<div class="container-fluid">
							<div class="row" style="overflow: auto;">
								<table id="projectTable" align="center" style="width:200px;">
									<tr>
										<td class="thRange th1"></td>
										<td class="thRange th1">부서</td>
										<td class="tdText thRange">이름</td>
										<td class="tdText thRange">직급</td>
										<td class="tdText thRange">이메일</td>

									</tr>
									<tr class="front">
										<td class="thRange th1" align="center"><input type="checkbox"></td>
										<td class="thRange th1">
											<select id="searchDept" class="inputCss">
												<option>선택</option>
												<c:forEach var="d" items="${deptList}">
													<c:choose>
														<c:when test="${d.highDept==null}">
															<option value="${d.deptName}">${d.deptName}</option>
														</c:when>
														<c:otherwise>
															<option value="${d.deptName}">
																&nbsp;&nbsp;&nbsp;&nbsp;${d.deptName}</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</td>
										<td class="tdText thRange"><input type="text" id="search-name"
																		  class="inputCss" style="width: 90px"></td>
										<td class="tdText thRange"><input type="text" id="search-rank"
																		  class="inputCss" style="width: 90px;"></td>
										<td class="tdText thRange"><input type="text" id="search-email"
																		  class="inputCss" style="width: 170px;"></td>
									</tr>

									<tr class="pagingArea">
										<td colspan="5">
											<div class="paging"><< < 1 2 > >></div>
										</td>
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
						<button type="button" class="btn btn-default"
								data-dismiss="modal">취소
						</button>
						<button type="button" class="btn btn-primary" id="saveBtn"
								style="background: #1E2B44; outline: none; border: none;">저장
						</button>
					</div>
				</div>
				<!-- /.modal-content -->
			</div>
			<!-- /.modal-dialog -->
		</div>
		<!-- /.modal -->

	</div>
	<script>

        // 서브매니저 모달창 목록
        var memberList = new Array();

        // 서브매니저 선택한거 제거
        $("#memberDelete").click(function () {
            $("input:checkbox[name=idCheck]:checked").filter(function () {
                $(this).parent().siblings().parent().remove();
            });
        });

        // 서브매니저 모달창 저장버튼
        $("#saveBtn").on('click', function () {
            var bool = true;
            var b = $(".trRange").siblings().find(".memberNo").val();
            $("input:checkbox[name=idCheck]:checked").filter(function () {
                var a = $(this).parent().siblings().find(".memberNo").val();
                $(".trRange1").siblings().find(".memberNo").each(function () {
                    if ($(this).val() == a) {
                        bool = false;
                    }
                });

                if (bool) {
                    for (key in list) {
                        // 추가할 인원중에 이미 관리자로 되있는 사람은 배제.
                        if ($("#project_manager").val() == list[key]['memberNo']) {
                            continue;
                        }

                        if (list[key]['memberNo'] == a) {
                            let isOverlapped = false;
                            // 목록에 중복된거 있나 확인 있으면 추가 안됨
                            for (let i = 0; i < $(".trRange1 input[class=memberNo]").length; i++) {
                                if (list[key]['memberNo'] == $(".trRange1 input[class=memberNo]").val()) {
                                    isOverlapped = true;
                                }
                            }
                            if (isOverlapped) {
                                continue;
                            }
                            $(".mainFront").
                                after(
                                    "<tr class='trRange1'> <td class='td1'><input type='checkbox' id='idCheckMain' name='idCheck' class='inputCss' style='width: 30px;'></td> <td class='td1'>" +
                                    list[key]['deptName'] + "</td> <td class='tdText'>" + list[key]['memberName'] +
                                    "</td> <td class='tdText memberTd'>" + list[key]['rankNo'] +
                                    "<input type='hidden' id='memberNo' name='memberNo' class='memberNo' value='" +
                                    list[key]['memberNo'] + "'></td> <td class='tdText'>" + list[key]['email'] +
                                    "</td> </tr>");
                            memberList = list[key]['memberNo'];
                        }
                    }
                }

            });
            if (!bool) {
                alert("이미 들어간 회원입니다!")
            } else {
                $('#myModal').modal('hide');
            }

        });

        // \admin\accessManage\accessDetail.jsp 에서 그대로 긁어왔음. 똑같이 써도됨.
        // 부서에 따라 인원을 뽑아온다.
        var list;
        $("#searchDept").on("change", function () {
            var name = $(this).val();
            if (name == " ") {
                name = null;
            }
            $.ajax({
                url: 'searchDeptMember.am',
                type: 'post',
                data: { deptName: name },
                success: function (data) {
                    list = data;
                    if (data != "") {
                        $(".trRange").empty();
                        for (key in data) {
                            $(".front").
                                after(
                                    "<tr class='trRange'> <td class='td1'><input type='checkbox' id='idCheck' name='idCheck' class='inputCss' style='width: 30px;'></td> <td class='td1'>" +
                                    data[key]['deptName'] + "</td> <td class='tdText'>" + data[key]['memberName'] +
                                    "</td> <td class='tdText'>" + data[key]['rankNo'] +
                                    "<input type='hidden' id='memberNo' class='memberNo' value='" +
                                    data[key]['memberNo'] + "'></td> <td class='tdText'>" + data[key]['email'] +
                                    "</td> </tr>");
                        }
                    } else {
                        $(".trRange").empty();
                    }
                }
            });
        });
        function changeDeptMemberList (val) {
            console.log(val);
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

        // 위와 동일한 역할을 하지만 초기에
        function changeDeptMemberListInit (val) {
            console.log(val);
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
	</script>
</body>
</html>
