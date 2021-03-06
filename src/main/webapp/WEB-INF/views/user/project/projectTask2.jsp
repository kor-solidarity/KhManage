<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<html>
<head>
	<title>Title</title>
	<script src="https://www.gstatic.com/charts/loader.js"></script>
	<style>
		/* 프로젝트 센터 공통  */
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

		/*  projectTask 파일쪽 css 설정 */
		.project-task-col {
			display: inline-block;
			text-align: center;
			margin-left: 5px;
			margin-right: 5px;
		}

		.panel-heading {
			border: 1px gray solid;
		}

		/*툴바*/
		.toolbar {
			background-color: #fafafa;
			height: 50px;
			border: 1px solid #cecece;
			border-bottom: none;
			padding: 10px;
		}

		.toolbar ul {
			/*display:table;*/
			list-style: none;
			margin: 0;
			padding-left: 0;
		}

		.toolbar li div {
			float: left;
			text-align: center;
			color: #5e738b;
			padding-left: 5px;
			padding-right: 5px;
			cursor: pointer;
		}

		.toolbar li i {
			font-size: 15px;
			padding-bottom: 5px;
		}

		.toolbar-split {
			height: 30px;
			border-right: 1px solid #adadad;
			padding: 2px !important;
			margin: 0 !important;
		}

		.chart-left-table > tbody > tr > td {
			text-align: center;
			font-size: 12px;
			height: 30px;
		}

		.chart-left-top > th {
			text-align: center;
			font-size: 12px;
			height: 30px;
		}

		.gantt-div {
			overflow: auto;
			margin-right: 0px;
			min-width: 200px;
			width: 748px;
			height: 898px;
			padding: 0px;
			border-right: 1px gray solid;
			display: inline-block;
			float: right;
		}

		.gantt-day-disp {
			border: 1px black solid;
			width: 30px;
			height: 30px;
			display: inline-block;
			float: left;
			text-align: center;
		}

		.gantt-month-disp {
			width: 930px;
			height: 29px;
			border: 1px black solid;
			display: inline-block;
			float: left;
		}

		.fa-search {
			cursor: pointer;
		}

	</style>
	<!-- demo stylesheet -->
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/helpers/demo.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/helpers/media/layout.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/helpers/media/elements.css"/>
	<!-- helper libraries -->
	<!-- daypilot themes -->
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/areas.css"/>

	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_white.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_green.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_transparent.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_traditional.css"/>

	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/navigator_8.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/navigator_white.css"/>

	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_transparent.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_white.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_green.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_traditional.css"/>

	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_8.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_white.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_green.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_blue.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_traditional.css"/>
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_transparent.css"/>

	<script src="resources/daypilot/demo/helpers/jquery-1.12.2.min.js" type="text/javascript"></script>
	<!-- daypilot libraries -->
	<script src="resources/daypilot/demo/js/daypilot-all.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js"
			integrity="sha256-qE/6vdSYzQu9lgosKxhFplETvWvqAAlmAuR+yPh/0SI=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<body onload="$('#route1').text('프로젝트 센터')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp"/>

	<%--프로젝트 작업 페이지--%>
	<div class="panel panel-headline">
		<div class="panel-heading">
			<%--상위 메뉴--%>
			<div class="row" style="margin-bottom: 0;">
				<div class="toolbar">
					<ul>
						<li>
							<div id="toolbar_edit_mode">
								<i class="glyphicon glyphicon-edit"></i><br>
								<span id="toolbar_edit_text">편집</span>
							</div>
						</li>

						<li>
							<div class="gantt-edit-control gantt-none-edit-mode dropdown">
								<div id="toolbar_add" class="gantt-edit-control gantt-none-edit-mode"
								<%--data-toggle="dropdown"--%>
									 data-toggle="modal" data-target="#workDetails" onclick="add_project_work()"
									 style="padding:0px">
									<i class="glyphicon glyphicon-plus"></i><br>
									추가
								</div>

								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li>
										<div id="add_below" role="menuitem" tabindex="-1" onclick="add_project_work()">
											<i
													class="glyphicon glyphicon-save"></i> 아래에 추가
										</div>
									</li>
									<li>
										<div id="add_above" role="menuitem" tabindex="-1"><i
												class="glyphicon glyphicon-open"></i> 위에 추가
										</div>
									</li>
									<li>
										<div id="add_child" role="menuitem" tabindex="-1"><i
												class="glyphicon glyphicon-import "></i> 하위로 추가
										</div>
									</li>
								</ul>
							</div>
						</li>

						<li>
							<div id="toolbar_delete" class="gantt-edit-control gantt-none-edit-mode">
								<i class="glyphicon glyphicon-share" style="position:relative;"></i><br>
								삭제
							</div>
						</li>
						<li>
							<div id="toolbar_indent" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-indent" style="position:relative;"></i><br>
								내리기
							</div>
						</li>
						<li>
							<div id="toolbar_outdent" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-outdent" style="position:relative;"></i><br>
								올리기
							</div>
						</li>

						<li>
							<div id="toolbar_down" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-arrow-circle-down" style="position:relative;"></i><br>
								아래로
							</div>
						</li>

						<li>
							<div id="toolbar_up" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-arrow-circle-up" style="position:relative;"></i><br>
								위로
							</div>
						</li>


						<li>
							<div id="toolbar_base_line" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-list" style="position:relative;"></i><br>
								초기계획
							</div>
						</li>


						<li>
							<div id="toolbar_excel_down" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-file-excel-o" style="position:relative;"></i><br>
								엑셀다운
							</div>
							<form action="/GanttChart/ProjectExcelDown" id="formExcelDown" method="post">
								<input type="hidden" name="projectUid" value="a9481641-d51f-474e-a4bf-271fb512155b">
							</form>
						</li>

						<li>
							<div id="toolbar_excel_upload" class="gantt-edit-control gantt-none-edit-mode">
								<i class="fa fa-file-excel-o" style="position:relative;"></i><br>
								업로드
							</div>
						</li>

						<li>
							<div class="toolbar-split"></div>
						</li>


						<li>
							<div id="toolbar_day">
								<i class="icon-calendar"></i><br>
								일
							</div>
						</li>
						<li>
							<div id="toolbar_week">
								<i class="icon-calendar"></i><br>
								주
							</div>
						</li>
						<li>
							<div id="toolbar_month">
								<i class="icon-calendar"></i><br>
								월
							</div>
						</li>
						<li>
							<div id="toolbar_quarter">
								<i class="icon-calendar"></i><br>
								분기
							</div>
						</li>

						<li>
							<div class="toolbar-split"></div>
						</li>
						<li>
							<div id="toolbar_baseline_view">
								<i class="fa fa-th" style="position:relative;"></i><br>
								계획비교
							</div>
						</li>
						<li>
							<div class="dropdown">
								<div data-toggle="dropdown" style="padding:0px">
									<i class="fa fa-sort-amount-asc"></i><br>
									레벨별
								</div>
								<ul class="dropdown-menu" role="menu" aria-labelledby="menu1">
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(9999);"> 하위 작업 모두 보기
										</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(0);"> 1레벨 보기</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(1);"> 2레벨 보기</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(2);"> 3레벨 보기</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(3);"> 4레벨 보기</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(4);"> 5레벨 보기</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(5);"> 6레벨 보기</div>
									</li>
									<li>
										<div role="menuitem" tabindex="-1" onclick="ViewTaskLevel(6);"> 7레벨 보기</div>
									</li>
								</ul>
							</div>
						</li>

						<li>
							<div id="toolbar_field_view">
								<i class="fa fa-check-square" style="position:relative;"></i><br>
								필드보기
							</div>
						</li>


						<li id="toolbar_full_li" style="display: block;">
							<div id="toolbar_full">
								<i class="fa icon-size-fullscreen"></i><br>
								전체화면
							</div>
						</li>
					</ul>
				</div>
			</div>

		</div>
		<%--하위 차트 판 --%>
		<div style="width: 100%; height: 900px; /*padding: 0;*/float: left; /*border: 1px red solid;*/">
			<%--차트 좌측 목록--%>
			<div style="margin-right: 0px; width: 862px; min-height: 898px; padding: 0px; border-left: 1px  gray solid; display: inline-block">
				<table border="1" style="height: 50px" class="chart-left-table" id="chart-left-table">
					<tr class=" chart-left-top" style="height: 60px">
						<%--ID--%>
						<th style="width: 30px">ID</th>
						<%--작업명--%>
						<th style="width: 220px">작업명</th>
						<%--상태--%>
						<th style="width: 70px">상태</th>
						<%--기간--%>
						<th style="width: 40px">기간</th>
						<%--시작--%>
						<th style="width: 90px">시작</th>
						<%--완료--%>
						<th style="width: 90px">완료</th>
						<%--상위작업--%>
						<th style="width: 120px">상위작업</th>
						<%--완료율--%>
						<th style="width: 60px">완료율</th>
						<%--담당자--%>
						<th style="width: 110px">담당자</th>
						<%--돋보기(상세정보)--%>
						<th style="width: 30px"><i class="fas fa-search" data-toggle="modal"></i></th>
					</tr>
					<tr>
						<td>5</td>
						<td>무슨작업</td>
						<td><span style="" class="fa fa-circle" data-toggle="tooltip" title="대기중"></span></td>
						<td>10</td>
						<td>2020.03.10</td>
						<td>2020.03.19</td>
						<td></td>
						<td>0%</td>
						<td>홍길동</td>
						<td><i class="fas fa-search"></i></td>
					</tr>
				</table>
			</div>
			<%--차트 우측: 간트차트--%>
			<div class="gantt-div" style="overflow-y: hidden;">
				<div id="chart-div">
					<%--날짜 표기부분. 너비는 일수에 따라 유동적으로 움직이게끔.--%>
					<%--위아래 오버플로우 히든은 중간발표로 부득이한 임시방편--%>
					<div class="gantt-date" style="width: 2760px ; min-height: 898px; /*overflow: hidden;*/ "
						 id="gantt">
						<style>
							.gantt-table tr {
								height: 30px;
								border: 1px black solid;
								text-align: center;
							}

							.gantt-table tr th {
								border: 1px black solid;
								text-align: center;
							}

							.gantt-table tr td {
								width: 30px;
								border: 1px black solid;
								text-align: center;
							}

						</style>
					</div>
				</div>
				<style>
					.gantt_default_tree_image_collapse, .gantt_default_tree_image_no_children {
						display: none;
					}
				</style>
				<script>

                    var gantt = undefined;

                    // 작업 추가를 누르면 어떤거든간에 우선 테이블 맨위에 띄우게끔.
                    function add_project_work (location) {
                        // alert('add_project_work');
                        // 초기화
                        $("#modalWorkNo").val("0");

                        $("#workTitle").empty();
                        // 제목 맞게 수정
                        $("#workTitle").append("작업 신규등록");

                        $("#deleteWorkBtn").attr("style", 'display:none;');

                        // 작업정보, 상위작업 외에는 조회 못하게 막는다. 모달기능 해제.
                        $('#menuNav2').attr('data-toggle', '');
                        $('#menuNav3').attr('data-toggle', '');
                        $('#menuNav4').attr('data-toggle', '');
                        // 인풋, 셀렉트 막힌거 다 푼다.
                        $('#workDetails input,textarea,select').removeAttr('disabled');
                        $('#memo').attr('disabled', 'true');

                        // 모달 내용물 다 초기화
                        $("#workName").val("");
                        $("#startDate").val("");
                        $("#completeDate").val("");
                        $("#memo").val("");

                        // 이제 불러와서 추가해야 할 사항들을 집어온다.
                        // 불러와야 하는건 두가지:
                        // 1. 작업배정시킬 프로젝트 작업자 목록
                        // 2. 작업을 승인할 PM/PSM 목록
                        // 3. 상위작업목록
                        $.ajax({
                            url: 'viewProjectTeamList.pr',
                            type: 'post',
                            data: {
                                pid: "${pid}",
                            },
                            success: function (data) {
                                teamList = data.teamList;
                                grantorList = data.grantorList;
                                workList = data.workList;

                                // 인원목록에 넣어준다.
                                // 우선 일반 팀원들 목록 초기화
                                $("#memberNo").empty();
                                $("#memberNo").append(
                                    "<option value='0'>담당자 없음</option>"
                                );
                                for (let i = 0; i < teamList.length; i++) {
                                    $("#memberNo").append(
                                        "<option value='" + teamList[i].memberPk + "'>" + teamList[i].deptName + " " +
                                        teamList[i].memberName + " " + teamList[i].rankName + "</option>"
                                    );
                                }

                                // 다 됬으면 바로 승인자 추가
                                $("#grantor").empty();
                                $("#grantor").append(
                                    "<option value='0'>승인자 없음</option>"
                                );
                                for (let i = 0; i < grantorList.length; i++) {
                                    $("#grantor").append(
                                        "<option value='" + grantorList[i].memberPk + "'>" + grantorList[i].deptName +
                                        " " +
                                        grantorList[i].memberName + " " + grantorList[i].rankName + "</option>"
                                    );
                                }

                                // 그다음은 하위작업을 위한 목록
                                $('#highWorkSel').empty();
                                $('#highWorkSel').append(
                                    "<option value='0'>하위작업 없음</option>"
                                );

                                for (let i = 0; i < workList.length; i++) {
                                    $("#highWorkSel").append(
                                        "<option value='" + workList[i].workNo + "'>" +
                                        workList[i].workName + "</option>"
                                    );
                                }

                                // alert("done!");
                            },
                            error: function (xhr, status, error) {
                                alert("wut");
                            }
                        })

                    }

                    // 띄워져있는 새 작업 등록한다.
                    function sendProjectWork () {
                        console.log("sendProjectWork");
                        if (document.getElementById('projectWork') == null) {
                            return;
                        }
                        console.log('aa')
                        // 유효성검사 하나도 안됬음. 전부 뜯어고쳐야함
                        $.ajax({
                            url: 'projectWorkInsert.pr',
                            type: 'post',
                            data: {
                                workName: $("#workName").val(),
                                beginDate: $("#beginDate").val(),
                                endDate: $("#endDate").val(),
                                memberNo: $("#memberNo").val(),
                                highWorkNo: $("#highWorkNo").val(),
                                pid: "${pid}",

                            },
                            success: function (data) {
                                alert("done!");
                                console.log(data);
                                updateWorkList();
                            },
                            error: function (xhr, status, error) {
                                alert("wut");
                            }
                        })
                    }
				</script>

			</div>
		</div>
	</div>

	<!-- Modal -->
	<%--
	이 모달창에선 모달창을 누른 테이블 칸, 그니까 해당 테이블의 담당자 목록을 찾아와야 한다.
	여기서 정확히 필요한 목록은:
		해당 프로젝트의 담당자 목록,
		그리고 작업으로 이미 배정(체크)된 인원 목록
	--%>
	<style>
		.workerSelector {
			font-weight: normal;
		}

		.workerSelector:hover {
			font-weight: bolder;
		}
	</style>
	<div class="modal fade" id="workMemberModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel"><i class="fas fa-th-large"></i>&nbsp;담당자 목록</h4>
				</div>
				<div class="modal-body" id="workerList">
					<input type="checkbox" name="workCharger" value="P0" id="P0"> <label for="P0">부서 이름 직급</label> <br>
					<input type="checkbox" name="workCharger" value="P1" id="P1"> <label for="P1">부서 이름 직급</label>
				</div>
				<div class="modal-footer">
					<button type="button" id="cancelWorkerBtn" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" id="nullifyWorkerBtn" class="btn btn-primary"
							onclick="nullifyNewWorker()"
							style="background: #1E2B44; outline: none; border: none;">미배정
					</button>
				</div>
			</div>
			<script>
                $(updateWorkList());

                /***
                 * 담당자 목록 갱신.
                 *
                 * @param workId 해당 모달창이 가리키고 있는 작업의 아이디. 작업번호가 없으면 무조건 신규등록인거?
                 */
                function viewWorkInCharge (workId) {
                    // 담당자 목록은 해당 프로젝트에 담당된 모든 인원을 우선 불러오는걸로.
                    $.ajax({
                        url: 'viewProjectTeamList.pr',
                        type: 'post',
                        data: {
                            pid: "${pid}"
                        },
                        success: function (data) {
                            for (key in data) {
                                console.log(key);
                                console.log(data[key])
                            }
                            // 안에 내용물을 다 엎고 새로운걸로 바꾼다.
                            $("#workerList").empty();
                            for (key in data) {
                                $("#workerList").append(
                                    // NULLIFIED - 담당자 배정에 변동이 있음 - 작업 하나에 담당자 한명임
                                    // 소속된 인원 확인.
                                    // 추후 인원 수정할때 체크여부 고려!!!

                                    '<input type="text" name="workCharger" value="' + data[key]['memberPk'] + '" ' +
                                    'id="' + data[key]['memberPk'] + '" style="display: none;"> ' +
                                    '<label class="workerSelector" for="' + data[key]['memberPk'] +
                                    // '" onclick="updateNewWorkerInCharge(\'#' + data[key]['memberPk'] + '\')">' +
                                    '" onclick="updateNewWorkerInCharge(this)">' +
                                    ' <span class="deptName">' + data[key]['deptName'] + '</span> ' +
                                    ' <span class="memberName">' + data[key]['memberName'] + '</span> ' +
                                    ' <span class="rankName">' + data[key]['rankName'] + '</span> ' +
                                    '</label> <br>'

                                    // '<label for="' + data[key]['memberPk'] + '">' + data[key]['deptName'] +
                                    // ' <span class="workerName">' +
                                    // data[key]['memberName'] + '</span> ' +
                                    // data[key]['rankName'] + '</label> <br>'

                                    // 인원목록 불러오기.
                                    // '<span class="selector"></span>'

                                );
                            }
                            $("#nullifyWorkerBtn").attr('onclick', 'nullifyNewWorker("new")');
                        }
                    });
                }

                // 작업에 배정된 인원을 없앤다.
                function nullifyNewWorker (val) {
                    $("#addWorkers").empty();
                }

                // 새 작업에 인원을 배정한다.
                function updateNewWorkerInCharge (val) {
                    // $("#workMemberModal").modal("toggle");
                    $("#cancelWorkerBtn").click();
                    valQ = $(val);
                    <%-- val 은 클릭한 글자 label DOM 전체임.--%>
                    console.log(val);

                    let memberNo = $(val).attr('for');
                    let memberName = valQ.find('span.memberName');
                    let deptName = valQ.find('span.deptName');
                    let rankName = valQ.find('span.rankName');
                    $("#addWorkers").empty();
                    // 내용물 지우고 새로 채우기.
                    $("#addWorkers").append(
                        "<input type='text' name='memberNo' id='memberNo' style='display: none' value='" + memberNo +
                        "'>" +
                        "<span >" + memberName.html() + "</span>"
                    );
                }

                // 작업을 여러명 배정을 안하기로 되서 우선 보류
                // 담당자 목록 모달에
                function updateWorkInCharge (val) {
                    console.log(val);
                    // 새 작업인 경우 아직 추가대상은 아닌거.
                    if (val == 'new') {
                        for (let i = 0; i < $("[name=workCharger]").length; i++) {
                            let wid = $("[name=workCharger]").eq(i);
                        }
                        // 인풋만 넣는거로.
                        $("#addWorkers").append(
                            '<input type="text" name="" id="">'
                        );
                    }
                    return;
                    $.ajax({
                        url: 'updateWorkInCharge.pr',
                        type: 'post',
                        data: {
                            pid: "${pid}"
                        },
                        success: function (data) {

                        }
                    })
                }

                /**
                 * 작업목록에 있는 모든 목록을 지우고 새로 불러와서 정렬시키는 역할을 한다.
                 *
                 */
                function updateWorkList () {
                    console.log("updateWorkList");
                    $.ajax({
                        url: 'updateWorkList.pr',
                        type: 'post',
                        data: {
                            pid: "${pid}"
                        },
                        success: function (data) {
                            workList = data;
                            for (key in data) {
                                console.log(key);
                                console.log(data[key])
                            }
                            // 좌측 목록 몽땅 제거.
                            $("#chart-left-table tr:not(tr:first-of-type)").remove()
                            // todo 우측도 이거 끝나면 제거해야함. 당장은 좌측이 더 급하니 이거부터 하는걸로.

                            projectWorkList = data['projectWorkList']
                            // 돌아가면서 넘긴다.
                            for (key in projectWorkList) {
                                target_id = "#" + projectWorkList[key]['workNo'];
                                // 상위작업 이름
                                highWorkName = projectWorkList[key]['highWorkName'];
                                if (highWorkName == undefined) {
                                    highWorkName = "";
                                }
                                // 단계에 따른 상하위작업 들여쓰기
                                workLevelTab = '&nbsp;'
                                if (projectWorkList[key].workLevel == 2) {
                                    workLevelTab = '&nbsp;&nbsp;&nbsp;&nbsp;└&nbsp;';
                                } else if (projectWorkList[key].workLevel == 3) {
                                    workLevelTab = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└&nbsp;';
                                }
                                // 상태값 관련
                                memberName = projectWorkList[key]['memberName'];
                                if (memberName == undefined) {
                                    memberName = "";
                                }

                                $("#chart-left-table tr:last-of-type").after(
                                    // ' + projectWorkList[key][''] + '
                                    '<tr id="' + projectWorkList[key]['workNo'] + '">' +
                                    // 작업아이디
                                    '<td>' + projectWorkList[key]['workNo'] + '</td>' +
                                    '<td style="text-align: left">' + workLevelTab + projectWorkList[key]['workName'] +
                                    '</td>' +
                                    // 상태
                                    // '<td><span style="" class="fa fa-circle" data-toggle="tooltip" title="대기중"></span></td>' +
                                    '<td>' + projectWorkList[key]['status'] + '</td>' +
                                    // 기간
                                    '<td>' + projectWorkList[key]['days'] + '</td>' +
                                    '<td>' + projectWorkList[key]['beginDate'] + '</td>' +
                                    '<td>' + projectWorkList[key]['completeDate'] + '</td>' +
                                    // 상위작업 이름
                                    '<td>' + highWorkName + '</td>' +
                                    '<td>' + projectWorkList[key]['completeRate'] + '%' + '</td>' +
                                    // 작업에 배정된 인원
                                    '<td>' + memberName + '</td>' +
                                    '<td><i class="fas fa-search" data-toggle="modal" ' +
                                    'data-target="#workDetails" ' +
                                    "onclick='clickedWorkDetails(\"" + projectWorkList[key]['workNo'] +
                                    "\")' ></i></td>" +
                                    // 우선 여기까지 채우고 추가내용은 값에따라 바뀌기 때문에 별도추가?
                                    '</tr>'
                                );
                            }

                            // 간트차트용
                            ganttInfo = data.ganttInfo;

                            chartList = [
                                /*
                                {   "id": 1,
                                    "text": "Group 1",
                                    "complete": 35,
                                    "children": [],
                                    "start": "2020-05-04T00:00:00",
                                    "end": "2020-05-16T00:00:00"}
								*/
                            ];
                            for (key in projectWorkList) {
                                // console.log('key' + key);
                                // projectWorkList[key].
                                workName = projectWorkList[key]['workName']
                                workLevelTab = "";
                                if (projectWorkList[key].workLevel == 2) {
                                    workLevelTab = '&nbsp;&nbsp;&nbsp;&nbsp;└&nbsp;';
                                } else if (projectWorkList[key].workLevel == 3) {
                                    workLevelTab = '&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;└&nbsp;';
                                }
                                chartList.push({
                                    'id': projectWorkList[key]['workNo'],
                                    'text': workLevelTab + projectWorkList[key]['workName'],
                                    'complete': projectWorkList[key]['completeRate'],
                                    'start': parseKrDate(projectWorkList[key]['beginDate']),
                                    'end': parseKrDate(projectWorkList[key]['completeDate'])
                                })

                            }

                            // undefined 면 초기화부터.
                            if (gantt == undefined) {
                                console.log('gantt init');
                                // 간트차트
                                gantt = new DayPilot.Gantt("gantt", {
                                    cellWidthSpec: "Fixed",
                                    cellWidth: 30,
                                    timeHeaders: [
                                        {
                                            "groupBy": "Month"
                                        },
                                        {
                                            "groupBy": "Day",
                                            "format": "d"
                                        }
                                    ],
                                    scale: "Day",
                                    days: ganttInfo.totalDays,
                                    startDate: ganttInfo.startDate,
                                    taskHeight: 26,
                                    rowHeaderHideIconEnabled: true,
                                    rowMoveHandling: "Disabled",
                                    taskMoveHandling: "Disabled",
                                    linkCreateHandling: "Disabled",
                                    rowCreateHandling: "Disabled",
                                    tasks: chartList
                                    /*
										[
										{
											"id": 1,
											"text": "Group 1",
											"complete": 35,
											"children": [],
											"start": "2020-05-04T00:00:00",
											"end": "2020-05-16T00:00:00"
										},
										{
											"id": 5,
											"start": "2020-05-04T00:00:00",
											"end": "2020-05-11T00:00:00",
											"text": "Task 1",
											"complete": 60
										},
										{
											"id": 3,
											"start": "2020-05-11T00:00:00",
											"end": "2020-05-16T00:00:00",
											"text": "Task 2",
											"complete": 0
										}
									]
									*/
                                    /*
									links: [
										{
											"from": 2,
											"to": 3,
											"type": "FinishToStart"
										}
									]
									*/
                                });
                                // alert('boo');
                                // gantt.
                                gantt.init();
                                $(".gantt_default_header_icon").click();
                                // $('.gantt_default_corner').attr('style', 'display: none');
                                // $('.gantt_default_rowheader_scroll').attr('style', 'display: none');
                                $('.gantt_default_scrollable').attr('style', 'height: 1200px');
                            } else {
                                console.log('gantt update');
                                // gantt.days = ganttInfo.totalDays;
                                // gantt.startDate = ganttInfo.startDate;
                                gantt.tasks.list = chartList;
                                // console.log('chartList ' + chartList);
                                gantt.update();
                            }

                        }
                    })
                }

                <%--
				작업 상세보기 클릭 시 내용 띄우기.
				--%>

                function clickedWorkDetails (workNo) {
                    // alert("clickedWorkDetails");
                    // console.log("clickedWorkDetails");
                    $.ajax({
                        url: 'selectWork.pr',
                        type: 'post',
                        data: {
                            workNo: workNo,
                            pid: "${pid}",
                        },
                        success: function (data) {
                            // 산출물, 가이드, 히스토리 항목 활성화. 새작업 등록할땐 다시 지움.
                            // $("")

                            // 신규등록으로 없어졌을수도 있으니.
                            $('#menuNav2').attr('data-toggle', 'tab');
                            $('#menuNav3').attr('data-toggle', 'tab');
                            $('#menuNav4').attr('data-toggle', 'tab');

                            $("#deleteWorkBtn").attr("style", 'display:none;');

                            $('#modalWorkNo').val(workNo);
                            daata = data;
                            // alert("done!");
                            console.log(JSON.stringify(data));
                            // 하나하나 뽑아서 모달창에 넣읍시다.
                            // projectWork - 작업정보
                            projectWork = data['projectWork'];
                            // 승인자
                            grantorList = data.grantorList;
                            //
                            teamList = data.teamList;
                            // 상위작업 선택목록
                            highWorkList = data.highWorkList;
                            // 산출물
                            workProduct = data.workProduct;
                            // history
                            workHistory = data.workHistory;
                            // 가이드
                            projectAttachment = data.projectAttachment;

                            // 이 창에서 수정이 가능한건 인원뿐. 그것도 시작전일때만.
                            console.log("이 창에서 수정이 가능한건 인원뿐. 그것도 시작전일때만.")
                            $('#workDetails input,textarea,select').attr('disabled', 'true');

                            if (projectWork.status == '시작전') {
                                $('#workDetails select').removeAttr('disabled');
                                $("#deleteWorkBtn").removeAttr("style");
                                $("#startDate").removeAttr("disabled");
                                $("#completeDate").removeAttr("disabled");
                            }

                            // 메모는 여기서 아예 건들여선 안됨.
                            // $('#memo').removeAttr('disabled');

                            // 작업 모달 제목창
                            $("#workTitle").text(projectWork.workName);
                            // 제목인풋
                            $("#workName").val(projectWork.workName);
                            // startDate
                            $("#startDate").val(parseKrDate(projectWork.beginDate));
                            $("#completeDate").val(parseKrDate(projectWork.completeDate));
                            // 담당자 목록. 우선 내용물부터 지웁시다.
                            $("#memberNo").empty();
                            $("#memberNo").append(
                                "<option value='0'>담당자 없음</option>"
                            );
                            for (let i = 0; i < teamList.length; i++) {
                                $("#memberNo").append(
                                    "<option value='" + teamList[i].memberPk + "'>" + teamList[i].deptName + " " +
                                    teamList[i].memberName + " " + teamList[i].rankName + "</option>"
                                );
                            }
                            // 다 넣고 이미 선택된 담당자가 있는지 확인한다.
                            console.log('다 넣고 이미 선택된 담당자가 있는지 확인: ' + projectWork.memberNo);
                            if (projectWork.memberNo != undefined) {
                                $("#memberNo option[value=" + projectWork.memberNo + "]").
                                    prop('selected', true);
                            }

                            // 우선 내용을 싹 다 비우고 시작
                            $("#grantor").empty();
                            $("#grantor").append(
                                "<option value='0'>승인자 없음</option>"
                            );
                            for (let i = 0; i < grantorList.length; i++) {
                                $("#grantor").append(
                                    "<option value='" + grantorList[i].memberPk + "'>" + grantorList[i].deptName + " " +
                                    grantorList[i].memberName + " " + grantorList[i].rankName + "</option>"
                                );
                            }

                            // 다 넣고 이미 선택된 grantor 가 있는지 확인한다.
                            console.log('다 넣고 이미 선택된 grantor 있는지 확인: ' + projectWork.grantorNo);
                            if (projectWork.grantorNo != undefined) {
                                $("#grantor option[value=" + projectWork.grantorNo + "]").
                                    prop('selected', true);
                            }

                            // memo
                            $("#memo").append(
                                projectWork.memo
                            );
                            // 여기까지 작업정보 항목 끝.

                            // 다음은 상위작업
                            $("#highWorkSel").empty();
                            $("#highWorkSel").append(
                                "<option value='0'>상위작업 없음</option>"
                            );

                            for (let i = 0; i < highWorkList.length; i++) {
                                $("#highWorkSel").append(
                                    "<option value='" + highWorkList[i].workNo + "' >" +
                                    highWorkList[i].workName +
                                    "</option>"
                                );
                            }
                            if (projectWork.highWorkNo != undefined) {
                                $("#highWorkSel option[value=" + projectWork.highWorkNo + "]").
                                    prop('selected', true);
                                $("#oriVal").val(projectWork.highWorkNo)
                            }
                            if (projectWork.highWorkNo == undefined) {
                                $("#oriVal").val('0')
                            }

                            // 여기서부터 산출물
                            // 우선 산출물 항목 클리어
                            $("#workProductTable tbody").empty();
                            for (let i = 0; i < workProduct.length; i++) {
                                $("#workProductTable tbody").append(
                                    "<tr>" +
                                    // 구분
                                    "<td>" + workProduct[i].productType + "</td>" +
                                    // 파일명
                                    "<td>" + workProduct[i].originName + "</td>" +
                                    // 등록일
                                    "<td>" + workProduct[i].enrollDate + "</td>" +
                                    // 등록자 - 등록자가 테이블에 없음
                                    // "<td>" +workProduct[i].productType + "</td>" +
                                    // 삭제창?
                                    "<td>" + workProduct[i].productType + "</td>" +
                                    "</tr>"
                                );
                            }

                            // 히스토리
                            $("#historyTable").empty();
                            $("#historyTable").append(
                                "<tr>" +
                                "<th>내용</th>" +
                                "<th>이름</th>" +
                                "<th>변경일자</th>" +
                                "</tr>"
                            );
                            for (let i = 0; i < workHistory.length; i++) {
                                inCharge = "";
                                if (workHistory[i].memberName != undefined) {
                                    inCharge = workHistory[i].deptName +
                                        " " + workHistory[i].memberName + " " +
                                        workHistory[i].rankName;
                                }
                                $("#historyTable").append(
                                    "<tr>" +
                                    "<td>" + workHistory[i].status + "</td>" +
                                    "<td>" + inCharge + "</td>" +
                                    "<td>" + workHistory[i].modifyDate + "</td>" +
                                    "</tr>"
                                );
                            }

                            // 가이드: 프로젝트에 등록된 첨부파일을 넣는거임. 

                            $("#projectAttachmentTable tbody").empty();

                            for (let i = 0; i < projectAttachment.length; i++) {
                                $("#projectAttachmentTable tbody").append(
                                    "<tr>" +
                                    // 파일명
                                    "<td> <a onclick='down_stuff(\"" + projectAttachment[i].atNo + "\")'>" +
                                    projectAttachment[i].originName + "</a></td>" +
                                    // 등록일
                                    // "<td>" +  + "</td>" +
                                    // 등록자 - 등록자가 테이블에 없음
                                    // "<td>" +workProduct[i].productType + "</td>" +
                                    // 삭제창?
                                    // "<td>" + "</td>" +
                                    "</tr>"
                                );
                            }
                        },
                        error: function (xhr, status, error) {
                            alert("wut");
                        }
                    })
                }

                function down_stuff (downNo) {
                    console.log(downNo);
                    // alert(downNo)
                    location.href = "download.fo?no=" + downNo;
                }

                // 0월 00, 0000 인 날짜를 인풋에 드갈수 있게끔
                // 0000-00-00 로 변경
                function parseKrDate (krDate) {
                    // console.log('krDate: ' + krDate);
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
			</script>
		</div>
	</div>
	<style>

	</style>
	<%--작업 상세보기 모달창--%>
	<div class="modal fade" id="workDetails" tabindex="-1" role="dialog"
		 aria-labelledby="workDetailTitle">
		<div class="modal-dialog " role="document">
			<div class="modal-content" style="width: 800px;">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="workDetailTitle">
						<i class="fas fa-th-large"></i>&nbsp;<span id="workTitle">담당자 목록</span>
						<input type="text" name="modalWorkNo" id="modalWorkNo" style="display: none;">
					</h4>
				</div>
				<div class="modal-body" id="workDetailContent">
					<div class="container-fluid">
						<ul class="nav nav-tabs">
							<li class="active"><a data-toggle="tab" href="#home" id="menuNav0">작업정보</a></li>
							<li><a data-toggle="tab" href="#menu1" id="menuNav1">상위작업</a></li>
							<li><a data-toggle="tab" href="#menu2" id="menuNav2">산출물</a></li>
							<li><a data-toggle="tab" href="#menu3" id="menuNav3">가이드</a></li>
							<li><a data-toggle="tab" href="#menu4" id="menuNav4">히스토리</a></li>
						</ul>
						<div class="tab-content"><br>
							<%--작업정보--%>
							<div id="home" class="tab-pane fade in active">
								<div class="row">
									<div class="col-lg-2 text-center">작업명</div>
									<div class="col-lg-10">
										<input class="form-control" type="text" name="workName" id="workName" value="">
									</div>
								</div>
								<div class="row">
									<div class="col-lg-2 text-center">시작</div>
									<div class="col-lg-4">
										<input class="form-control" type="date" name="startDate" id="startDate">
									</div>
									<div class="col-lg-2 text-center">완료</div>
									<div class="col-lg-4">
										<input class="form-control" type="date" name="completeDate" id="completeDate">
									</div>
								</div>
								<%----%>
								<div class="row">
									<div class="col-lg-2 text-center">담당자</div>
									<div class="col-lg-4">
										<%--<div class=" col-lg-10" style="padding-left: 0; padding-right: 0">
											<input class="form-control" type="number" max="100" min="0"
											 name="completeRate" id="completeRate">
										</div>--%>
										<select class="form-control" name="memberNo" id="memberNo">
											<option value="idHere">yolo</option>
										</select>
									</div>
									<div class="col-lg-2 text-center">승인자</div>
									<div class="col-lg-4">
										<%--승인자는 PM 또는 PL--%>
										<select class="form-control" name="grantor" id="grantor">
											<option value="0">미배정</option>
											<option value="ayy">ayylmaodudethisiskindalongandstuffuknow</option>
											<option value=""></option>
										</select>
									</div>
								</div>
								<%--여기 원래 PMS에는 산출물이 있었는데 우린 굳이 필요 없는거 같으니 삭제--%>
								<%--<div class="row">
									<div class="col-lg-2 text-center">산출물</div>
									<div class="col-lg-4">
										<select class="form-control" name="workProduct" id="workProduct">
											<option value="0">미배정</option>
											<option value="UI보고서">UI보고서</option>
											<option value="요구사항정의서">요구사항정의서</option>
											<option value="프로세스정의서">프로세스정의서</option>
											<option value="테이블정의서">테이블정의서</option>
											<option value="통합테스트 시나리오">통합테스트 시나리오</option>
										</select>
									</div>
								</div>--%>
								<div class="row">
									<div class="col-lg-2 text-center">메모</div>
									<div class="col-lg-10">
										<textarea name="memo" id="memo" cols="60" rows="10"
												  style="width: 100%"></textarea>
									</div>
								</div>
							</div>
							<%--상위작업--%>
							<div id="menu1" class="tab-pane fade">
								<table class="table table-striped table-bordered table-hover">
									<thead>
									<tr>
										<th style="text-align: center; width: 70px;">
											ID
										</th>
										<th style="text-align: center">
											작업
										</th>
										<th style="text-align: center; width: 150px; display:none;">
											상위작업 타입
										</th>
										<th style="text-align: center">

										</th>
									</tr>
									</thead>
									<tbody>
									<tr>
										<td style="text-align: center; width: 70px;">
											<input type="text" id="predcessor_task_id_0"
												   class="form-control "
												   style="text-align: center; padding-left: 0;"
											<%--체인지 할때마다 아래 테이블과 연동하는걸로.--%>
											<%--그냥 이건 연동시키던가 없애던가 합시다.--%>
												   onchange="/*ChangePredcessorTaskID(this, 0);*/" disabled>
											<input type="hidden" id="pid_0" value="">
										</td>
										<td style="text-align: center;">
											<select name="highWorkSel" id="highWorkSel" class="form-control"
													style="width: 100%;" onchange="ChangePredcessorTask(this, 0);"
													tabindex="-1" title="">

												<option value="1">새로운 작업</option>
												<option value="2">신약 개발</option>
											</select>
										</td>

										<td style="text-align: center; width: 70px;">
											<button onclick="DeletePredcessorTask(this, 0);"
													class="" style="display: inline-block;"
													type="button">
												<span class="glyphicon glyphicon-trash"> </span>
											</button>
											<input type="text" name="oriVal" id="oriVal" value="0"
												   style="display: none;">
										</td>
									</tr>
									</tbody>
								</table>
							</div>
							<%--산출물--%>
							<div id="menu2" class="tab-pane fade">
								<div class="tab-pane active" id="tab_1_4">
									<div id="fileList" style="width:100%;">
										<%--
										산출물 목록에 들어가 있어야 할 목록:
										작업 번호
										산출물 구분*
										제목* (파일제목)
										내용 (여기선 누락해도 될듯? )
										생성일
										수정일 >> 이걸로 보이면 될듯?
										--%>
										<table class="table table-striped table-bordered table-advance table-hover"
											   id="workProductTable">
											<thead>
											<tr>
												<th style="text-align: center; width: 20%;">
													산출물 구분
												</th>
												<th style="text-align: center; width: 40%;">
													파일명
												</th>
												<th style="text-align: center; width: 20%;">
													등록일
												</th>
												<%--테이블에 등록자가 없음...--%>
												<%--<th style="text-align: center; width: 10%;">
													등록자
												</th>--%>
												<th style="text-align: center; width: 7%;">
													삭제
												</th>
											</tr>
											</thead>
											<tbody>
											<tr id="d726674b-be83-4317-8f1f-4b984fc4890c">
												<td class="hidden-xs">
													설계검토결과
												</td>
												<td class="highlight">
													<img src="/Images/Files/jpg.png" style="width: 20px; float:left;">
													<a href="/File/FileDownloadByFileUid?fileUid=d726674b-be83-4317-8f1f-4b984fc4890c">★부록자료
														사용안내★.jpg</a>
												</td>
												<td class="hidden-xs" style="text-align: center;">
													v1
												</td>
												<td class="hidden-xs" style="text-align: center;">
													pmo01
												</td>


												<td style="text-align: center;">
													<button onclick="FileDelete('d726674b-be83-4317-8f1f-4b984fc4890c');"
															file_uid="d726674b-be83-4317-8f1f-4b984fc4890c"
															class="k-upload-action k-button-bare"
															style="display: inline-block;" type="button">
														<span class="glyphicon glyphicon-trash"> </span>
													</button>
												</td>
											</tr>

											</tbody>
										</table>

									</div>
								</div>
							</div>
							<%--가이드--%>
							<div id="menu3" class="tab-pane fade">
								<table class="table table-striped table-bordered table-advance table-hover"
									   id="projectAttachmentTable">
									<thead>
									<tr>
										<th style="text-align: center; width: 40%;">
											파일명
										</th>
										<%--
										<th style="text-align: center; width: 20%;">
											등록일
										</th>
										--%>
										<%--테이블에 등록자가 없음...--%>
										<%--<th style="text-align: center; width: 10%;">
											등록자
										</th>--%>
										<%--
										<th style="text-align: center; width: 7%;">
											삭제
										</th>
										--%>
									</tr>
									</thead>
									<tbody>
									<tr id="d726674b-be83-4317-8f1f-4b984fc4890c">
										<td class="hidden-xs">
											설계검토결과
										</td>
										<td class="highlight">
											<img src="/Images/Files/jpg.png" style="width: 20px; float:left;">
											<a href="/File/FileDownloadByFileUid?fileUid=d726674b-be83-4317-8f1f-4b984fc4890c">★부록자료
												사용안내★.jpg</a>
										</td>
										<td class="hidden-xs" style="text-align: center;">
											v1
										</td>
										<td class="hidden-xs" style="text-align: center;">
											pmo01
										</td>


										<td style="text-align: center;">
											<button onclick="FileDelete('d726674b-be83-4317-8f1f-4b984fc4890c');"
													file_uid="d726674b-be83-4317-8f1f-4b984fc4890c"
													class="k-upload-action k-button-bare"
													style="display: inline-block;" type="button">
												<span class="glyphicon glyphicon-trash"> </span>
											</button>
										</td>
									</tr>

									</tbody>
								</table>
							</div>
							<%--히스토리--%>
							<div id="menu4" class="tab-pane fade">
								<%--
								내용물:
								히스토리번호
								작업번호
								상태
								메모*
								변경날짜*
								팀원번호*
								--%>
								<div class="row">
									<div class="col-md-12">
										<table class="table table-striped table-bordered table-advance table-hover"
											   id="historyTable">
											<tr>
												<th>내용</th>
												<th>이름</th>
												<th>변경일자</th>
											</tr>
											<tr>
												<td>프로젝트 생성됨</td>
												<td>사람이름</td>
												<td>2020-02-22</td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" onclick="deleteWork()" id="deleteWorkBtn">삭제</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
					<button type="button" id="workDetailSubmitBtn" class="btn btn-primary"
							style="background: #1E2B44; outline: none; border: none;"
							onclick="editWork()">저장
					</button>
				</div>
			</div>
		</div>
	</div>
	<script>
        // 위에 작업 세부정보 수정
        function editWork () {
            ajaxUrl = 'updateWork.pr';
            // 값이 0이면 수정이 아니라 신규등록임
            if ($("#modalWorkNo").val() == 0) {
                ajaxUrl = 'projectWorkInsert.pr'
            }
            // alert("ajaxUrl: " + ajaxUrl);
            console.log('$("#modalWorkNo").val: ' + $("#modalWorkNo").val() + "\n" +
                '$("#workName").val: ' + $("#workName").val() + "\n" +
                '$("#startDate").val: ' + $("#startDate").val() + "\n" +
                '$("#completeDate").val: ' + $("#completeDate").val() + "\n" +
                '$("#memberNo").val: ' + $("#memberNo").val() + "\n" +
                '$("#grantor").val: ' + $("#grantor").val() + "\n" +
                '$("#memo").val: ' + $("#memo").val() + "\n" +
                '$("#highWorkSel").val: ' + $("#highWorkSel").val() + "\n"
            );
            // return;
            // 값을 통째로 다 업데이트 해버린다.
            $.ajax({
                url: ajaxUrl,
                type: 'post',
                data: {
                    workNo: $("#modalWorkNo").val(),
                    workName: $("#workName").val(),
                    startDate: $("#startDate").val(),
                    completeDate: $("#completeDate").val(),
                    memberNo: $("#memberNo").val(),
                    grantor: $("#grantor").val(),
                    memo: $("#memo").val(),
                    highWorkSel: $("#highWorkSel").val(),
                    pid: "${pid}",
                },
                success: function (data) {
                    // alert("done!");
                    console.log(data);
                    updateWorkList();
                    $("#workDetails").modal("toggle");
                },
                error: function (xhr, status, error) {
                    alert("ERROR!!");
                }

            })
        }

        function deleteWork () {
            if ($("#modalWorkNo").val() == 0) {
                alert("여기서 사용할 수 없는 기능입니다.");
                return;
            }
            $.ajax({
                url: "deleteWork.pr",
                type: 'post',
                data: {
                    workNo: $("#modalWorkNo").val(),
                },
                success: function (data) {
                    delInfo = data;
                    if (data.check > 0) {
                        alert("이 프로젝트에 하위작업이 존재합니다. 삭제할 수 없습니다.");
                        return;
                    }

                    updateWorkList();
                    $("#workDetails").modal("toggle");
                },
                error: function (xhr, status, error) {
                    alert("ERROR!!");
                }
            })
        }
	</script>

</body>
</html>

