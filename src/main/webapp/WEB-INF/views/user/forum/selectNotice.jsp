<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp" />
<style>

.projectBtn {
	width: 130px;
	height: 27px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 600;
	border-radius: 5px;
	margin-right: 6px;
	font-size: 14px;
}


.pagingArea {
	background: #F3F3F3;
	height: 50px;
	border: 1px solid #B0B0B0;
}

.paging {
	margin-left: 200px;
	width: 50%;
}

.wjs_btn{
      /* width:70px; */
      height:30px;
      border:none;
      background: #1E2B44;
      color:white;
      font-weight:600;
      border-radius: 5px;
      font-size:14px;
      margin-left: 10px;
      margin-top: 24px;
      float: left;
      
   } 

	#noticeTable{
		width:95%;
		text-align:left;
		margin-top: 10px;
	}
	
	/* .p{
		margin-top: 10px;
		font-weight: bold;
		font-size: 18px;
		color: #5e738b;
	} */
	#noticeTitle{
		width: 1500px;
		height: 40px;
	}
	.div{
		margin-bottom: 20px;
		margin-top: 20px;
	}
	
	.delBtn{
		width: 70px;
		height: 30px;
		border: none;
		background: #C6C6C6;
		color: white;
		font-weight: 400;
		border-radius: 5px;
		font-size: 14px;
	
	}
	
	.okBtn {
		width: 70px;
		height: 30px;
		border: none;
		background: #1E2B44;
		color: white;
		font-weight: 400;
		border-radius: 5px;
		font-size: 14px;
	}
	#noticeTable{
		width:95%;
		text-align:left;
		margin-top: 30px;
	}
	.tr{
		width: 95%;
	}
	.tr2{
		width: 95%;
	}
	.pp{
		
	}
	.p{
		font-size: 18px;
		color: #5e738b;
		margin-bottom: 40px;
		font-weight: bold;
	}
	#content{
		width: 80%;
		border: 1px solid black;
	}
</style>
</head>
<body onload="$('#route1').text('공지사항'),$('#route2').text('상세보기')">
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 900px; margin: 0 auto; overflow: auto;">
				
				<p class="p">상세보기</p>
				
				<hr>
				
				<table id="noticeTable" align="center">
					<tr class="tr">
						<td><p class="pp">공지사항 제목</p></td>
					</tr>
					<tr  class="tr2">
						<td><p class="p">제목</p></td>
					</tr>
					<tr  class="tr">
						<td><p class="pp">공지사항 내용</p></td>
					</tr>
					<tr  class="tr2">
						<td>
							<div id="content"></div>
						</td>
					</tr>
					<tr>
						<td><p class="p">첨부파일 다운로드</p></td>
					</tr>
					
				</table>	
				
				
				<table>
					<tr>
						<td></td>					
					</tr>
				</table>	


			</div>
		</div>
	</div>
</body>
<script>
	

</script>
</html>


