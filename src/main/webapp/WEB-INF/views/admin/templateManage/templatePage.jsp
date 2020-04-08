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
		width:400px;
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
<body onload="$('#route1').text('관리자'); $('#route2').text('템플릿 관리');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><a href="insertTemplate.am"><button class="projectBtn"><i class="far fa-plus-square"></i> &nbsp;템플릿 등록</button></a>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">템플릿 명</td>
								<td class="thRange th1">템플릿 설명</td>
								<td class="tdText thRange">템플릿 분류</td>
								<td class="tdText thRange">수정일</td>
								<td class="tdText thRange">생성일</td>
								<td class="tdText thRange"></td>
							</tr>
							<tr>
								<td class="thRange th1"><input type="text" class="inputCss" style="width:390px;"></td>
								<td class="tdText thRange" style="width:370px;"><input type="text" class="inputCss" style="width:400px"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:110px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:110px;"></td>
								<td class="tdText thRange"><input type="date" class="inputCss" style="width:110px;"></td>
								<td class="tdText thRange"><div style="width: 100px;"></div></td>
							</tr>

							<tr class="trRange"	id="accessList">
								<td class="td1">관리자 권한인원</td>
								<td class="tdText">관리자접근가능한 인원들입니다.</td>
								<td class="tdText">20-03-20</td>
								<td class="tdText">20-03-02</td>
								<td class="tdText">20-03-02</td>
								<td class="tdText"><button>Delete</button></td>
							</tr>
							<tr class="trRange"	id="accessList">
								<td class="td1">정보공유게시판접근인원</td>
								<td class="tdText">관리자접근가능한 인원들입니다.</td>
								<td class="tdText">20-03-20</td>
								<td class="tdText">20-03-02</td>
								<td class="tdText">20-03-02</td>
								<td class="tdText"><button>Delete</button></td>
							</tr>
							<tr class="pagingArea">
								<td colspan="6">
									<div class="paging"><< < 1 2 > >></div>
								</td>
							</tr>
						</table>
						<!-- <script>
							$(function(){
								$("#projectTable").find('.td1').on('click', function(){
									location.href='accessDetailPage.am?num='+$(this).text();
								});
							});
						</script> -->
					</div>
				</div>
			</div>
</body>
<script>
	$("#projectTable tr").click(function(){
		
		location.href = "templateManagePage.am";
	});
	

</script>




</html>






