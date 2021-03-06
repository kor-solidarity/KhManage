<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

.projectBtn {
	width: 130px;
	height: 27px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 600;
	border-radius: 5px;
	margin-right: 6px;
	font-size: 14px;
}


.pagingArea {
	/* background: ; */
	height: 50px;
	margin: 0 auto;
	/* border: 1px solid #B0B0B0; */
}

.paging {
	margin-left: 200px;
	width: 50%;
}

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
	/* #boardTable{
		width:95%;
		text-align:left;
		margin-top: 100px;
	} */
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
		height: 45px;
		width: 220px;
	}
	.titletd{
		height: 20px;
		text-align: center;
		width: 700px;
		padding-right: 100px;
	}
	.datetd{
		height: 45px;
		text-align: center;
		width: 250px;
	}
	.sendtd2{
		text-align: center;
		height: 30px;
		width: 130px;
	}
	.titletd2{
		height: 45px;
		text-align: left;
		width: 800px;
		padding-left: 30px;
	}
	.datetd2{
		height: 22px;
		text-align: center;
		width: 250px;
	}
	#boardTable #tr:hover{
		background : #f5f8ff;
		cursor: pointer;
		color: black;
	}
	.td{
		width: 10px;
	}	
	
	#tr {
		height: 30px;
	}
	
	.tr {
		background: #F3F3F3;
		border-top: 1px solid gray;
	}
	
</style>
</head>
<body onload="$('#route1').text('커뮤니티'); $('#route2').text('정보공유게시판')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 700px; margin: 0 auto; overflow: auto;">
				<table align="left" id="" style="margin-bottom: 10px;">
					<tr id="tr">
						<td>
							<button class="projectBtn"
								onclick="location.href='insertBoardPage.ib'">
								<i class="fas fa-edit"></i> &nbsp;게시글 등록
							</button>
						<td colspan="6">
							&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
						<td style="width: 65%"></td>
						
						<td style="width: 30%">
							<form class="navbar-form navbar-left"
								style="float: right; margin-left: 20px;">
								<div class="input-group">
									<input type="text" value="" class="form-control"> 
										<span class="input-group-btn"><button
											type="button" style="background: #1E2B44;"
											class="btn btn-primary">
											<i class="fas fa-search"></i>
										</button></span>
								</div>
							</form>						
						</td>
					</tr>
				</table>

				<table id="boardTable" align="center">
					<tr class="tr" style="background: #1E2B44; color: white;">
						<th class="titletd">제목</th>
						<th class="datetd">작성자</th>
						<th class="sendtd">조회수</th>
						<th class="sendtd">등록일</th>
						<th></th>
					</tr>
					<c:forEach var="ib" items="${blist}">
					<tr id="tr" style="border-bottom: 1px solid #d2d2d2; border-top: 1px solid #d2d2d2; height:30px;">
						<%-- <td class="titletd2">${ib.boardTitle} &nbsp;&nbsp;<span><b>[${rlist.size()}]</b></span></td> --%>
						<td class="titletd2">${ib.boardTitle} &nbsp;&nbsp;&nbsp; </td>
						<td class="datetd2">${ib.memberName}</td>
						<td class="sendtd2">${ib.viewCount}</td>
						<%-- <td class="sendtd2"><fmt:formatDate value="" pattern="yyyy-MM-dd HH-mm:SS"/></td> --%>
						<td class="sendtd2">${ib.createDate}</td>
						<td class="td">
							<input type="hidden" value="${ib.boardNo}">
						</td>
					</tr>
					</c:forEach>
					
					
					<tr class="pagingArea">
						<td colspan="0">
							<div class="paging">
								<c:if test="${pi.currentPage <= 1 }">
									이전 &nbsp;
									</c:if>
									<c:if test="${ pi.currentPage > 1 }">
									<c:url var="alistBack" value="infoBoard.ib">
										<c:param name="currentPage" value="${pi.currentPage - 1 }"/>
									</c:url>
										<a href="${ alistBack }">이전</a>&nbsp;
									</c:if>
									<c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage }">
										<c:if test="${p eq pi.currentPage }">
											<font color="#1E2B44" size="4"><b>${p }</b></font>
										</c:if>
										<c:if test="${p ne pi.currentPage }">
											<c:url var="alistCheck" value="infoBoard.ib">
												<c:param name="currentPage" value="${p }"/>
											</c:url>
											
											<a href="${alistCheck }"> ${p}</a>
										</c:if>
										&nbsp;
									</c:forEach>
									
									<c:if test="${pi.currentPage >= pi.endPage }">
										다음 &nbsp;
									</c:if>
								<c:if test="${pi.currentPage < pi.endPage }">
								<c:url var="alistEnd" value="infoBoard.ib">
									<c:param name="currentPage" value="${pi.currentPage + 1 }"/>
								</c:url>
									<a href="${alistEnd}">다음</a>
								</c:if>									
							</div>
						</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
</body>
<script>
	
	//게시글 상세보기 이동
	$("#boardTable #tr").click(function() {
		
		var boardNo = $(this).children().children().val();
		
		console.log(boardNo);
		
		location.href = "selectOneBoard.ib?boardNo=" + boardNo;
	});
	
	
</script>


</html>





