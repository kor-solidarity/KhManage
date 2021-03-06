<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	a:link {
	 color: inherit;
	 text-decoration: none;
	}
	
 	a:visited {
 	 color: inherit;
 	 text-decoration: none;
 	}
 	
 	a:active {
 	 color: inherit;
 	 text-decoration: none;
 	}
 	
 	a:hover {
 	 color: inherit;
 	 text-decoration: none;
 	}

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
	
	.issueOpen{
		width:70px;
		height:25px;
		background:#89C4F4;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueCpl{
		width:70px;
		height:25px;
		background:#45B6AF;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueAll{
		width:70px;
		height:25px;
		background:#5D6B7A;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueReturn{
		width:70px;
		height:25px;
		background:#F3565D;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueCancel{
		width:70px;
		height:25px;
		background:#C6C6C6;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueComp{
		width:70px;
		height:25px;
		background:#428bca;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueEnd{
		width:70px;
		height:25px;
		background:#428bca;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
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
   
   .changeList{
   		list-style: none;
    	margin: 0px;
    	padding: 0px;
    	max-width: 900px;
    	width: 100%;
   }
   
   .changeList li{
    display: inline-block;
    width:150px;
    height:40px;
    padding: 10px;
    border: 1px solid #efefef;
    font-size: 14px;
    cursor: pointer;
   }
   #requestLi{
   	background:#1E2B44;
   	color:white;
   	text-align:center;
   }
   
   #approveLi{
   	background:white;
   	text-align:center;
   	font-weight:bold;
   	border-top:1px solid black;
   	border-bottom:none;
   }
</style>
</head>
<body onload="$('#route1').text('일반업무'), $('#route2').text('변경요청 승인')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
		<div class="changePanel">
			<ul class="changeList">
				<li id="requestLi"><a href="changeRequestList.iu">변경요청</a>
				</li>
				<li id="approveLi"><a href="RequestApprovalList.iu">변경요청 승인</a>
				</li>
			</ul>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:670px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td colspan="6"> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <label style="color:#626262">수행부서   </label>&nbsp;&nbsp;
									<select class="buseoSelect">
										<option>선택하세요</option>
									</select> -->
								</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">프로젝트</td>
								<td class="tdText thRange">작업</td>
								<td class="tdText thRange">변경요청 번호</td>
								<td class="tdText thRange">제목</td>
								<td class="tdText thRange">등록자</td>
								<td class="tdText thRange">담당자</td>
								<td class="tdText thRange">상태</td>
								<td class="tdText thRange">수정일</td>
								<td class="tdText thRange">요청일</td>
							</tr>
							<tr>
								<td class="thRange th1"><input type="text" class="inputCss" style="width:200px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:60px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:60px;"></td>
							</tr>
							
							
							<tr class="trRange">
								<td class="td1">KH대학교 학사시스템 개발</td>
								<td class="tdText">기능 개발</td>
								<td class="tdText">수강-0001</td>
								<td class="tdText"><a href="reqeustApprovalDetail.iu">수강신청 오류 조치자 변경</a></td>
								<td class="tdText">김태원</td>
								<td class="tdText">심재우</td>
								<td class="tdText"><label class="issueOpen">승인중</label></td>
								<td class="tdText">2020-04-04</td>
								<td class="tdText">2020-04-03</td>
							</tr>
							<tr class="pagingArea">
                        		<td colspan="9">
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
