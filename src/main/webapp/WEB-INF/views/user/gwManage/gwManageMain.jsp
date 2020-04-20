<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   List<GWork> list = (ArrayList<GWork>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
<link href="resources/fullcalendar/core/main.css" rel='stylesheet' />
<link href="resources/fullcalendar/daygrid/main.css" rel='stylesheet' />
<link href="resources/fullcalendar/timegrid/main.min.css"
   rel='stylesheet' />
<!-- <link href="resources/fullcalendar/css/main.css" rel='stylesheet' /> -->

<script src="resources/fullcalendar/core/main.js"></script>
<script src="resources/fullcalendar/daygrid/main.js"></script>
<script src="resources/fullcalendar/interaction/main.min.js"></script>
<script src="resources/fullcalendar/timegrid/main.min.js"></script>
<script src="resources/fullcalendar/core/locales/ko.js"></script>
<style type="text/css">
   #calendar {
   height: 800px;
   width: 1220px;
   overflow: hidden;
   font-size: 14px;
   }
   
   #external-events {
      position: fixed;
      z-index: 2;
      top: 20px;
      left: 20px;
      width: 150px;
      padding: 0 10px;
      border: 1px solid #ccc;
      background: #eee;
   }
   
   .demo-topbar+#external-events { /* will get stripped out */
      top: 60px;
   }
   
   #external-events .fc-event {
      margin: 1em 0;
      cursor: move;
   }
   
   #calendar-container {
      position: relative;
      z-index: 1;
      margin-left: 200px;
   }
   
   #calendar {
      max-width: 1220px;
      max-height: 900px;
      margin: 20px auto;
   }
    .fc-day-number.fc-sat.fc-past { color:#0000FF; }     /* 토요일 */
    .fc-day-number.fc-sun.fc-past { color:#FF0000; }    /* 일요일 */
</style>
</head>
<body onload="$('#route1').text('작업 관리'), $('#route2').text('일정 관리')">
   <div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 900px; margin: 0 auto; overflow: auto;">
   
   <!-- 내용영역 wrapper -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
          var Calendar = FullCalendar.Calendar;
          var Draggable = FullCalendarInteraction.Draggable;
       
          var containerEl = document.getElementById('external-events');
          var calendarEl = document.getElementById('calendar');
          var checkbox = document.getElementById('drop-remove');
       	  var gwType = "";
          // initialize the external events
          // -----------------------------------------------------------------
       
        /*   new Draggable(containerEl, {
            itemSelector: '.fc-event',
            eventData: function(eventEl) {
              return {
                title: eventEl.innerText
              };
            }
          }); */
       
          // initialize the calendar
          // -----------------------------------------------------------------
       
          var calendar = new Calendar(calendarEl, {
            plugins: [ 'interaction', 'dayGrid', 'timeGrid','list' ],
            header: {
              left: 'prev,next today',
              center: 'title',
              right: 'dayGridMonth,timeGridWeek,timeGridDay,listMonth'
            },
            dateClick: function(info) {
            	
                var beginDate = info.dateStr;
                var endDate = info.dateStr;
                
                console.log(beginDate);
                console.log(endDate);
                
                $("#beginDate").val(beginDate);
               $("#endDate").val(endDate);
                   	
        		$('#insertModal').modal('show');
        		
              },
              select: function(info) {
                alert('selected ' + info.startStr + ' to ' + info.endStr);
             },
            /* dateClick: function(info) {
            	
           	   alert(info);	
               alert('Clicked on :' + info.dateStr);
               alert('coodinates : ' + info.jsEvent.pageX+ ',' + info.jsEvent.pageY);
               alert('Current view: ' + info.view.type);
               info.dayEl.style.backgroundColor = 'orangered';
               
		               
            }, */
            //defaultDate 속성을 삭제하면 현재 날짜로 focus 됨.
            //defaultDate: '2019-04-12',
            navLinks: true, // can click day/week names to navigate views
            businessHours: true, // display business hours
            editable: true,
  			
            events: [
            
               <%
                  for(int i = 0; i < list.size(); i++) {
                     GWork gw = (GWork)list.get(i);
						if(gw.getGwType().equals("출장")){                  
               %>		
                       {
                          title : '<%=gw.getGwName() %>',
                          start: '<%=gw.getBeginDate() %>',
                          end : '<%=gw.getEndDate() %>',
                          constraint: 'businessHours',
                          color: '#61F3EB',   // an option!
                          textColor: 'black' // an option!                          
                       },
                       
                       
               <%	
						}
                  
             		  if(gw.getGwType().equals("일반작업")){                  
                   %>		
                           {
                              title : '<%=gw.getGwName() %>',
                              start: '<%=gw.getBeginDate() %>',
                              end : '<%=gw.getEndDate() %>',
                              constraint: 'businessHours',
                              color: '#82EB5A',   // an option!
                              textColor: 'black' // an option!
                           },
                   <%	
    					}
                  }
               %>
            ],
            //등록된 이벤트 클릭할 떄 나오는 함수
             eventClick: function(info) {

    			 var title = info.event.title;
    			 var start = info.event.start;
    			 var end = info.event.end;
    			 
    			 console.log(start);
    			 
    			 $("#gwName2").val(title);
    			 $("#beginDate2").val(start);
    			 $("#endDate2").val(end);
    			 
    			 $('#selectModal').modal('show');
    			 
 			 },	

	            
            /* calendar.on('dateClick', function(info) {
               console.log('clicked on' + info.dateStr);
            }), */
            locale: 'ko',
            editable: true,
            droppable: true, // this allows things to be dropped onto the calendar
            drop: function(info) {
              // is the "remove after drop" checkbox checked?
              if (checkbox.checked) {
                // if so, remove the element from the "Draggable Events" list
                info.draggedEl.parentNode.removeChild(info.draggedEl);
              }
            }
            
            
          });
       
          calendar.render();
        });
    
	    
    </script>
    <!-- 캘린더 영역 -->
    <div id="calendar"></div>
    
    
    <!-- 일정 상세보기 모달-->
		<div class="modal fade" id="selectModal" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;일정 상세보기</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		            <form id="workRegChange" action="myWorkChange.wk" method="post">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">제목</td>
							<td>
							<input type="text" id="gwName2" name="gwName" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId">시작
							</td>
							<td><input type="date" name="beginDate" id="beginDate2" class="inputMenu form-control" style="width: 280px;" required="required" readOnly></td>
						</tr>
						<tr>
							<td class="titleId">종료</td>
							<td>
							<input type="date" id="endDate2" name="endDate" class="inputMenu form-control" style="width: 280px;" readOnly required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">종일 일정</td>
							<td><input name="beginDate" id="beginDate1" type="text" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId">반복</td>
							<td><input name="completeDate" id="completeDate" type="text" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId" style="width: 130px;">설명</td>
							<td><input name="gwMemo" id="gwMemo2" type="text" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId">작업 종류</td>
							<td>
							<select name="gwType" id="gwType2" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="개발중" 
									<c:if test="${data.status == '개발중' }"> selected </c:if>>개발중</option>
									<option value="개발완료" 
									<c:if test="${data.status == '개발완료' }">selected</c:if>>개발완료</option>
									<option value="테스트완료" 
									<c:if test="${data.status == '테스트완료' }">selected</c:if>>테스트완료</option>
									<option value="PL검토중" 
									<c:if test="${data.status == 'PL검토중' }">selected</c:if>>PL검토중</option>
									<option value="PL검토완료" 
									<c:if test="${data.status == 'PL검토완료' }">selected</c:if>>PL검토완료</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">참석자</td>
							<td>
							<input type="text" id="memberNo2" name="memberNo" class="inputMenu form-control" style="width: 280px;" readOnly required="required">
							</td>
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
		          <button type="button" class="btn btn-primary" id="workChangeSubmit" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	  	
	  	
	  	 <!-- 일정 등록 모달-->
		<div class="modal fade" id="insertModal" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;일정 등록</h4>
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
							<input type="date" id="beginDate" name="beginDate" class="inputMenu form-control" style="width: 280px;" required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">종료</td>
							<td>
							<input type="date" id="endDate" name="endDate" class="inputMenu form-control" style="width: 280px;" required="required">
							</td>
						</tr>
						<tr>
							<td class="titleId">종일 일정</td>
							<td><input name="asdsad" id="asdsad" type="text" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId">반복</td>
							<td><input name="completeDate" id="completeDate" type="text" class="inputMenu form-control" style="width: 280px;" readOnly required="required"></td>
						</tr>
						<tr>
							<td class="titleId" style="width: 130px;">설명</td>
							<td><textarea name="gwMemo" id="gwMemo"  class="inputMenu form-control" style="width: 280px;"  required="required"></textarea></td>
						</tr>
						<tr>
							<td class="titleId">작업 종류</td>
							<td>
							<select name="gwType" id="gwType" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="일반작업" >일반작업</option>
									<option value="출장" >출장</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">참석자</td>
							<td>
							<input type="text" id="memberNo" name="memberNo" class="inputMenu form-control" style="width: 280px;"  required="required">
							</td>
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
		          <button type="button" class="btn btn-primary" id="gwSubmit" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
	  	</div><!-- /.modal -->
	  	
	  	<script>
	  	
	  		$("#gwSubmit").click(function(){
	  			
	  		   $.ajax({
	  		        type:'post',
	  		        url : "insertGw.gwm",
	  		        dataType : "json",
	  		        data:$("#gwInsertForm").serialize(),
	  		        contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	  		        success : function(data){
	  		        	console.log(data);
	  		      		$('#insertModal').modal('hide');
	  		        },
	  		        error:function(request,status,error){
	  		            
	  		       }
	  		    });
	  			
	  		});
	  	</script>
	  	
	  	
	  	
	  	
	  	
	  	
    </div>
    </div>
    </div>
    
    
    
    <!-- <div id="external-events">
      <p>
         <strong>Draggable Events</strong>
      </p>
      <div class="fc-event">My Event 1</div>
      <div class="fc-event">My Event 2</div>
      <div class="fc-event">My Event 3</div>
      <div class="fc-event">My Event 4</div>
      <div class="fc-event">My Event 5</div>
      <p>
         <input type="checkbox" id="drop-remove"> <label
            for="drop-remove">remove after drop</label>
      </p>
   </div> -->
   <!-- 내용영역 wrapper 끝 -->
</body>
</html>