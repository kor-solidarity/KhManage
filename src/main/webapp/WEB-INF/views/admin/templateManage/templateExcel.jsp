<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.admin.template.model.vo.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
   List<TemplateWork> list = (ArrayList<TemplateWork>) request.getAttribute("list");
%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- demo stylesheet -->
    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/helpers/demo.css" />
    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/helpers/media/layout.css" />
    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/helpers/media/elements.css" />
	<!-- helper libraries -->
    <!-- daypilot themes -->
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/areas.css" />
	
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_white.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_green.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_transparent.css" />
    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/month_traditional.css" />

	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/navigator_8.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/navigator_white.css" />

	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_transparent.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_white.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_green.css" />
    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/calendar_traditional.css" />

    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_8.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_white.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_green.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_blue.css" />
    <link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_traditional.css" />
	<link type="text/css" rel="stylesheet" href="resources/daypilot/demo/themes/scheduler_transparent.css" />

	<script src="resources/daypilot/demo/helpers/jquery-1.12.2.min.js" type="text/javascript"></script>
	<!-- daypilot libraries -->
    <script src="resources/daypilot/demo/js/daypilot-all.min.js" type="text/javascript"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jQuery-slimScroll/1.3.8/jquery.slimscroll.min.js" integrity="sha256-qE/6vdSYzQu9lgosKxhFplETvWvqAAlmAuR+yPh/0SI=" crossorigin="anonymous"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

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
			padding: 0px;
			border-right: 1px gray solid;
			display: inline-block;
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
	
	a:link {
	 color: inherit;
	 text-decoration: none;
	}
	
 	a:visited {
 	 color: inherit;
 	 text-decoration: none;
 	}
 	
 	a:active {
 	 color: inherit;
 	 text-decoration: none;
 	}
 	
 	a:hover {
 	 color: inherit;
 	 text-decoration: none;
 	}

	#projectTable{
		width:100%;
		text-align:left;
	}
	.projectBtn{
		width:130px;
		height:27px;
		border:none;
		background:#1E2B44;
		color:white;
		font-weight:600;
		border-radius: 5px;
		margin-right:6px;
		font-size:14px;
	}
	.tdText{
		text-align:center;
		height:30px;
		font-size:14px;
	}
	.thRange{
		background:#F3F3F3;
		color:#626262;
		font-size:15px;
		border:#B0B0B0 1px solid;
		height:35px;
		padding:3px;
	}
	.th1{
		width:220px;
		text-indent: 5px;
	}
	.td1{
		text-indent: 5px;
		color:#71A8D7;
	}
	.trRange{
		border:1px solid #B0B0B0;
		width:30px;
	}
	.inputCss{
		border-radius: 5px;
		border:none;
	}
	.buseoSelect{
		width:180px;
		border:1px solid #626262;
		height:25px;
		border-radius: 5px;
	}
	
	.issueOpen{
		width:70px;
		height:25px;
		background:#89C4F4;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueCpl{
		width:70px;
		height:25px;
		background:#45B6AF;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueAll{
		width:70px;
		height:25px;
		background:#5D6B7A;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueReturn{
		width:70px;
		height:25px;
		background:#F3565D;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueCancel{
		width:70px;
		height:25px;
		background:#C6C6C6;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueComp{
		width:70px;
		height:25px;
		background:#428bca;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueEnd{
		width:70px;
		height:25px;
		background:#428bca;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.pagingArea{
      background:#F3F3F3;
      height:50px;
      border:1px solid #B0B0B0;
   }
   .paging{
      margin-left:200px;
      width:50%;
   }
   
   .changeList{
   		list-style: none;
    	margin: 0px;
    	padding: 0px;
    	max-width: 900px;
    	width: 100%;
   }
   
   .changeList li{
    display: inline-block;
    width:150px;
    height:40px;
    padding: 10px;
    border: 1px solid #efefef;
    font-size: 14px;
    cursor: pointer;
   }
   #requestLi{
   	background:white;
   	text-align:center;
   	font-weight:bold;
   	border-top:1px solid black;
   	border-bottom:none;
   }
   
   #approveLi{
   	background:#1E2B44;
   	color:white;
   	text-align:center;
   	border-bottom:2px solid white;
   }
   /* .scheduler_default_corner_inner{
		display:none !important;
	}
	.scheduler_default_tree_image_no_children{
		display:none !important;
	} */
	 .scheduler_default_event_inner{
		background: #617E84 !important;
		color : white !important;
		text-align: center  !important;
		font-weight: bold;
		vertical-align:middle !important;
	} 
	  .scheduler_default_event_bar{
		background: white !important;
	}
	.scheduler_default_event_bar_inner{
		background: white !important;	
	} 
	.scheduler_default_rowheader_scroll,.scheduler_default_rowheader_inner,.scheduler_default_timeheadergroup_inner, .scheduler_default_timeheader_cell_inner
	,.scheduler_default_corner{
		background: white !important;
		color: black !important;
	}
	.scheduler_default_main{
		border: 1px #4F5467 #1E2B44;
	} 
	/* .scheduler_default_rowheader_scroll,.scheduler_default_corner{
		border : none !important;
		display: none !important;
	} */
	.scheduler_default_main{
	
	}
	#dp{
	}
	
	#chart{
		width: 58%;
		height: 100%;
		display: inline-block;
		float: right;
	}
	/* .scheduler_default_scrollable{
		height: 2000px !important;
	} */

	.scheduler_default_columnheader_cell{
	}
	
	.scheduler_default_columnheader_splitter{
	}
	
	.divv1{
		height: 59px;
		width: 77px;
		float: left;
		border: 1px solid #dcdcdc;
		text-align: center;
	}
	.divv2{
		width:226px;
		height: 59px;
		float: left;
		border: 1px solid #dcdcdc;
		text-align: center;
	}
	.divv3{
		width:79px;
		height: 59px;
		float: left;
		border: 1px solid #dcdcdc;
		text-align: center;
	}
	.divv4{
		width:79px;
		height: 59px;
		float: left;
		border: 1px solid #dcdcdc;
		text-align: center;
	}
	.p{
		font-size: 14px;
		font-weight: bold;
		margin-top: 24px;
	}
	
</style>
</head>
<body onload="$('#route1').text('관리자'), $('#route2').text('템플릿 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
		<div class="changePanel">
			<div class="panel panel-headline">
		
			<br><br>
			<ul class="changeList">
				<li id="approveLi"><a href="templateManagePage.am">등록정보</a>
				</li>
				<li id="requestLi"><a href="templateExcel.am">WBS</a>
				</li>
			</ul>
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
		<div style="width: 100%; height: 900px; float: left; /*padding: 0;*/ /*border: 1px red solid;*/">
			<%--차트 좌측 목록--%>
			<%-- <div style="margin-right: 0px; width: 662px; height: 898px; padding: 0px; border-left: 1px  gray solid; float: left">
				<table border="1" style="height: 50px" class="chart-left-table" id="chart-left-table">
					<tr class=" chart-left-top" style="height: 60px">
						ID
						<th style="width: 60px">WBS</th>
						작업명
						<th style="width: 300px">작업명</th>
						기간
						<!-- <th style="width: 70px">기간</th> -->
						시작
						<th style="width: 160px">시작</th>
						완료
						<th style="width: 160px">완료</th>
						선행작업
						<!-- <th style="width: 100px">선행작업</th> -->
						돋보기(상세정보)
						<th style="width: 40px"><i class="fas fa-search" data-toggle="modal"></i></th>
					</tr>
					
					<c:forEach var="t" items="${list }"> 
					<tr>
						<td><c:out value="${t.wNo}"/> </td>
						<td><c:out value="${t.wName}"/></td>
						<!-- <td>10</td> -->
						<td><c:out value="${t.beginDate}"/></td>
						<td><c:out value="${t.completeDate}"/></td>
						<!-- <td>홍길동</td> -->
						<td><i class="fas fa-search"></i></td>
					</tr>
					</c:forEach>
										
				</table>
			</div> --%>
			<div  id="dp"></div>
			 	
			<%--차트 우측: 간트차트--%>
			<!-- <div class="gantt-div" style=""></div> -->
			
			</div>
		
			</div></div>
</body>
<script type="text/javascript">



    var dp = new DayPilot.Scheduler("dp");

    dp.startDate = "2020-02-01";
    dp.days = 366;
    dp.scale = "Day";
    dp.timeHeaders = [
        { groupBy: "Month", format: "MMMM yyyy" },
        { groupBy: "Day", format: "d" }
    ];
    
    dp.rowHeaderColumns = [
    	  { text: 'WBS', display: "no" },
    	  { text: '작업명', display: "name" },
    	  { text: '시작', display: "begin" },
    	  { text: '완료', display: "com" }
    ];
    
   // dp.rowHeaderHideIconEnabled = true ;
    
     dp.resources = [
    	<% for(int i=0; i < list.size(); i++){
    		TemplateWork w = (TemplateWork)list.get(i);
    	%>
    	 	 {
    		    "id":   "<%=w.getwName()%>",
    		    "no":  '<%=w.getwNo()%>',
    		    "name": "<%=w.getwName()%>",
    		    "begin" : "<%=w.getBeginDate()%>",
    		    "com" : "<%=w.getCompleteDate()%>",
    		    
    		  },
    	<%}%>
    		]

    //dp.heightSpec = "Max";
    dp.height = 600;
	var e;
     dp.events.list = [];
	
    	<%for(int i=0; i < list.size(); i++){
		 TemplateWork w = (TemplateWork)list.get(i);
		 if(w.getwName() != null){
		%>
        e = {
            start: new DayPilot.Date("<%=w.getBeginDate()%>T12:00:00"),
            end: new DayPilot.Date("<%=w.getCompleteDate()%>T12:00:00"),
            id: DayPilot.guid(),
            resource: "<%=w.getwName()%>",
            text: "<%=w.getwName()%>",
            bubbleHtml: "Event",
        },
        dp.events.list.push(e),
        <%}}%> 
        
        
        //이벤트 클릭 했을 때
        dp.onEventClicked = function(args) {
        	  console.log(args.e.data)
        	  console.log(args.e.data.text)
        	  
        	/*  var name = args.e.data.text;
        	 var start = args.e.data.start.value;
        	 var end = args.e.data.end.value;
        	 console.log(start) 
        	 var start2 = start.substring(0, 10);
        	 var end2 = end.substring(0, 10);
        	 var memo = args.e.data.memo;
        	 
        	if(memo == null){
        		memo = "";
        	}
        	 
        	 console.log(start2)
        	 
         	 $("#gwName").val(name); 
        	 $("#beginDate").val(start2);
        	 $("#endDate").val(end2);
        	 //$("#gwMemo").val(memo); */
        	  
        	// $("#workSelect").modal('show');
        	  
        	  
        };
        

   
    dp.eventMovingStartEndEnabled = true;
    dp.eventResizingStartEndEnabled = true;
    dp.timeRangeSelectingStartEndEnabled = true;

    // event moving
    dp.onEventMoved = function (args) {
        dp.message("Moved: " + args.e.text());
    };

    dp.onEventMoving = function(args) {
        if (args.e.resource() === "A" && args.resource === "B") {  // don't allow moving from A to B
            args.left.enabled = false;
            args.right.html = "You can't move an event from Room 1 to Room 2";

            args.allowed = false;
        }
        else if (args.resource === "B") {  // must start on a working day, maximum length one day
            while (args.start.getDayOfWeek() === 0 || args.start.getDayOfWeek() === 6) {
                args.start = args.start.addDays(1);
            }
            args.end = args.start.addDays(1);  // fixed duration
            args.left.enabled = false;
            args.right.html = "Events in Room 2 must start on a workday and are limited to 1 day.";
        }

        if (args.resource === "C") {
            var except = args.e.data;
            var events = dp.rows.find(args.resource).events.all();

            var start = args.start;
            var end = args.end;
            var overlaps = events.some(function(item) {
                return item.data !== except && DayPilot.Util.overlaps(item.start(), item.end(), start, end);
            });

            while (overlaps) {
                start = start.addDays(1);
                end = end.addDays(1);

                overlaps = events.some(function(item) {
                    return item.data !== except && DayPilot.Util.overlaps(item.start(), item.end(), start, end);
                });
            }

            if (args.start !== start) {
                args.start = start;
                args.end = end;

                args.left.enabled = false;
                args.right.html = "Start automatically moved to " + args.start.toString("d MMMM, yyyy");
            }

        }
    };

    // event resizing
    dp.onEventResized = function (args) {
        dp.message("Resized: " + args.e.text());
    };

    // event creating
    dp.onTimeRangeSelected = function (args) {
        DayPilot.Modal.prompt("New event name:", "New Event").then(function(modal) {
            dp.clearSelection();
            var name = modal.result;
            if (!name) return;
            var e = new DayPilot.Event({
                start: args.start,
                end: args.end,
                id: DayPilot.guid(),
                resource: args.resource,
                text: name
            });
            dp.events.add(e);
            dp.message("Created");
        });
    };

    dp.onEventMove = function(args) {
        if (args.ctrl) {
            var newEvent = new DayPilot.Event({
                start: args.newStart,
                end: args.newEnd,
                text: "Copy of " + args.e.text(),
                resource: args.newResource,
                id: DayPilot.guid()  // generate random id
            });
            dp.events.add(newEvent);

            // notify the server about the action here

            args.preventDefault(); // prevent the default action - moving event to the new location
        }
    };

    dp.init();

    dp.scrollTo("2020-02-01");

    function barColor(i) {
        var colors = ["#3c78d8", "#6aa84f", "#f1c232", "#cc0000"];
        return colors[i % 4];
    }
    function barBackColor(i) {
        var colors = ["#a4c2f4", "#b6d7a8", "#ffe599", "#ea9999"];
        return colors[i % 4];
    }
    $(function(){
    	$(".scheduler_default_corner").children().eq(3).remove();	
    	
    	$(".scheduler_default_corner_inner").remove();
    	
    	/* $(".scheduler_default_corner").children().eq(0).remove();
    	
    	$(".scheduler_default_divider").remove();
    	
    	$(".scheduler_default_columnheader_cell").remove();
    	$(".scheduler_default_columnheader_cell_inner").remove();
    	$(".scheduler_default_columnheader_splitter").remove(); */
    	
    	//$(".scheduler_default_corner").append("<div class='divv1'><p class='p'>WBS<p></div> <div class='divv2'><p class='p'>작업명</p></div>  <div class='divv3'><p class='p'>시작</p></div> <div class='divv4'><p class='p'>완료</p></div>")
    	
    	
    })
    

</script>


</html>




