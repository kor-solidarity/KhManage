<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*, com.kh.manage.mail.model.vo.*, com.kh.manage.forum.model.vo.*"%>
<%
	List<Mail> list = (ArrayList<Mail>) request.getAttribute("list");
%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
</head>
<style>
	.pagingArea{
		margin: 0 auto;
	}
	.paging{
		text-align: center;
	}
	#mailTable{
		width:100%;
		text-align:left;
		margin-top: 100px;
		height: 700px;
	}
	#mailTable .tr:hover{
		background: #FDF5E6;
		
	}  
	/* .wjs_btn{
		border-radius: 5px;
		border: 1px solid #D4D4D4;
		float: left;
		margin-top: 25px;
		margin-left: 10px;
		background: white;
		color: #8F8E8E;
	} */
	.wjs_btn{
      /* width:70px; */
      height:30px;
      border:none;
      background: #1E2B44;
      color:white;
      font-weight:600;
      border-radius: 5px;
      font-size:14px;
      margin-left: 10px;
      margin-top: 24px;
      float: left;
      
   } 

/* .cancleBtn{
      width:70px;
      height:30px;
      border:none;
      background:#E5E5E5;
      color:white;
      font-weight:600;
      border-radius: 5px;
      font-size:14px;
	}    */
	.star{
		width: 18px;
		height: 18px;
	}
	.mail{
		width: 18px;
		height: 18px;
	}
	.chktd{
		width: 90px;
		height: 35px;
		text-align: center;
	}
	.startd{
		width: 90px;
		text-align: center;
		height: 35px;
	}
	.mailtd{
		width: 90px;
		height: 35px;
		text-align: center;
	}
	.sendtd{
		text-align: center;
		height: 35px;
		width: 400px;
	}
	.titletd{
		height: 35px;
		text-align: center;
		width: 560px;
	}
	.datetd{
		height: 35px;
		text-align: center;
		width: 350px;
	}
	.p{
		margin: 0 auto;
		color : #1478FF;
		
	}
</style>
<body>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/mailSidebar.jsp"/>
	<div class="panel panel-headline">
	<div class="panel-heading">
	
	<div>
	<img src="resources/img/rec2.png" style="width: 30px; height: 30px; float: left; margin-top: 6px; margin-right: 15px; margin-left: 10px;">
	<p style="font-weight: bold; font-size: 32px; margin-top: 10px; margin-left: 10px;">받은 메일함</p>
	
	</div>
	
	<div id= "btn"style="width: 1620px;">
		<button class="wjs_btn" style="width: 110px;"><i class="fas fa-check" style="margin-right: 7px;"></i>  전체 선택</button>
		<button class="wjs_btn" style="width: 90px;"><i class="fas fa-edit" style="margin-right: 7px;"></i>답장</button>
		<button class="wjs_btn" style="width: 90px;"><i class="fas fa-trash-alt" style="margin-right: 7px;"></i>삭제</button>
		<button class="wjs_btn" style="width: 90px;"><i class="fas fa-envelope-open" style="margin-right: 7px;"></i>읽음</button>
			
	</div>
		<form class="navbar-form navbar-left" style="float: left; margin-left: 20px;">
					<div class="input-group">
						<input type="text" value="" class="form-control" placeholder="메일 검색">
						<span class="input-group-btn"><button type="button"
								style="background: #1E2B44;" class="btn btn-primary">
								<i class="fas fa-search"></i>
							</button></span>
					</div>
		</form>
	
	<table id="mailTable" align="center">
		<tr style="border: 1px solid #D9D8D8;">
			<td class="chktd"><input type="checkbox"></td>
			<td class="startd"><img  src="resources/img/star.png" class="star"></td>
			<td class="mailtd"><img  src="resources/img/mail.png" class="mail"></td>			
			<td class="sendtd">보낸사람</td>
			<td class="titletd">제목</td>
			<td class="datetd">날짜</td>
		</tr>
		<c:forEach var="m" items="${list }">
			<tr class="tr">
				<td style="display: none;"><input type="hidden" value="${m.mailNo }"></td>
				<td class="chktd"><input type="checkbox"></td>
				<td class="startd"><img  src="resources/img/star.png" class="star ${m.mailNo} }"></td>
				<td class="mailtd"><img  src="resources/img/ma.png" class="mail" id="${m.mailNo}"></td>
				<td class="sendtd"><p class="p p${m.mailNo}">${m.from }</p></td>
				<td class="titletd"><p class="p p${m.mailNo}">${m.subject }</p></td>
				<td class="datetd">${m.enrollDate }</td>
			</tr>
		</c:forEach>
		
		<tr class="pagingArea">
								<td colspan="6">
									<div class="paging">
										<c:if test="${pi.currentPage <= 1 }">
												[이전] &nbsp;
												</c:if>
												<c:if test="${ pi.currentPage > 1 }">
												<c:url var="alistBack" value="mailSent.ma">
													<c:param name="currentPage" value="${pi.currentPage - 1 }"/>
												</c:url>
													<a href="${ alistBack }">[이전]</a>&nbsp;
												</c:if>
												<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
													<c:if test="${p eq pi.currentPage }">
														<font color="red" size="4"><b>[${p }]</b></font>
													</c:if>
													<c:if test="${p ne pi.currentPage }">
														<c:url var="alistCheck" value="accessManage.am">
															<c:param name="currentPage" value="${p }"/>
														</c:url>
														
														<a href="${alistCheck }"> ${p}</a>
													</c:if>
												</c:forEach>
												
												<c:if test="${pi.currentPage >= pi.endPage }">
													[다음] &nbsp;
												</c:if>
												<c:if test="${pi.currentPage < pi.endPage }">
												<c:url var="alistEnd" value="mailSent.ma">
													<c:param name="currentPage" value="${pi.currentPage + 1 }"/>
												</c:url>
													<a href="${alistEnd}">[다음]</a>
												</c:if>									
									</div>
								</td>
							</tr>
	</table>
	
	</div>
	</div>	
</body>
<script>
	$("#mailTable tr").click(function(){
	 var num = $(this).children().eq(0).children().val(); 
	 
	 console.log(num);
	 
	 location.href="mailReceived.ma?no="+num;
	 
	});

	
	$(function(){
		
		<%for(int i = 0 ; i < list.size(); i ++ ){
		 	Mail m = (Mail)list.get(i);
		%>
			if("<%=m.getImportant()%>" ==  'Y'){
				$(".<%=m.getMailNo()%>").prop("src" , "resources/img/star3.png");
			}else{
				$(".<%=m.getMailNo()%>").prop("src" , "resources/img/star.png");
			}		
			
			if("<%=m.getRead()%>" ==  'Y'){
				$("#<%=m.getMailNo()%>").prop("src" , "resources/img/op.png");
				$(".p<%=m.getMailNo()%>").css("color","black");
			}else{
				$("#<%=m.getMailNo()%>").prop("src" , "resources/img/ma.png");
			}	
			
		<%}%>
		
		
		
		
	});
	
</script>
</html>





