<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
	#projectJoin{
		width:130px;
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
		width:60px;
		height:25px;
		background:#89C4F4;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueCpl{
		width:60px;
		height:25px;
		background:#45B6AF;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueAll{
		width:60px;
		height:25px;
		background:#5D6B7A;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	
	.issueCancel{
		width:60px;
		height:25px;
		background:#C6C6C6;
		color:white;
		text-align:center;
		border-radius: 5px;
		margin-top:5px;
		padding-top: 2px;
	}
	.issueEnd{
		width:60px;
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
   
   
</style>
</head>
<body onload="$('#route1').text('일반업무'), $('#route2').text('이슈 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
						<table align="left" style="margin-bottom:10px;">	
							<tr>
								<td><button class="projectBtn" onclick="location.href='issueInsertPage.iu'"><i class="fas fa-edit"></i> &nbsp;이슈  등록</button>
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
								<td > &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								<!-- <label style="color:#626262">수행부서   </label>&nbsp;&nbsp;
									<select class="buseoSelect">
										<option>선택하세요</option>
									</select> -->
								</td>
								<td style="width:50%"></td>
								<td><label class="issueOpen">확인중</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label class="issueCpl">조치중</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label class="issueEnd">조치완료</label></td>
								<td>&nbsp;&nbsp;</td>
								<td><label class="issueCancel">취소</label></td>
								<td>&nbsp;&nbsp;</td>
								<td></td>
							</tr>	
							</table>
						<table id="projectTable" align="center">
							<tr>
								<td class="thRange th1">프로젝트</td>
								<td class="tdText thRange">작업</td>
								<td class="tdText thRange">제목</td>
								<td class="tdText thRange">제기일자</td>
								<td class="tdText thRange">구분</td>
								<td class="tdText thRange">제기자</td>
								<td class="tdText thRange">상태</td>
								<td class="tdText thRange">조치자</td>
								<td class="tdText thRange">조치희망일</td>
								<td class="tdText thRange">조치완료일</td>
							</tr>
							<tr>
								<td class="thRange th1"><input type="text" class="inputCss" style="width:200px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:70px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:100px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:60px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:60px;"></td>
								<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:50px;"></td>
							</tr>
							
							<c:forEach var="l" items="${list }">
							<tr class="trRange">
								<td style="display:none;">${l.issueNo }</td>
								<td class="tdText">${l.projectName }</td>
								<td class="tdText">${l.workName }</td>
								<td class="td1" style="text-align:center">${l.issueTitle }</td>
								<td class="tdText">${l.registerDate }</td>
								<td class="tdText">${l.issueType }</td>
								<td class="tdText">${l.registerName }</td>
								<c:if test="${l.status == '확인중' }">
								<td class="tdText"><label class="issueOpen">${l.status }</label></td>
								</c:if>
								<c:if test="${l.status == '조치중' }">
								<td class="tdText"><label class="issueCpl">${l.status }</label></td>
								</c:if>
								<c:if test="${l.status == '조치완료' }">
								<td class="tdText"><label class="issueEnd">${l.status }</label></td>
								</c:if>
								<c:if test="${l.status == '취소' }">
								<td class="tdText"><label class="issueCancel">${l.status }</label></td>
								</c:if>
								<td class="tdText">${l.teamWorkerName }</td>
								<td class="tdText">${l.actionDate }</td>
								<td class="tdText">${l.ihDate }</td>
							</tr>
							</c:forEach>
							
							<tr class="pagingArea">
                        		<td colspan="10">
                           			<div class="paging">
                           				<%-- <c:if test="${pi.currentPage <= 1 }"> --%>
                           				
                           			<< < 1 2 > >></div>
                        		</td>
                     		</tr>
						</table>
					
					</div>
				</div>
			</div>
		<script>
		$(function(){
			$("#projectNo").change(function(){
				var pno = $(this).val();
				console.log(pno);
				location.href="selectIssueList.iu?pno=" + pno;
			});
			
			$("#projectTable td").mouseenter(function(){
		    	$(this).parent().css({"background":"darkgray", "cursor":"pointer", "color":"white"});
		    }).mouseout(function(){
		    	$(this).parent().css({"background":"white", "color":"black"});
		    }).click(function(){
		    	 var num = $(this).parent().children().eq(0).text();
		    	
		    	console.log(num);
		    	location.href="selectIssueOne.iu?issueNo="+num;
		    }); 
			
		});
		
		</script>	
			
</body>
</html>
