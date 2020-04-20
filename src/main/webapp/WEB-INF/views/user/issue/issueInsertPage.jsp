<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
		height:auto;
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
	.btn{
		display: inline;
	}
</style>
</head>
<body onload="$('#route1').text('일반업무'), $('#route2').text('이슈 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	<jsp:useBean id="now" class="java.util.Date" />
	<fmt:formatDate value="${now}" pattern="yyyy-MM-dd" var="today" />
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<b>이슈 등록 정보</b>
			<hr>
			<form id="insertIssue" action="insertIssue.iu" method="post" enctype="multipart/form-data">
			<table id="issueTable">	
				<tr>
					<td class="thRange"></td>
					<td class="thRange">프로젝트</td>
					<td class="thRange" colspan="9">
						<select name="projectNo" id="projectNo" class="projectList">
							<option>선택하세요</option>
							<c:forEach var="iwpt" items="${iwpt }">
								<option value="${iwpt.projectPk }"><c:out value="${iwpt.projectName }"/></option> 
							</c:forEach>
						</select>
					</td>
					<td class="thRange" align="left">작업</td>
					<td class="thRange" colspan="6">
						<select id="taskList" name="workNo">
							
						</select>
					</td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">제기자</td>
					<td class="thRange">${sessionScope.loginUser.memberName }</td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange">제기일자</td>
					<td class="thRange"><c:out value="${today}"/></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
					<td class="thRange"></td>
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">이슈 구분</td>
					<td class="thRange" colspan="9">
					<select class="projectList" id="issueType" name="issueType">
						<option>선택하세요</option>
						<option value="버그발생">버그 발생</option>
						<option value="개선사항">개선사항</option>
						<option value="새기능">새 기능</option>
					</select>
					</td>
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
					<td class="thRange" colspan="16"><input type="text" id="taskTitle" name="issueTitle" placeholder="제목을 입력해주세요"></td>
					
				</tr>
				<tr>
					<td class="thRange"></td>
					<td class="thRange">이슈 내용</td>
					<td class="thRange" rowspan="5" colspan="16"><input type="text" name="issueContent" id="taskContent"></td>
					
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
							<a href="#this" id="add" class="btn">파일 추가하기</a> 
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
						<select class="projectList" id="projectTeam" name="teamWorker">
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
						<input type="date" name="actionDate" id="workDate">
					</td>
				</tr>
				<tr>
					<td class="thRange" colspan="18"><hr></td>
				</tr>
				<tr>
				
					<%-- <td id="account-status">
						<c:if test="${v.accountNum is not empty}">
						<c:out value="등록"/>
						</c:if>
					</td>  --%>
					<td class="thRange"></td>
					<td class="thRange"><button id="submitBtn" class="okBtn"><i class="fas fa-check"></i>&nbsp;저장</button></td>
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
		$("a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_fileDelete($(this));
        });
        $("#add").on("click",function(e){
            e.preventDefault();
            fn_fileAdd();
        });
        
        $("#submitBtn").onclick(function(){
        	$("#insertIssue").submit();
        });
        
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
					for(var i = 0; i < data.iw.length; i++){
						$("#taskList").append("<option value='" + data.iw[i]['workNo'] + "'>" + data.iw[i]['workName'] + "</option>");
						
					}
					
					for(var i = 0; i < data.ipt.length; i++){
						$("#projectTeam").append("<option value='" + data.ipt[i]['memberPk'] + "'>" + data.ipt[i]['memberName'] + "</option>");
						
					}
				},
				error:function(error){
					
				}
			});
		});
		
	});
	
	
	function fn_fileDelete(obj){
        obj.parent().parent().remove();
    }
	
    function fn_fileAdd(){
        var str = "<div style='filePlus'><div style='display: inline-flex;'><input type='file' class='fileCss' name='file'></div><div style='display: inline-flex;'><a href='#this' name='delete' class='btn'><i class='fas fa-minus-square'></i></a></div></div>";
        $("#fileUploadArea").append(str);
         
        $("a[name='delete']").on("click",function(e){
            e.preventDefault();
            fn_fileDelete($(this));         
        })
    }
	</script>
</body>
</html>