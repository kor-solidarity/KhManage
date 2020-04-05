<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

.topTable {width: 100%;}

.midTable {width: 40%;}

.tdTop {width: 15%;	align: center; 	text-align: center; height: 100px; border: 1px solid lightgray;}

.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top;}

.bottom1{width:}

</style>

</head>
<body onload="$('#route1').text('HOME')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<div id="wrap">
	
		<div class="panel panel-headline">
			<div class="panel-heading">
			
				<div class="top">
					<table class="topTable">
						<tr>
							<td class="tdTop">내작업</td>
							<td class="td"></td>
							<td class="tdTop">변경요청</td>
							<td class="td"></td>
							<td class="tdTop">이슈</td>
							<td class="td"></td>
							<td class="tdTop">승인요청</td>
							<td class="td"></td>
							<td class="tdTop">산출물</td>
							<td class="td"></td>
							<td class="tdTop">프로젝트</td>
						<tr>
					</table>
				</div>
				
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid">작업 진행상태
							<hr>
								<div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid">이슈 현황
							<hr>
								<div>
								</div>
							</td>
						</tr>
					</table>
				</div>
				
				<br>
				<div class="bottom1">
					<table>
						<tr>예정작업 (금주/차주)</tr>
					</table>
				</div>
			
			
			

			</div>
		</div>
	</div>
</body>
</html>