<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	
	#projectJoin{
		width:130px;
	}
	
	#projectNo{
		width:180px;
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
		width:100px;
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
   	background:white;
   	text-align:center;
   	font-weight:bold;
   	border-top:1px solid black;
   	border-bottom:none;
   }
   
   #approveLi{
   	background:#1E2B44;
   	color:white;
   	text-align:center;
   	border-bottom:2px solid white;
   }
</style>
</head>
<body onload="$('#route1').text('일반업무'), $('#route2').text('변경요청')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
		<div class="changePanel">
			<!-- <ul class="changeList">
				<li id="requestLi"><a href="changeRequestList.iu">변경요청</a>
				</li>
				<li id="approveLi"><a href="RequestApprovalList.iu">변경요청 승인</a>
				</li>
			</ul> -->
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:670px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><button class="projectBtn" onclick="location.href='changeRequestPage.iu'"><i class="fas fa-edit"></i> &nbsp;변경요청  등록</button>
								<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
								<td><label id="projectJoin">참여 프로젝트 : </label></td>
								<td>
									<select name="projectNo" id="projectNo" class="projectList">
										<option>선택하세요</option>
											<c:forEach var="iwpt" items="${iwpt }">
												<option value="${iwpt.projectPk }"><c:out value="${iwpt.projectName }"/></option> 
											</c:forEach>
									</select>
								</td>
								<td style="width:40%"></td>
								<td><label class="issueOpen">승인중</label></td>
								<td>&nbsp;&nbsp;</td>
								<td colspan="2"><label class="issueCpl">1차승인완료</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label class="issueComp">변경완료</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label class="issueAll">반려</label></td>
								<td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
								<td><label class="issueReturn">취소</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label class="issueCancel">종료</label></td>
								<td>&nbsp;&nbsp;</td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">프로젝트</td>
								<td class="tdText thRange">작업명</td>
								<td class="tdText thRange">변경요청명</td>
								<td class="tdText thRange">등록자</td>
								<td class="tdText thRange">담당자</td>
								<td class="tdText thRange">승인자</td>
								<td class="tdText thRange">상태</td>
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
							</tr>
							
							<c:forEach var="l" items="${list }">
							<tr class="trRange">
								<td style="display:none;">${l.changeNo }</td>
								<td class="tdText">${l.projectName }</td>
								<td class="tdText">${l.workName }</td>
								<td class="td1" style="text-align:center">${l.requestTitle }</td>
								<td class="tdText">${l.registerName }</td>
								<td class="tdText">${l.grantorName1 }</td>
								<td class="tdText">${l.grantorName2 }</td>
								<c:if test="${l.crStatus == '승인중' }">
								<td class="tdText"><label class="issueOpen">${l.crStatus }</label></td>
								</c:if>
								<c:if test="${l.crStatus == '1차승인완료' }">
								<td class="tdText"><label class="issueCpl">${l.crStatus }</label></td>
								</c:if>
								<c:if test="${l.crStatus == '변경완료' }">
								<td class="tdText"><label class="issueComp">${l.crStatus }</label></td>
								</c:if>
								<c:if test="${l.crStatus == '반려' }">
								<td class="tdText"><label class="issueAll">${l.crStatus }</label></td>
								</c:if>
								<c:if test="${l.crStatus == '종료' }">
								<td class="tdText"><label class="issueCancel">${l.crStatus }</label></td>
								</c:if>
								<c:if test="${l.crStatus == '취소' }">
								<td class="tdText"><label class="issueReturn">${l.crStatus }</label></td>
								</c:if>
								<td class="tdText">${l.requestDate }</td>
							</tr>
							</c:forEach>
							
							<tr class="pagingArea">
                        		<td colspan="8">
                           			<div class="paging"><< < 1 2 > >></div>
                        		</td>
                     		</tr>
						</table>
					
					</div>
				</div>
			</div>
		</div>
		<script>
		$(function(){
			$("#projectNo").change(function(){
				var pno = $(this).val();
				console.log(pno);
				location.href="selectChangeRequestList.iu?pno=" + pno;
			});
			
			
			$("#projectTable td").mouseenter(function(){
		    	$(this).parent().css({"cursor":"pointer"});
		    }).click(function(){
		    	var num = $(this).parent().children().eq(0).text();
		    	console.log(num);
		    	location.href="selectChangeRequestOne.iu?changeNo="+num;
		    }); 
		});
		</script>
</body>
</html>
