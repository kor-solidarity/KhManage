<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*, com.kh.manage.forum.model.vo.*"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<%
	List<Statistics> list2 = (ArrayList<Statistics>) request.getAttribute("list2");
%>
<%
	List<Statistics> list3 = (ArrayList<Statistics>) request.getAttribute("list3");
%>
<%
	List<Statistics> list4 = (ArrayList<Statistics>) request.getAttribute("list4");
%>
<%
	List<Mwork> list5 = (ArrayList<Mwork>) request.getAttribute("list5");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.bundle.min.js"></script>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.8.0/Chart.min.js"></script>
<style>

.select{width: 49%; height: 25px; border-radius: 5px;}
.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.tableDiv{margin-left: 40px;}
.projectInfoTable{width:90%; margin: 5px; font-size: 13px;}
.pjtTd{width: 25%; height: 40px; font-weight:bold; color:#5E738B}
.pjtTd2{width: 30%;}
.pjtTd3{width: 20%; font-weight:bold; color:#5E738B}
.pjtTd4{width: 30%;}
.td{padding-left: 5px;}
#myChart,#myChart2,#myChart3{
	margin-left: 250px;
	height: 250px;
}
.scheduler_default_corner_inner{
		display:none !important;
	}
	.scheduler_default_tree_image_no_children{
		display:none !important;
	}
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
		background: #4F5467 !important;
		color: white !important;
	}
	.scheduler_default_main{
		border: 1px #4F5467 #1E2B44;
	}
</style>

</head>
<body onload="$('#route1').text('대시보드'); $('#route2').text('상세대시보드')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<div id="wrap">
	
		<br>
		<div class="panel-heading pnselect" style="margin-top: -20px;">
			<select class="select">
			<c:forEach var="p" items="${list}">
				<option class="option" value="${p.projectPk}">${p.projectName}</option>
			</c:forEach>
			</select>
		</div>

		<div class="" style="margin-top: -15px;">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>프로젝트 정보</b>
							<hr>
								<div class="tableDiv">
									<table border="0" class="projectInfoTable">
										<tr>
											<td class="pjtTd td">프로젝트 명</td>
											<td class="pjtTd2 td"><c:out value="${pro.projectName }"/></td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">프로젝트 번호</td>
											<td class="pjtTd2 td"><c:out value="${pro.projectPk }"/></td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">개발 형태</td>
											<td class="pjtTd2 td">
											
											${pro.projectTypePk}
											
											</td>
											<td class="pjtTd3 td">개발 등급</td>
											<td class="pjtTd4 td"><c:out value="${pro.projectRank }"/></td>
										</tr>
										<tr>
											<td class="pjtTd td">PMO</td>
											<td class="pjtTd2 td"><c:out value="${pro.projectManager }"/></td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td colspan="4" class="pjtTd td">제품기능(설명)</td>
										</tr>
										<tr>
									 		<td colspan="4" class="pjtTd td"><c:out value="${pro.detail }"/></td>
										</tr>
									</table>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>프로젝트 태스크 진행상태</b>
							<hr>
								<div id="task">
								<canvas id="myChart" width="400" height="400"></canvas>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
				
		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>이슈 현황</b>
							<hr>
								<div class="chart-none-data">
									<div id="issue"><!-- No data available -->
									<canvas id="myChart2" width="400" height="400"></canvas>	
									</div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>변경요청</b>
							<hr>
								<div id="change">
								<canvas id="myChart3" width="400" height="400"></canvas>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>작업배정 현황</b>
							<hr>
								<div class="">
									<div id="dp"></div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

	</div>
	
	<script type="text/javascript">



    var dp = new DayPilot.Scheduler("dp");

    dp.startDate = "2020-04-01";
    dp.days = 366;
    dp.scale = "Day";
    dp.timeHeaders = [
        { groupBy: "Month", format: "MMMM yyyy" },
        { groupBy: "Day", format: "d" }
    ];

    dp.contextMenu = new DayPilot.Menu({items: [
        {text:"Edit", onClick: function(args) { dp.events.edit(args.source); } },
        {text:"Delete", onClick: function(args) { dp.events.remove(args.source); } },
        {text:"-"},
        {text:"Select", onClick: function(args) { dp.multiselect.add(args.source); } },
    ]});

    dp.treeEnabled = true;
    dp.treePreventParentUsage = true;
    
    
    
    dp.resources = [
    	<% for(int i=0; i < list5.size(); i++){
    		 Mwork w = (Mwork)list5.get(i);
    	%>
    	 	 {
    		    "name": "<%=w.getMemberName()%>",
    		    "id":   "<%=w.getMemberName()%>"
    		  },
    	<%}%>
    		]

    dp.heightSpec = "Max";
    dp.height = 500;
	var e;
     dp.events.list = [];
	
    	<%for(int i=0; i < list5.size(); i++){
		 Mwork w = (Mwork)list5.get(i);
		 if(w.getWorkName() != null){
		%>
        e = {
            start: new DayPilot.Date("<%=w.getBeginDate()%>T12:00:00"),
            end: new DayPilot.Date("<%=w.getCompleteDate()%>T12:00:00"),
            id: DayPilot.guid(),
            resource: "<%=w.getMemberName()%>",
            text: "<%=w.getWorkName()%>",
            bubbleHtml: "Event",
            memo : "<%=w.getMemo()%>",
        },
        dp.events.list.push(e),
        <%}}%> 
        
        
        //이벤트 클릭 했을 때
        dp.onEventClicked = function(args) {
        	  console.log(args.e.data)
        	  console.log(args.e.data.text)
        	  
        	 var name = args.e.data.text;
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
        	 $("#gwMemo").val(memo);
        	  
        	 $("#workSelect").modal('show');
        	  
        	  
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
    	$(".scheduler_default_corner").empty();
    })
   

</script>
	<div class="modal fade" id="workSelect" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;일정</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		            <form id="gwInsertForm" action="insertGw.gwm" method="post">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">제목</td>
							<td>
							<input type="text" id="gwName" name="gwName" class="inputMenu form-control" style="width: 280px;"  required="required"></td>
						</tr>
						<tr>
							<td class="titleId">시작</td>
							<td>
							<input type="date" id="beginDate" name="beginDate2" class="inputMenu form-control" style="width: 280px;" required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">종료</td>
							<td>
							<input type="date" id="endDate" name="endDate2" class="inputMenu form-control" style="width: 280px;" required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">종일 일정</td>
							<td><input  name="check" id="check" type="checkbox" checked="checked" checked></td>
						</tr>
						<tr>
							<td class="titleId" style="width: 130px;">설명</td>
							<td><textarea name="gwMemo" id="gwMemo"  class="inputMenu form-control" style="width: 280px;"  required="required"></textarea></td>
						</tr>
						<tr>
							<td class="titleId">리소스</td>
							<td>
							<input type="text" id="memberNo" name="memberNo" class="inputMenu form-control" style="width: 280px;"  required="required">
							</td>
						</tr>
						<tr>
							<td><input type="hidden" id="bDate2" name="bDate"></td>
							<td><input type="hidden" id="bTime2" name="bTime"></td>
							<td><input type="hidden" id="eDate2" name="eDate"></td>
							<td><input type="hidden" id="eTime2" name="eTime"></td>
						</tr>
					 </table>
					</form>
		            </div>
		            <div class="row">
		              <div class="col-sm-9">
		                <div class="row"></div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	  	
	
	<script>
	
	
		$(".select").change(function(){
			console.log("dsadsadsa");
			console.log($(this).val());
			var	pNo = $(this).val();
			
			location.href = "selectDashBoard.gwm?pNo="+pNo;
			
			
		});
		
	</script>
	<script>
	<% if(list2.size() > 0){ %>
	var ctx = document.getElementById('myChart');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: [
			<%for(int i =0; i < list2.size(); i++){
				 Statistics st = (Statistics)list2.get(i);
			%> 
			
				'<%=st.getwStatus() %>',
			<%
			}
			%>
			],
			datasets: [{
				label: '# of Votes',
				data: [
					<%for(int i =0; i < list2.size(); i++){
						 Statistics st = (Statistics)list2.get(i);
					%> 
					
						<%=st.getCnt()%>,
					<%
					}
					%>	
				],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1,
				
				hoverBorderWidth : 1
			}]
		},
		options: {
			responsive: false,
			scales: {
					ticks: {
						cutoutPercentage: 60,
						beginAtZero: true
					}
			},
		}
	});
	<%}else {%>
	$("#task").text("No data available");
	<%}%>
</script>
<script>

	var size = <%=list3.size()%>;
	console.log(size);

	<% if(list3.size() > 0){ %>
	var ctx = document.getElementById('myChart2');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: [
			<%for(int i =0; i < list3.size(); i++){
				 Statistics st = (Statistics)list3.get(i);
			%> 
			
				'<%=st.getIssueType() %>',
			<%
			}
			%>
			],
			datasets: [{
				label: '# of Votes',
				data: [
					<%for(int i =0; i < list3.size(); i++){
						 Statistics st = (Statistics)list3.get(i);
					%> 
					
						<%=st.getCnt2()%>,
					<%
					}
					%>	
				],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
					ticks: {
						cutoutPercentage: 60,
						beginAtZero: true
					}
			},
		}
	});
	<%}else {%>
	
		$("#issue").text("No data available");
	<%}%>
</script>
<script>
	<% if(list4.size() > 0){ %>
	var ctx = document.getElementById('myChart3');
	var myChart = new Chart(ctx, {
		type: 'doughnut',
		data: {
			labels: [
				<%for(int i =0; i < list4.size(); i++){
					 Statistics st = (Statistics)list4.get(i);
				%> 
				
					'<%=st.getIssueType() %>',
				<%
				}
				%>
				],
			datasets: [{
				label: '# of Votes',
				data: [
					<%for(int i =0; i < list4.size(); i++){
						 Statistics st = (Statistics)list4.get(i);
					%> 
					
						<%=st.getCnt3()%>,
					<%
					}
					%>	
				],
				backgroundColor: [
					'rgba(255, 99, 132, 0.2)',
					'rgba(54, 162, 235, 0.2)',
					'rgba(255, 206, 86, 0.2)',
					'rgba(75, 192, 192, 0.2)',
					'rgba(153, 102, 255, 0.2)',
					'rgba(255, 159, 64, 0.2)'
				],
				borderColor: [
					'rgba(255, 99, 132, 1)',
					'rgba(54, 162, 235, 1)',
					'rgba(255, 206, 86, 1)',
					'rgba(75, 192, 192, 1)',
					'rgba(153, 102, 255, 1)',
					'rgba(255, 159, 64, 1)'
				],
				borderWidth: 1
			}]
		},
		options: {
			responsive: false,
			scales: {
					ticks: {
						cutoutPercentage: 60,
						beginAtZero: true
					}
			},
		}
	});
	<%}else {%>
	
	$("#change").text("No data available");
	<%}%>
</script>	
</body>
</html>