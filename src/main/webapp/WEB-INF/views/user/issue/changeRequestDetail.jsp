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
	
	#requestContent{
		width:1450px;
		height:150px;
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
	<ul class="changeList">
				<li id="requestLi"><a href="changeRequestList.iu">변경요청</a>
				</li>
				<li id="approveLi"><a href="RequestApprovalList.iu">변경요청 승인</a>
				</li>
			</ul>
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<form>
			<table id="issueTable">	
				<tr>
					<td class="thRange" colspan="5"><b>변경요청 등록 정보</b></td>
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
					<td class="thRange" colspan="2">현재 상태는 <font color="red">승인중</font> 입니다.</td>
					<td class="thRange"><button class="cancleBtn"><i class="fas fa-ban"></i>&nbsp;취소</button></td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
					<td class="thRange" align="center" colspan="2">변경요청 번호</td>
					<td class="thRange2" colspan="16">${cr.changeNo }</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">프로젝트</td>
					<td class="thRange2" colspan="9">
						${cr.projectName }
					</td>
					<td class="thRange" align="left">작업명</td>
					<td class="thRange2" colspan="6">
						${cr.workName }
					</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">제목</td>
					<td class="thRange2" colspan="16">${cr.requestTitle }</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">이슈 내용</td>
					<td class="thRange2" rowspan="5" colspan="16"><textarea id="requestContent">${cr.requestContent }</textarea></td>
					
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
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="18">
					<hr style="border:solid 1px lightgray;">
					</td>
				</tr>
				<tr>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">작업명</td>
					<td class="thRange" colspan="2" >
					<input type="text" name="workName" class="inputMenu form-control workName">
					</td>
					<td class="thRange">작업유형</td>
					<td class="thRange" colspan="2">
					<input type="text" name="workType" class="inputMenu form-control workType" required="required">
					</td>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">작업명</td>
					<td class="thRange" colspan="2" >
					<input type="text" name="workName" class="inputMenu form-control workName">
					</td>
					<td class="thRange">작업유형</td>
					<td class="thRange" colspan="2">
					<input type="text" name="workType" class="inputMenu form-control workType" required="required">
					</td>
					<td class="thRange" colspan="2"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="6"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange" colspan="6"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">시작일</td>
					<td class="thRange" colspan="2">
					<input name="beginDate" type="date" class="inputMenu form-control beginDate" required="required">
					</td>
					<td class="thRange">완료일</td>
					<td class="thRange" colspan="2">
					<input name="completeDate" type="date" class="inputMenu form-control completeDate" required="required">
					</td>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">시작일</td>
					<td class="thRange" colspan="2">
					<input name="beginDate" type="date" class="inputMenu form-control beginDate" required="required">
					</td>
					<td class="thRange">완료일</td>
					<td class="thRange" colspan="2">
					<input name="completeDate" type="date" class="inputMenu form-control completeDate" required="required">
					</td>
					<td class="thRange" colspan="2"></td>
				</tr>
				<tr>
				<td class="thRange" colspan="6"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange" colspan="6"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">완료율</td>
					<td class="thRange" colspan="2">
					<input name="completeRate" type="number" class="inputMenu form-control completeRate" step="5" min="0" max="100">	
					</td>
					<td class="thRange">담당자</td>
					<td class="thRange" colspan="2">
					<select name="memberNo" id="memberNo" class="inputMenu form-control memberNo" required="required">
						
					</select>
					</td>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">완료율</td>
					<td class="thRange" colspan="2">
					<input name="completeRate" type="number" class="inputMenu form-control completeRate" step="5" min="0" max="100">	
					</td>
					<td class="thRange">담당자</td>
					<td class="thRange" colspan="2">
					<select name="memberNo" id="memberNo" class="inputMenu form-control memberNo" required="required">
						
					</select>
					</td>
					<td class="thRange" colspan="2"></td>
				</tr>
				<tr>
				<td class="thRange" colspan="6"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
				<td class="thRange" colspan="6"></td>
				</tr>
				<tr>
				<td class="thRange" colspan="2"></td>
					<td class="thRange">작업단계</td>
					<td class="thRange" colspan="2" >
					<select name="workLevel" id="workLevel" class="inputMenu form-control workLevel" required="required">
						<option value="#" >선택하세요</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
					</td>
					<td class="thRange">작업상태</td>
					<td class="thRange" colspan="2">
					<select name="status" id="statusSelect" class="inputMenu form-control status" required="required">
						<option value="#" >선택하세요</option>
						<option value="시작전">시작전</option>
						<option value="개발중">개발중</option>
						<option value="개발완료">개발완료</option>
						<option value="테스트완료">테스트완료</option>
						<option value="PL검토중">PL검토중</option>
						<option value="PL승인완료">PL승인완료</option>
						<option value="개발지연">개발지연</option>
					</select>
					</td>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">작업단계</td>
					<td class="thRange" colspan="2" >
					<select name="workLevel" id="workLevel" class="inputMenu form-control workLevel" required="required">
						<option value="#" >선택하세요</option>
						<option value="1">1</option>
						<option value="2">2</option>
						<option value="3">3</option>
					</select>
					</td>
					<td class="thRange">작업상태</td>
					<td class="thRange" colspan="2">
					<select name="status" id="statusSelect" class="inputMenu form-control status" required="required">
						<option value="#" >선택하세요</option>
						<option value="시작전">시작전</option>
						<option value="개발중">개발중</option>
						<option value="개발완료">개발완료</option>
						<option value="테스트완료">테스트완료</option>
						<option value="PL검토중">PL검토중</option>
						<option value="PL승인완료">PL승인완료</option>
						<option value="개발지연">개발지연</option>
					</select>
					</td>
					<td class="thRange" colspan="2"></td>
				</tr>
				<tr>
				<td class="thRange" colspan="6"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange" colspan="6"></td>
				</tr>
				<tr>
				<td class="thRange" colspan="2"></td>
					<td class="thRange">상위작업</td>
					<td class="thRange" colspan="2" >
						<select name="highWorkNo" id="highWorkNo" class="inputMenu form-control highWorkNo" required="required">
											
						</select>
					</td>
					<td class="thRange">승인자</td>
					<td class="thRange" colspan="2">
						<select name="grantorNo" id="grantorNo" style="padding-left:0px;" class="inputMenu form-control grantorNo" required="required">
											
						</select>
					</td>
					<td class="thRange" colspan="2"></td>
					<td class="thRange">상위작업</td>
					<td class="thRange" colspan="2" >
						<select name="highWorkNo" id="highWorkNo" class="inputMenu form-control highWorkNo" required="required">
											
						</select>
					</td>
					<td class="thRange">승인자</td>
					<td class="thRange" colspan="2">
						<select name="grantorNo" id="grantorNo" style="padding-left:0px;" class="inputMenu form-control grantorNo" required="required">
											
						</select>
					</td>
					<td class="thRange" colspan="2"></td>
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
				
				
				<tr>
					<td class="thRange"></td>
					<td class="thRange">변경요청자</td>
					<td class="thRange2" colspan="3">
						연구소 PMO01 과장
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
					<td class="thRange" colspan="18">
					<hr style="border:solid 1px lightgray;">
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">승인자 1</td>
					<td class="thRange2" colspan="3">
						연구소 PMO01 과장 - 승인중
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
					<td class="thRange"></td>
					<td class="thRange">코멘트 1</td>
					<td class="thRange2" colspan="3">
						확인완료
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
					<td class="thRange"></td>
					<td class="thRange">승인자 2</td>
					<td class="thRange2" colspan="3">
						연구소 PMO02 과장 - 승인중
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
					<td class="thRange"></td>
					<td class="thRange">코멘트 2</td>
					<td class="thRange2" colspan="3">
						확인완료
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
					<td class="thRange"></td>
					<td class="thRange">담당자</td>
					<td class="thRange2" colspan="3">
						연구소 PMO01 부장
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
					<td class="thRange"></td>
					<td class="thRange">내용</td>
					<td class="thRange2" colspan="3">
						조치 진행 예정
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
					<td class="thRange"></td>
					<td class="thRange">종료일</td>
					<td class="thRange2" colspan="3">
						미정
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
</body>
</html>