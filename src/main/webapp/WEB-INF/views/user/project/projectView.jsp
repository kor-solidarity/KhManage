<%@ page contentType="text/html; charset=UTF-8" language="java" %>
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
<body onload="$('#route1').text('프로젝트 등록')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp"/>

</body>
</html>
