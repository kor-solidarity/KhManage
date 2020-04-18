<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--도무지 어떻게 해야할지 답이 안나오고 있어서 테이블용으로 제작...--%>
<%--죽고싶다... 진짜 죽고싶다--%>
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
									 data-toggle="dropdown"
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
			<div style="margin-right: 0px; width: 862px; height: 898px; padding: 0px; border-left: 1px  gray solid; display: inline-block">
				<table border="1" style="height: 50px" class="chart-left-table" id="chart-left-table">
					<tr class=" chart-left-top" style="height: 60px">
						<%--ID--%>
						<th style="width: 30px">ID</th>
						<%--작업명--%>
						<th style="width: 250px">작업명</th>
						<%--상태--%>
						<th style="width: 40px">상태</th>
						<%--기간--%>
						<th style="width: 60px">기간</th>
						<%--시작--%>
						<th style="width: 110px">시작</th>
						<%--완료--%>
						<th style="width: 110px">완료</th>
						<%--선행작업--%>
						<th style="width: 60px">선행작업</th>
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
			<div class="gantt-div" style="">
				<%--
				<script type="text/javascript">
					google.charts.load('current', { 'packages': ['gantt'] });
					google.charts.setOnLoadCallback(drawChart);

					function daysToMilliseconds (days) {
						return days * 24 * 60 * 60 * 1000;
					}

					function drawChart () {

						var data = new google.visualization.DataTable();
						data.addColumn('string', 'Task ID');
						data.addColumn('string', 'Task Name');
						data.addColumn('date', 'Start Date');
						data.addColumn('date', 'End Date');
						data.addColumn('number', 'Duration');
						data.addColumn('number', 'Percent Complete');
						data.addColumn('string', 'Dependencies');

						data.addRows([
							[
								'Research', 'Find sources',
								new Date(2015, 0, 1), new Date(2015, 0, 5), null, 100, null],
							[
								'Write', 'Write paper',
								null, new Date(2015, 0, 9), daysToMilliseconds(3), 25, 'Research,Outline'],
							[
								'Cite', 'Create bibliography',
								null, new Date(2015, 0, 7), daysToMilliseconds(1), 20, 'Research'],
							[
								'Complete', 'Hand in paper',
								null, new Date(2015, 0, 10), daysToMilliseconds(1), 0, 'Cite,Write'],
							[
								'Outline', 'Outline paper',
								null, new Date(2015, 0, 6), daysToMilliseconds(1), 100, 'Research']
						]);

						var options = {
							height: 275
						};

						var chart = new google.visualization.Gantt(document.getElementById('chart_div'));

						chart.draw(data, options);
					}
				</script>
				--%>
				<div id="chart-div">
					<%--날짜 표기부분. 너비는 일수에 따라 유동적으로 움직이게끔.--%>
					<div class="gantt-date" style="width: 2760px ;/*border: 1px orangered solid;*/">
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
						<table class="gantt-table">
							<%--월 표기--%>
							<tr>
								<th colspan="31">2020년 3월</th>
								<th colspan="30">2020년 4월</th>
							</tr>
							<tr>
								<%--3월--%>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
								<td>13</td>
								<td>14</td>
								<td>15</td>
								<td>16</td>
								<td>17</td>
								<td>18</td>
								<td>19</td>
								<td>20</td>
								<td>21</td>
								<td>22</td>
								<td>23</td>
								<td>24</td>
								<td>25</td>
								<td>26</td>
								<td>27</td>
								<td>28</td>
								<td>29</td>
								<td>30</td>
								<td>31</td>
								<%--4월--%>
								<td>1</td>
								<td>2</td>
								<td>3</td>
								<td>4</td>
								<td>5</td>
								<td>6</td>
								<td>7</td>
								<td>8</td>
								<td>9</td>
								<td>10</td>
								<td>11</td>
								<td>12</td>
								<td>13</td>
								<td>14</td>
								<td>15</td>
								<td>16</td>
								<td>17</td>
								<td>18</td>
								<td>19</td>
								<td>20</td>
								<td>21</td>
								<td>22</td>
								<td>23</td>
								<td>24</td>
								<td>25</td>
								<td>26</td>
								<td>27</td>
								<td>28</td>
								<td>29</td>
								<td>30</td>
							</tr>
							<%--여기 아이디에는 프로젝트작업 아이디 식별자가 필요할듯--%>
							<tr id="">
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td colspan="10" style="background: blue; text-align: center; color: whitesmoke">무슨작업
								</td>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<%--								<td></td>--%>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
								<td></td>
							</tr>
						</table>
					</div>
				</div>
				<script>
                    // 작업 추가를 누르면 어떤거든간에 우선 테이블 맨위에 띄우게끔.
                    function add_project_work (location) {
                        // todo 위치 어디로 보낼지 생각좀.
                        // 우선은 그냥 맨위
                        $("#chart-left-table tr:first-of-type").after(
                            // todo 고도화, 그니까 각종 유효성. 우선은 통과.
                            "<tr class='work_input'>" +
                            "<td></td>" +
                            // 작업 제목
                            "<td><input type='text' style='width: 100%' class='' name='workName'></td>" +
                            // 상태
                            "<td></td>" +
                            // 기간
                            "<td></td>" +
                            // 시작일
                            "<td><input class='' type='date' name='beginDate' id=''></td>" +
                            // 완료일
                            "<td><input class='' type='date' name='beginDate' id=''></td>" +
                            // 선행작업
                            "<td><input class='' style='width: 60px' type='text' name='highWorkNo' id='' ></td>" +
                            // 완료율
                            "<td></td>" +
                            // 담당자
                            "<td  data-toggle=\"modal\" data-target=\"#myModal5\"></td>" +
                            // 돋보기마크
                            "<td></td>" +
                            "</tr>"
                        )

                    }

                    // 좌측 테이블칸을 누르면
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
	<div class="modal fade" id="myModal5" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
							aria-hidden="true">&times;</span></button>
					<h4 class="modal-title" id="myModalLabel">Modal title</h4>
				</div>
				<div class="modal-body">
					...
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
					<button type="button" class="btn btn-primary">Save changes</button>
				</div>
			</div>
		</div>
	</div>
	<%--작업 상세보기 모달창--%>

</body>
</html>

