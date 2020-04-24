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
 	
	.thRange{
		width:90px;
		color:#626262;
		font-size:15px;
		height:35px;
	}
	
	
	.projectList{
		width:700px;
		height:30px;
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#taskList{
		width:550px;
		height:30px;
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#deptList{
		width:250px;
		height:30px;
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#userList{
		width:430px;
		height:30px;
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#taskTitle{
		width:1450px;
		height:30px;
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#taskContent{
		width:1450px;
		height:150px;
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#fileUploadArea{
		width:1450px;
		height:30px;
		border:1px solid lightgray;
		border-radius: 5px;
	}
	
	#workDate{
		border:1px solid #EBCCD1;
		border-radius: 5px;
	}
	
	#issueTable{
		color:#1E2B44;
		font-weight:bold;
	}
	
	.okBtn{
		width:70px;
		height:30px;
		border:none;
		background:#1E2B44;
		color:white;
		font-weight:600;
		border-radius: 5px;
		font-size:14px;
	}
	
	.cancleBtn{
		width:70px;
		height:30px;
		border:none;
		background:#F3565D;
		color:white;
		font-weight:600;
		border-radius: 5px;
		font-size:14px;
	}
	
	.requestContent{
		width:1450px;
		height:100px;
		resize:none;
		border:none;
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
  
   .thRange2{
		width:90px;
		color:#626262;
		font-weight:normal;
		font-size:15px;
		height:35px;
	}
	
	.thRange1{
	}
	
   .thRange3{
		background:#F3F3F3;
		color:#626262;
		font-size:15px;
		border:#B0B0B0 1px solid;
		height:35px;
		text-align:center;
	}
</style>
</head>
<body onload="$('#route1').text('일반업무'), $('#route2').text('이슈 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<form method="post" id="issueRegForm">
			<table id="issueTable">	
				<tr>
					<td class="thRange" colspan="5"><b>이슈 등록 정보</b></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<c:choose>
					<c:when test="${issue.status eq '확인중' && issue.teamWorker eq loginUser.memberNo}">
					<td class="thRange" colspan="2">현재 상태는 <font color="red">${issue.status }</font> 입니다.</td>
					<td class="thRange"><button id="issueAgreeBtn" class="okBtn"><i class="fas fa-check"></i>&nbsp;승인</button></td>
					<td class="thRange"><button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button></td>
					</c:when>
					<c:when test="${issue.status eq '조치중' && issue.teamWorker eq loginUser.memberNo}">
					<td class="thRange" colspan="2">현재 상태는 <font color="red">${issue.status }</font> 입니다.</td>
					<td class="thRange"><button id="issueComBtn" class="okBtn"><i class="fas fa-check"></i>&nbsp;완료</button></td>
					<td class="thRange"><button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button></td>
					</c:when>
					<c:when test="${issue.status eq '조치완료'}">
					<td class="thRange" colspan="3">현재 상태는 <font color="red">${issue.status }</font> 입니다.</td>
					<td class="thRange"><button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button></td>
					</c:when>
					<c:otherwise>
					<td class="thRange"></td>
					<td class="thRange" colspan="2">현재 상태는 <font color="red">${issue.status }</font> 입니다.</td>
					<td class="thRange"><button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button></td>
					</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
					<td class="thRange"><input type="hidden" name="projectNo" value="${issue.projectNo }"></td>
					<td class="thRange">프로젝트</td>
					<td class="thRange2" colspan="9">
						${issue.projectName }
					</td>
					<td class="thRange" align="left">작업</td>
					<td class="thRange2" colspan="6">
						${issue.workName }
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">제기자</td>
					<td class="thRange2" colspan="9">
						${issue.registerName }(${issue.registerType })
					</td>
					<td class="thRange" align="left">제기일자</td>
					<td class="thRange2" colspan="6">
						${issue.registerDate }
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">이슈 구분</td>
					<td class="thRange2" colspan="16">${issue.issueType }</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">제목</td>
					<td class="thRange2" colspan="16">${issue.issueTitle }</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">이슈 내용</td>
					<td class="thRange2" rowspan="3" colspan="16"><textarea class="requestContent" readOnly>${issue.issueContent }</textarea></td>
					
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">첨부파일</td>
					<td class="thRange3" colspan="8">파일명</td>
					<td class="thRange3" colspan="2">버전</td>
					<td class="thRange3" colspan="2">등록자</td>
					<td class="thRange3" colspan="2">등록일</td>
					<td class="thRange3" colspan="2">삭제</td>
				</tr>
				<c:forEach var="at" items="${at }">
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange" colspan="8">${at.originName }</td>
					<td class="thRange" colspan="2">버전</td>
					<td class="thRange" colspan="2">${issue.registerName }(${issue.registerType })</td>
					<td class="thRange" colspan="2">${issue.registerDate }</td>
					<td class="thRange" colspan="2">삭제</td>
				</tr>
				</c:forEach>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="2">이슈 처리 정보</td>
					<td class="thRange2" colspan="3">
					</td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
					<td class="thRange"><input type="hidden" name="issueNo" value="${issue.issueNo }"></td>
					<td class="thRange">조치자</td>
					<td class="thRange2" colspan="9">
						${issue.teamWorkerName }(${issue.teamWorker })
					</td>
					<td class="thRange" align="left">조치희망일</td>
					<td class="thRange2" colspan="6">
						${issue.actionDate }
					</td>
				</tr>
				<c:choose>
				<c:when test="${issue.status eq '조치중' && issue.teamWorker eq loginUser.memberNo}">
				<tr>
					<td class="thRange"></td>
					<td class="thRange">조치완료일</td>
					<td class="thRange2" colspan="16"><input type="date" name="ihDate" style="border:none;"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">조치내용</td>
					<td class="thRange2" rowspan="3" colspan="16">
					<textarea class="requestContent" name="ihContent"></textarea>
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">첨부파일</td>
					<td class="thRange3" colspan="8">파일명</td>
					<td class="thRange3" colspan="2">버전</td>
					<td class="thRange3" colspan="2">등록자</td>
					<td class="thRange3" colspan="2">등록일</td>
					<td class="thRange3" colspan="2">삭제</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">종료일</td>
					<td class="thRange2" colspan="16"></td>
				</tr>
				</c:when>
				<c:otherwise>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">조치완료일</td>
					<td class="thRange2" colspan="16">${issue.ihDate }</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">조치내용</td>
					<td class="thRange2" rowspan="3" colspan="16">
					<textarea class="requestContent" name="ihContent" readOnly>${issue.ihContent }</textarea>
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">첨부파일</td>
					<td class="thRange3" colspan="8">파일명</td>
					<td class="thRange3" colspan="2">버전</td>
					<td class="thRange3" colspan="2">등록자</td>
					<td class="thRange3" colspan="2">등록일</td>
					<td class="thRange3" colspan="2">삭제</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">종료일</td>
					<td class="thRange2" colspan="16"></td>
				</tr>
				</c:otherwise>
				</c:choose>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"><button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
			</table>
			</form>
			</div>
		</div>
	</div>
	
	<script>
	$(function(){
		$("#issueAgreeBtn").click(function(){
			ws.send("이슈");
			$("#issueRegForm").attr('action', "issueAgree.iu")
		});
		
		$("#issueComBtn").click(function(){
			ws.send("이슈");
			$("#issueRegForm").attr('action', "issueComplete.iu")
		});
	});
	
	
	</script>
</body>
</html>