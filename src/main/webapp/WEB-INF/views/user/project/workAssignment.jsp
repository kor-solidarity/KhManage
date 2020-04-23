<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp" />
<link href="resources/fullcalendar/core/main.css" rel='stylesheet' />
<link href="resources/fullcalendar/daygrid/main.css" rel='stylesheet' />
<link href="resources/fullcalendar/timegrid/main.min.css"
   rel='stylesheet' />
<!-- <link href="resources/fullcalendar/css/main.css" rel='stylesheet' /> -->

<script src="resources/fullcalendar/core/main.js"></script>
<script src="resources/fullcalendar/daygrid/main.js"></script>
<script src="resources/fullcalendar/interaction/main.min.js"></script>
<script src="resources/fullcalendar/timegrid/main.min.js"></script>
<script src="resources/fullcalendar/rrule/main.js"></script>
<script src="resources/fullcalendar/core/locales/ko.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment-with-locales.min.js" integrity="sha256-AdQN98MVZs44Eq2yTwtoKufhnU+uZ7v2kXnD5vqzZVo=" crossorigin="anonymous"></script>

</head>
<body>
	<body onload="$('#route1').text('프로젝트 센터')">
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width: 100%; height: 600px; margin: 0 auto; overflow: auto;">
			
			   <div style="margin-left:50px; margin-top: 10px; margin-bottom: 10px;"></div>
			</div>
		</div>
	</div>
	

</body>
</html>