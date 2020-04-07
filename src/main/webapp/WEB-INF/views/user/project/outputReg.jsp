<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>


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

</style>
</head>
<body onload="$('#route1').text('프로젝트'); $('#route2').text('이슈');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp"/>

	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<b>이슈 등록 정보</b>
			<hr>
			<form>
			<table id="issueTable">	
				<tr>
					<td class="thRange"></td>
					<td class="thRange">프로젝트</td>
					<td class="thRange" colspan="4">
						<select class="projectList">
							<option>선택하세요</option>
							<option>KH대학교 학사시스템 개발</option>
							<option>KH대학교 학사시스템 유지보수</option>
							<option>KH대학교 학사시스템 고도화</option>
						</select>
					</td>
					<td class="thRange" align="left">작업</td>
					<td class="thRange" colspan="6">
						<select id="taskList">
							<option>작업을 선택하세요</option>
							<option>로그인 작업</option>
							<option>수강신청 작업</option>
							<option>KH대학교 학사시스템 고도화</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">산출물종류</td>
					<td class="thRange">
						<select class="projectList">
							<option>선택하세요</option>
							<option>설계목표서</option>
							<option>설계목표서</option>
							<option>설계목표서</option>
					</select>
					</td>
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
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">제목</td>
					<td class="thRange" colspan="16"><input type="text" id="taskTitle" placeholder="제목을 입력해주세요"></td>
					
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">이슈 내용</td>
					<td class="thRange" rowspan="5" colspan="16">
						<!-- <input type="text" id="taskContent"> -->
						<textarea rows="" cols="" style="width:100%"></textarea>
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
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">첨부파일</td>
					<td class="thRange" colspan="16">
						<div id="fileUploadArea">
							<input type="file" id="fileUpload" name="fileUpload">
						</div>
					</td>
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
				</tr>
				<tr>
					<td class="thRange" colspan="18"><b>이슈 처리 정보</b>
					<hr></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">조치자</td>
					<td class="thRange" colspan="9">
						<select class="projectList">
							<option>선택하세요</option>
							<option>심재우</option>
							<option>김성준</option>
							<option>박은석</option>
							<option>원준성</option>
							<option>김태원</option>
						</select>
					</td>
					<td class="thRange" align="left">조치희망일</td>
					<td class="thRange" colspan="6">
						<input type="date" name="workDate" id="workDate">
					</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"><button class="okBtn"><i class="fas fa-check"></i>&nbsp;저장</button></td>
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
				</tr>
			</table>
			</form>
			</div>
		</div>
	</div>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>
































