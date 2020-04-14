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

		.modal-dialog {
			top: 20%;
			width: 650px !important;
		}

		/*서브관리자 모달창 내 테이블*/
		.sub-manager-table {

		}

		.sub-manager-table tr:first-of-type {
			width: 20px;
			min-height: 20px;
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
			width: 30px;
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

		.trRange1 {
			border: 1px solid #B0B0B0;
			width: 30px;
		}
	</style>
</head>
<body onload="$('#route1').text('프로젝트 등록')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<div class="panel col-md-12 panel-headline">
		<%--본문 내용을 여기 안에다가 쓰기 시작해야 테두리 간격 등이 맞음.--%>
		<div class="panel-heading col-md-12">
			<!--
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
			<form enctype="multipart/form-data" id="aktivate" method="post" action="registerProject.pr">
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
								<option value="0">선택하세요</option>
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
				<%--프로젝트 관리자 / PMO - PMO는 부서만--%>
				<div class="row">
					<div class="col-md-12">
						<div class="col-md-1 text-align-right">프로젝트 관리자</div>
						<div class="col-md-5">
							<div class="col-md-6 short-padding">
								<%--부서 --%>
								<select onchange="changeDeptMemberList(this)" class="form-control" name="project_dept"
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
									<option value="${d.deptNo}">
										&nbsp;&nbsp;&nbsp;&nbsp;${d.deptName}</option>
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
							<table class="table table-striped table-bordered ">
								<tr style="text-align: center;" class="mainFront">
									<th class="col-md-1"></th>
									<th class="col-md-3" style="text-align: center;">부서</th>
									<th class="col-md-2" style="text-align: center;">이름</th>
									<th class="col-md-3" style="text-align: center;">직급</th>
									<th class="col-md-3" style="text-align: center;">이메일</th>
								</tr>
								<tr id="0a6e9b5d-4201-4fef-b382-5cfefe22d92e">
									<%--<td class="highlight" style="text-align: center;">
										<input type="checkbox">
									</td>
									<td class="hidden-xs" style="text-align: center;">인프라건설팀</td>
									<td class="hidden-xs" style="text-align: center;">에코 멤버 01</td>
									<td class="hidden-xs" style="text-align: center;">에코 멤버 01</td>
									<td class="hidden-xs" style="text-align: center;">demouser@gmail.com</td>--%>
								</tr>
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
						<div class="btn btn-primary" style="background: #1E2B44;" onclick="submit()">
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

	<script>
        function submit () {
            // 하나하나 값들이 있는지 확인해보는거임.
            let regSpace = /\S/g;

            // 날짜확인용도
            let dateBool = false;
            var startDate = Date.parse($("#startDate").val());
            var endDate = Date.parse($("#endDate").val());
            var proExcel = $("#project_excel");
            // 우선 제목. 공백 말고 뭐가 있는지 확인
            if ($("#project_name").val().match(regSpace) == null) {
                alert("프로젝트 명을 쓰세요");
            } else if ($("#dev_form").val() == 0) {
                // 개발 형태가 0인 경우 - 선택 안했다는 소리
                alert('프로젝트 형태를 선택해주세요');
            } else if ($("#dev_class").val() == 0) {
                // 개발등급도 매한가지.
                alert('개발등급을 선택해주세요');
            } else if ($("#project_manager").val() == 0) {
                // 프로젝트 관리자
                alert('프로젝트 관리자를 정해주세요');
            } else if ($("#pmo").val() == 0) {
                // PMO
                alert('PMO를 정해주세요');
            }
                // 템플릿은 필수가 아닌듯 함.
            /*else if ($("#project_template").val() == 0) {
                // 프로젝트 템플릿
                alert('프로젝트 템플릿을 정해주세요');
            }*/
            else if (($("#startDate").val() === "" || $("#endDate").val() === "") ||
                (endDate < startDate)) {
                /*날짜값이 없거나 종료일이 시작일보다 빠르면 에러*/
                alert("시작·종료일자를 제대로 써주세요. 종료일자는 시작일자와 같거나 이후여야 합니다.");
            } else if ($("#project_excel").val() !== "" && !($("#project_excel").val().split('.').pop() == 'xml' ||
                $("#project_excel").val().split('.').pop() == 'xlsx')) {
                // 첨부된 파일이 있고 확장자가 엑셀 또는 xml이 아닌 경우
                alert('올바른 엑셀 파일이 아닙니다. xml 또는 xlsx 파일만 넣어주세요.');
                $("#project_excel").val("");
            } else if ($("#project_details").val().match(regSpace) == null){
                alert("프로젝트 설명이 비었습니다.");
                $("#project_details").focus();
			}else {
                // 확인 후 삭제
                alert('문제 없음.');
                $("#aktivate").submit();
			}


        }

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
                        if (list[key]['memberNo'] == a) {
                            $(".mainFront").
                                after(
                                    "<tr class='trRange1'> <td class='td1'><input type='checkbox' id='idCheckMain' name='idCheck' class='inputCss' style='width: 30px;'></td> <td class='td1'>" +
                                    list[key]['deptName'] + "</td> <td class='tdText'>" + list[key]['memberName'] +
                                    "</td> <td class='tdText'>" + list[key]['rankNo'] +
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

        $

	</script>
	<link rel="stylesheet"
		  href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js">
</body>
</html>
