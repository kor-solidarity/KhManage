<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>

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
	.pagingArea{
      background:#F3F3F3;
      height:50px;
      border:1px solid #B0B0B0;
   }
   .paging{
      margin-left:200px;
      width:50%;
   }

</style>

</head>
<body onload="$('#route1').text('프로젝트'); $('#route2').text('산출물');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp"/>
	
	<div id="wrap">
	
		<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><button class="projectBtn" onclick="location.href='outputReg.pr'"><i class="fas fa-edit"></i> &nbsp;산출물 등록</button>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
							</tr>	
						</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">프로젝트 명</td>
								<td class="tdText thRange">작업</td>
								<td class="tdText thRange">산출물 종류</td>
								<td class="tdText thRange">제목</td>
								<td class="tdText thRange">등록자</td>
								<td class="tdText thRange">생성일</td>
								<td class="tdText thRange">수정일</td>
							</tr>
							<tr>
								<td class="thRange th1"><input type="search" class="inputCss" style="width:200px;"></td>
								<td class="tdText thRange"><input type="search" class="inputCss" style="width:100px"></td>
								<td class="tdText thRange"><input type="search" class="inputCss" style="width:80px;"></td>
								<td class="tdText thRange"><input type="search" class="inputCss" style="width:200px;"></td>
								<td class="tdText thRange"><input type="search" class="inputCss" style="width:60px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:60px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:60px;"></td>
							</tr>
							<tr class="trRange">
								<td class="td1"><a href="#">KH대학교 학사시스템 개발</a></td>
								<td class="tdText">SW개발</td>
								<td class="tdText">띠로리</td>
								<td class="tdText"><a href="#">제목제목제목제목제목</a></td>
								<td class="tdText">원준성</td>
								<td class="tdText">2020-04-02</td>
								<td class="tdText">2020-04-02</td>
							</tr>

							<tr class="pagingArea">
								<td colspan="7">
									<div class="paging"><< < 1 2 > >></div>
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
	
	
	
	
	
	
	
	
	
	</div>
</body>
</html>