<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<body>
<script>
		window.onload = function(){
			
			swal({
			  	title: "${requestScope.msg}",
			  	text: "",
			    icon: "warning"
			  }).then((value) => {
				  history.go(-1);
			    });
			
			//history.go(-1);
		};
	</script>
</body>
</html>