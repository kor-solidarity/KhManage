<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.gwManage.model.vo.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
   List<GWork> list = (ArrayList<GWork>) request.getAttribute("list");
%>
<%-- <%
   List<Schedule> list = (ArrayList<Schedule>) request.getAttribute("scheduleList");
%> --%>
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
   
</style>
</head>
<body>
   <!-- 내용영역 wrapper -->
    <script>
    document.addEventListener('DOMContentLoaded', function() {
          var Calendar = FullCalendar.Calendar;
          var Draggable = FullCalendarInteraction.Draggable;
       
          var containerEl = document.getElementById('external-events');
          var calendarEl = document.getElementById('calendar');
          var checkbox = document.getElementById('drop-remove');
       
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
               alert('Clicked on :' + info.dateStr);
               alert('coodinates : ' + info.jsEvent.pageX+ ',' + info.jsEvent.pageY);
               alert('Current view: ' + info.view.type);
               info.dayEl.style.backgroundColor = 'orangered';
            },
            //defaultDate 속성을 삭제하면 현재 날짜로 focus 됨.
            //defaultDate: '2019-04-12',
            navLinks: true, // can click day/week names to navigate views
            businessHours: true, // display business hours
            editable: true,
            events: [
            	
            	  <%
                  for(int i = 0; i < list.size(); i++) {
                     GWork gw = (GWork)list.get(i);
                  
               %>
                       {
                          title : '<%=gw.getGwName() %>',
                          start: '<%=gw.getBeginDate() %>',
                          end : '<%=gw.getEndDate() %>',
                          constraint: 'businessHours'
                       },
                 <%
                  }
               %>

              
            ],
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
    <div id="calendar"></div>
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