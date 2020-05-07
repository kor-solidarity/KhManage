<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
		width:545px;
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
</style>
</head>
<body onload="$('#route1').text('일반업무'), $('#route2').text('이슈 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<b>변경요청 등록 정보</b>
			<hr style="border:solid 1px lightgray;">
			<form id="insertChangeRequestForm" action="insertChangeRequest.iu" method="post">
			<table id="issueTable">	
				
				<tr>
					<td class="thRange" colspan="2">프로젝트
					<input type="hidden" name="registerNo" value="${sessionScope.loginUser.memberNo }">
					</td>
					<td class="thRange" colspan="9">
						<select name="projectNo" id="projectNo" class="projectList" required="required">
							<option value="#" >선택하세요</option>
								<c:forEach var="wp" items="${wp }">
									<option value="${wp.projectPk }"><c:out value="${wp.projectName }"/></option> 
								</c:forEach>
						</select>
						
					</td>
					<td class="thRange" align="left">작업</td>
					<td class="thRange" colspan="6">
						<select id="taskList" name="workNo">
							<option>작업을 선택하세요</option>
							<option>---------</option>
							<option>---------</option>
							<option>---------</option>
						</select>
					</td>
				</tr>
				<tr>
					<td class="thRange">제목</td>
					<td class="thRange"></td>
					<td class="thRange" colspan="16"><input type="text" id="taskTitle" name="requestTitle" placeholder="제목을 입력해주세요"></td>
				</tr>
				<tr>
					<td class="thRange" colspan="2">변경요청내용</td>
					<td class="thRange" rowspan="5" colspan="16"><input type="text" name="requestContent" id="taskContent"></td>
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
					<td class="thRange" colspan="6"></td>
					<td class="thRange">작업명</td>
					<td class="thRange" colspan="2" >
					<input type="text" name="workName" class="inputMenu form-control workName">
					</td>
					<td class="thRange">작업유형</td>
					<td class="thRange" colspan="2">
					<input type="text" name="workType" class="inputMenu form-control workType" required="required">
					</td>
					<td class="thRange" colspan="6"></td>
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
					<td class="thRange" colspan="6"></td>
					<td class="thRange">시작일</td>
					<td class="thRange" colspan="2">
					<input name="beginDate" type="date" class="inputMenu form-control beginDate" required="required">
					</td>
					<td class="thRange">완료일</td>
					<td class="thRange" colspan="2">
					<input name="completeDate" type="date" class="inputMenu form-control completeDate" required="required">
					</td>
					<td class="thRange" colspan="6"></td>
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
				<td class="thRange" colspan="6"></td>
					<td class="thRange">완료율</td>
					<td class="thRange" colspan="2">
					<input name="completeRate" type="number" class="inputMenu form-control completeRate" step="5" min="0" max="100">	
					</td>
					<td class="thRange">담당자</td>
					<td class="thRange" colspan="2">
					<select name="memberNo" id="memberNo" class="inputMenu form-control memberNo" required="required">
						
					</select>
					</td>
					<td class="thRange" colspan="6"></td>
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
				<td class="thRange" colspan="6"></td>
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
					<td class="thRange" colspan="6"></td>
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
				<td class="thRange" colspan="6"></td>
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
					<td class="thRange" colspan="6"></td>
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
					<td class="thRange" colspan="18">
					<hr style="border:solid 1px lightgray;">
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">담당자</td>
					<td class="thRange" colspan="5">
						<select id="crGrantor1" name="crGrantor1" class="inputMenu form-control crGrantor1">
							<option>선택하세요</option>
							<option>부서명</option>
							<option>부서명</option>
							<option>부서명</option>
							<option>부서명</option>
							<option>부서명</option>
						</select>
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
					<td class="thRange">승인자 </td>
					<td class="thRange" colspan="5">
						<select id="crGrantor2" name="crGrantor2" class="inputMenu form-control crGrantor2">
							<option>선택하세요</option>
							<option>부서명</option>
							<option>부서명</option>
							<option>부서명</option>
							<option>부서명</option>
							<option>부서명</option>
						</select>
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
				</tr>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange"><button class="okBtn" type="button" id="insertRequest"><i class="fas fa-check"></i>&nbsp;저장</button></td>
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
		$("#projectNo").change(function(){
			var pno = $(this).val();
			console.log(pno);
			$("#taskList").empty();
			$("#projectTeam").empty();
			$.ajax({
				type:"post",
				url:"projectWorkList.iu",
				data:{pno:pno},
				dataType:"json",
				success:function(data){
					console.log(data);
					$("#taskList").append("<option>" + '작업을 선택하세요' + "</option>");
					for(var i = 0; i < data.iw.length; i++){
						$("#taskList").append("<option value='" + data.iw[i]['workNo'] + "'>" + data.iw[i]['workName'] + "</option>");
					}
					
					/* for(var i = 0; i < data.ipt.length; i++){
						$("#projectTeam").append("<option value='" + data.ipt[i]['memberPk'] + "'>" + data.ipt[i]['memberName'] + "</option>");
						
					} */
				},
				error:function(error){
					
				}
			});
		});
		
		
		
		$("#taskList").change(function(){
			var workNo = $(this).val();
			$("#grantorNo").empty();
			$("#highWorkNo").empty();
			$("#memberNo").empty();
			$("#crGrantor1").empty();
			$("#crGrantor2").empty();
			$.ajax({
				url:"selectWork.wk",
				type:"post",
				data:{workNo:workNo},
				dataType:"json",
				success:function(data){
 					console.log(data);
					
					console.log(data.work.beginDate);
					console.log(data.work.completeDate);
					console.log(data.work.status);
					btnNum = data.work.workAttachment.length;
					
					
					for(var i = 0; i < data.gt.length; i++){
						$("#grantorNo").append("<option value='" + data.gt[i]['memberPk'] + "'>" +data.gt[i]['deptName'] + " " + data.gt[i]['rankName'] + " " + data.gt[i]['memberName']  + "</option>");
					};
					
					for(var j= 0; j < data.hw.length; j++){
						$("#highWorkNo").append("<option value='" + data.hw[j]['workNo'] + "'>"+ data.hw[j]['workName'] + "</option>");
					}
					
					for(var k= 0; k < data.mn.length; k++){
						$("#memberNo").append("<option value='" + data.mn[k]['memberPk'] + "'>" +data.mn[k]['deptName'] + " " + data.mn[k]['rankName'] + " " + data.mn[k]['memberName']  + "</option>");
					}
					
					for(var o = 0; o < data.mn1.length; o++){
						$("#crGrantor1").append("<option value='" + data.mn1[o]['memberPk'] + "'>" +data.mn1[o]['deptName'] + " " + data.mn1[o]['rankName'] + " " + data.mn1[o]['memberName']  + "</option>");
					};
					
					for(var z = 0; z < data.gt1.length; z++){
						$("#crGrantor2").append("<option value='" + data.gt1[z]['memberPk'] + "'>" +data.gt1[z]['deptName'] + " " + data.gt1[z]['rankName'] + " " + data.gt1[z]['memberName']  + "</option>");
					};
					
					
					$(".workNo").val(data.work.workNo);
					$(".workName").val(data.work.workName);
					$(".workType").val(data.work.workType);
					$(".projectNo").val(data.work.projectNo);
					$(".projectName").val(data.work.projectName);
					$(".beginDate").val(data.work.beginDate);
					$(".completeDate").val(data.work.completeDate);
					$(".precedeNo").val(data.work.precedeNo);
					$(".completeRate").val(data.work.completeRate);
					$(".grantorNo").val(data.work.grantorNo);
					$(".memberNo").val(data.work.memberNo);
					$(".workLevel").val(data.work.workLevel);
					$(".status").val(data.work.status);
					$(".highWorkNo").val(data.work.highWorkNo);
					$(".workStatus").val(data.work.workStatus);
					$(".productType").val(data.work.workAttachment[0].productType);
					
					
				},
				error:function(error){
					alert(error);

				}
			});
		});
		
		
		$("#workLevel").change(function(){
			var workLevel = $(this).val();
			var pno = $("#projectNo").val();
			$("#highWorkNo").empty();
			$("#highWorkNo").attr('disabled', false);
			
			if(workLevel == '1'){
				$("#highWorkNo").attr('disabled', true);
			}else{
				$.ajax({
					type:"post",
					url:"highWorkNoList.wk",
					data: {
							workLevel:workLevel,
							pno:pno
						  },
					dataType:"json",
					success:function(data){
						for(var i = 0; i < data.hw.length; i++){
							$("#highWorkNo").append("<option value='" + data.hw[i]['workNo'] + "'>"+ data.hw[i]['workName'] + "</option>")
						}
					},
					error:function(error){
						
					}
				});	
			}
			
		});
		
		
		
		$("#insertRequest").click(function(){
			$("#insertChangeRequestForm").submit();
		});
		
		
	});
	



</script>
</body>
</html>