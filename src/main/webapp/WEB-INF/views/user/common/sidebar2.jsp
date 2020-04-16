<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.menuName{
		margin-left:30px;
		font-size:14px;
	}
	
</style>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
</head>
<body>
<div id="sidebar-nav" class="sidebar">
			<div id="sidebar" class="sidebar-scroll" style="background: #1E2B44;">
				<nav>
					<ul class="nav">
						<li><a href="index.jsp" class="active"><i
								class="lnr lnr-home"></i> <span>HOME</span></a></li>
					<c:forEach var="m" items="${menuAllList}">
						<li>
					<c:if test="${ m.menuLevel ==1 }">
						<c:set var="dId" value="${m.menuNo}"/>
						<c:if test="${m.menuNo ne 'MU21'}">
						<a href="#${m.menuNo }" data-toggle="collapse"
							class="collapsed"><i class="${m.icon}"></i><span>${m.menuName }</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</c:if>
						<c:if test="${m.menuNo eq  'MU21' and loginUser.deptNo eq 'S05'}">
						<a id="${m.menuNo}" href="${m.iAddress}" data-toggle="collapse"
							class="collapsed"><i class="${m.icon}"></i><span>${m.menuName }</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</c:if>
						</c:if>
							<c:if test="${ m.menuLevel !=1 }">
							<div id="${m.highMenu}" class="collapse ">
								<ul class="nav">
							<c:forEach var="m" items="${menuAllList}">
							<c:if test="${ m.menuLevel==2 and dId eq m.highMenu}">
									<li id="location" class="location"><a href="${m.iAddress}" style="background:#24415C; height:56px;"><input type="hidden" id="hiddenMenuNo" class="hiddenMenuNo" value="${m.menuNo}"><label class="menuName"><c:out value="${m.menuName }"></c:out></label></a></li>
							</c:if>
							</c:forEach>
								</ul>
							</div>
							</c:if>
						</li>
						</c:forEach>
						
					</ul>
				</nav>
			</div>
		</div>
		<script>
		
		 	/* $(".nav").find(".location").on("click", function(){
				var menuNo = $(this).find(".hiddenMenuNo").val();
				
				 $.ajax({
						url:'checkAccessMember.am',
						type: 'post',
						data:{menuNo:menuNo},
					 success:function(data){
								if(data != 2){
									location.href=''+data['iAddress']+'';
								}else{
									swal({
						                 title: "접근하실 수 없는 메뉴입니다.",
						                 text: "관리자에 의해 권한이 필요합니다.",
						                icon: "error"
						              });
								}
							}
					}); 
			});  */
			
		 	$("#MU21").click(function(){
		 		location.href='adminShowMain.me';
		 	});
			
		</script>
	<div class="main">
	<div class="container-fluid">
	<label id="route1" style="margin-top:5px;"></label> > <label id="route2" style="margin-top:5px;"></label>
</body>
</html>