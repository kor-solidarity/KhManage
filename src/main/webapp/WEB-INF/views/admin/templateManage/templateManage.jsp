<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
   .titleText {
	padding-top: 13px;
	padding-left: 13px;
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
}
.inputMenu {
	border: 1px solid lightgray;
	width: 300px;
	outline:none;
	border-radius: 5px;
}
.selectMenu {
	border: 1px solid lightgray;
	width: 400px;
	outline:none;
	border-radius: 5px;
}
.titleId {
	color: #5E738B;
	font-weight: 600;
	font-size: 14px;
	padding-right: 10px;
	width:200px;
}
.insertForm{
	width:100%;
	margin: 0 auto;
}
.cancleBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #C6C6C6;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
}

.delBtn{
	width: 70px;
	height: 30px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;

}

.okBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 100px;
}
.copy{
	width: 120px;
	height: 30px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 10px;
}
.inputTd{
	width: 500px;
}
</style>
</head>
<body onload="$('#route1').text('관리자'), $('#route2').text('템플릿 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
		<div class="changePanel">
		
			<br><br>
			<ul class="changeList">
				<li id="requestLi"><a href="templateManagePage.am">등록정보</a>
				</li>
				<li id="approveLi"><a href="templateExcel.am">WBS</a>
				</li>
			</ul>
			<div class="panel panel-headline">
				<div class="panel-heading">
					<div style="width:100%; height:670px; margin:0 auto; overflow:auto;">
					<form method="post" action="tempUpdate.am" id="tempForm">
						<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">템플릿 등록 정보</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td class="titleId" style="padding-left:100px;">템플릿 명</td>
							<td class="inputTd">
							<input type="text" class="inputMenu" style="width:100%;" name="templateName" value="<c:out value='${tem.templateName}'/>">
							</td>
							<td class="titleId" style="padding-left:100px;">템플릿 분류</td>
							<td class="inputTd">
							<select style="width: 100%;" id="select" name="projectTypePk">
								<option>선택하세요</option>
								<option value="PTY001">개발유형1</option>
								<option value="PTY002">개발유형2</option>
								<option value="PTY003">개발유형3</option>
								<option value="PTY004">개발유형4</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId" style="padding-left:90px;">템플릿 설명</td>
							<td colspan="3">
								<textarea name="detail" class="inputMenu"rows="" cols="" style="width:100%; height:150px; margin-top:15px; resize: none; text-align: left;">
									<c:out value="${tem.detail}"/>
								</textarea>
								<input type="hidden" name="templatePk" value="${tem.templatePk}">
							</td>
						</tr>
						<tr height="10pxdj;"></tr>
						
						<tr height="10px;"></tr>
						
						
						<tr>
							<td colspan="4">
								<button class="okBtn" id="save">
									<i class="fas fa-check"></i>&nbsp;저장
								</button>
								<a href="accessManage.am">
								&nbsp;
								<button class="delBtn">
									<i class="fas fa-ban"></i>&nbsp;삭제
								</button>
								</a>
								<button class="copy" id="copy">
									<i class="fas fa-check"></i>&nbsp;템플릿 복사
								</button>
								<a href="accessManage.am">
								&nbsp;
								<button class="cancleBtn">
									<i class="fas fa-ban"></i>&nbsp;취소
								</button>
								</a>
							</td>
							
						</tr>
						</table>
						</form>
					</div>
				</div>
			</div>
		</div>
</body>
<script>
	$(function(){
		
		/* $("#select").childenren().val() == ${tem.projectTypePk} */
		 $("select option").each(function(){

			    if($(this).val()=="${tem.projectTypePk}"){

			      $(this).attr("selected","selected");

			    }

		 });
	});
	
	$("#okBtn").click(function(){
		
		$("#tempForm").submit();
	});
	
	
	
</script>


</html>




