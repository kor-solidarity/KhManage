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
				<form enctype="multipart/form-data" id="aktivate" method="post" action="updateProject.pr">
					<!-- 주요여부 -->
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">주요 여부</div>
							<div class="col-md-10">
								<c:if test="${project.isImportant eq 'Y'}">
									<label>주요함</label>
								</c:if>
								<c:if test="${project.isImportant eq 'N'}">
									<label>주요하지 않음</label>
								</c:if>
								<%--
								<input id="true" name="IS_IMPORTANT" type="radio" value="Y">
								<label for="true">주요함</label> <span>&nbsp;</span>
								<input checked="checked" id="false" name="IS_IMPORTANT"
									   type="radio" value="N">
								<label for="false">주요하지 않음</label>
								<span>&nbsp;</span>
								--%>
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
								<input type="text" name="pid" id="pid" value="${project.projectPk}"
									   style="display: none">
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
									<%--초기값--%>
									<c:forEach var="i" items="${team}">
										<c:if test="${i.role eq 'PM'}">
											<input style="display: none" type="text" name="project_dept_ori"
												   id="project_dept_ori" value="${i.deptNo}">
											<input style="display: none" type="text" name="project_manager_ori"
												   id="project_manager_ori" value="${i.memberPk}">
										</c:if>
									</c:forEach>
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
									<c:forEach var="i" items="${team}">
										<c:if test="${i.role eq 'PSM'}">
											<tr class='trRange1'>
												<td class='td1'>
														<%--...뭐지이게?--%>
													<input type='checkbox' id='idCheckMain' name='idCheck'
														   class='inputCss'
														   style='width: 30px; display: none' value="${i.memberPk}">
												</td>
												<td class='td1'> ${i.deptName}</td>
												<td class='tdText'>${i.memberName}</td>
												<td class='tdText memberTd'>${i.rankName}
													<input type='hidden' id='memberNo' name='memberNo' class='memberNo'
														   value='${i.memberPk}'>
												</td>
												<td class='tdText'>${i.email}</td>
											</tr>
										</c:if>
									</c:forEach>

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
							<%--템플릿은 여기선 뽑을 이유가 없다--%>
							<%--<div class="col-md-1 text-align-right">프로젝트 템플릿</div>--%>
							<div class="col-md-6">
								<%--
								<select class="form-control" name="project_template" id="project_template">
									<option value="0">선택하세요</option>
									<c:forEach var="t" items="${templateList}">
										<option value="${t.templatePk}">${t.templateName}</option>
									</c:forEach>
								</select>
								--%>
							</div>
							<div class="col-md-1 text-align-right">프로젝트 시작일</div>
							<div class="col-md-2 text-align-right">
								<%--<input type="date" class="" name="" id="">--%>
								<div class="form-group">
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
							<div class="col-md-1 text-align-right">첨부파일</div>
							<div class="col-md-5" id="file_table">
								<%--
								<input type="file" name="project_excel" id="project_excel_0">
								<br>
								--%>

								<table style="width:100%;">
									<tr style="border:1px solid lightgray;">
										<th class="titleTd" style="font-size:14px; height:30px; background: #EEEEEE;">
											&nbsp;&nbsp;등록된 첨부 파일
										</th>
									</tr>
									<tr style="border:1px solid lightgray; height:auto;">
										<td>
											<div id="fileArea" class="inputMenu"
												 style="width:100%; height:auto;  border:1px solid lightgray;">
												<a href="#this" id="add" class="btn" style="padding-bottom: 0px;">파일
													추가하기</a>
												<c:if test="${attachmentList != null }">
													<c:forEach var="a" items="${attachmentList }">
														<div >
															<div class="exist" style="margin-top: 0px; margin-left: 10px; margin-bottom: 0px;">
																<span class="tdF">
																	<i class="fas fa-file-upload"></i>
																&nbsp;&nbsp;<c:out value="${a.originName}"/>
																<input id="hiddenAtNo" name="atNo" class="hiddenAtNo"
																	   type="hidden" value="${a.atNo}">
																	</span>
																<a href='#this' name='delete' class='btn'>
																	<i class='fas fa-minus-square'></i>
																</a>
															</div>
														</div>
													</c:forEach>
												</c:if>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<%--
							<div class="col-md-1 ">
								<div class="btn btn-primary" style="background: #1E2B44;"
									 onclick="add_file_inp()">추가
								</div>
							</div>
							--%>
						</div>
					</div>
					<%--project details--%>
					<div class="row">
						<div class="col-md-12">
							<div class="col-md-1 text-align-right">프로젝트 설명</div>
							<div class="col-md-11">
							<textarea class="form-control" type="text" name="project_details" id="project_details"
									  rows="5">${project.detail}</textarea>
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
							<%--취소 누르면 그대로 페이지 새로고침함.--%>
							<div class="btn" style="background: #E5E5E5;" onclick="location.reload(true)">
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
        // $(document).ready();

        // 첫로딩때 프로젝트 관리자를 원위치에 맞게끔...
        $(document).ready(changeDeptMemberList($("#project_dept"), true));
        $(document).ready($("#startDate").val('${project.startDate}'));
        $(document).ready($("#endDate").val('${project.endDate}'));

        // 파일 업로드용
        $(document).ready(function () {
            $("a[name='delete']").on("click",function(e){
                if ($(this).parent().hasClass('exist')){

				}
                e.preventDefault();
                fn_fileDelete($(this));
            })
            $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });

        $(function(){
            $(document).on('click', '.tdF', function(){
                alert('boo');
                var downNo =  $(this).find(".hiddenAtNo").val();
                location.href = "download.fo?no="+downNo;
            });
        });

        counter = 1

        // 파일추가
        function add_file_inp () {
            $('#file_table').append(
                "<input type=\"file\" name=\"project_excel\" id=\"project_excel_" + counter + "\">" +
                "<button id='inputBtn_" + counter + "' onclick='deleteFileInp(" + counter + ")'> 삭제 </button>" +
                "<br id='br_" + counter + "'>"
            );
            counter++;
        }

        function deleteFileInp (val) {
            $("#project_excel_" + val).remove();
            $("#inputBtn_" + val).remove();
            $("#br_" + val).remove();
        }

        function submitForm () {
            var startDate = Date.parse($("#startDate").val());
            var endDate = Date.parse($("#endDate").val());

            if (($("#startDate").val() === "" || $("#endDate").val() === "") ||
                (endDate < startDate)) {
                /*날짜값이 없거나 종료일이 시작일보다 빠르면 에러*/
                alert("시작·종료일자를 제대로 써주세요. 종료일자는 시작일자와 같거나 이후여야 합니다.");
            } else {
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
                                    "<tr class='trRange1'> " +
                                    "<td class='td1'>" +
                                    "<input type='checkbox' id='idCheckMain' name='idCheck' class='inputCss' style='width: 30px;'>" +
                                    "</td> " +
                                    "<td class='td1'>" + list[key]['deptName'] + "</td> " +
                                    "<td class='tdText'>" + list[key]['memberName'] + "</td>" +
                                    "<td class='tdText memberTd'>" + list[key]['rankNo'] +
                                    "<input type='hidden' id='memberNo' name='memberNo' class='memberNo' value='" +
                                    list[key]['memberNo'] + "'></td>" +
                                    "<td class='tdText'>" + list[key]['email'] + "</td>" +
                                    "</tr>");
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

        function changeDeptMemberList (val, bool) {
            console.log(val);
            console.log("bool is " + bool);
            // 우선 다 초기화
            $("#project_manager option:not([value='0'])").remove();

            // 최초로딩때 실시.
            if (bool) {
                deptOriVal = $("#project_dept_ori").val()
                $('#project_dept option[value=' + deptOriVal + ']').prop('selected', true)
            }

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

                        // 초기화한 경우.
                        if (bool) {
                            memberOriVal = $("#project_manager_ori").val();
                            deptOriVal = $("#project_dept_ori").val();

                            $("#project_manager option[value=" + memberOriVal + "]").prop('selected', true);
                            $("#pmo option[value=" + deptOriVal + "]").prop("selected", true);
                        }
                    }
                });
            }
        }

        // 0월 00, 0000 인 날짜를 인풋에 드갈수 있게끔
        // 0000-00-00 로 변경
        function parseKrDate (krDate) {
            var dateArray = krDate.split(/월 |, /);
            let month = dateArray[0];
            let day = dateArray[1];
            let year = dateArray[2];

            if (month < 10) {
                month = '0' + month
            }
            if (day < 10) {
                day = '0' + day;
            }

            return year + '-' + month + '-' + day;
        }

        // user/general/generalWorkUpdateForm 에서 뽑아온거

        function fn_fileDelete (obj) {
            obj.parent().parent().remove();
        }

        function fn_fileAdd () {
            var str =
                "<div class='filePlus'>" +
                "<div style='display: inline-flex;'>" +
                "<input type='file' class='fileCss' name='file' style='padding-left:10px;'>" +
                "</div>" +
                "<div style='display: inline-flex;'>" +
                "<a href='#this' name='delete' class='btn'><i class='fas fa-minus-square'></i></a>" +
                "</div>" +
                "</div>";
            $("#fileArea").append(str);

            $("a[name='delete']").on("click", function (e) {
                e.preventDefault();
                fn_fileDelete($(this));
            })
        }
	</script>
</body>
</html>
