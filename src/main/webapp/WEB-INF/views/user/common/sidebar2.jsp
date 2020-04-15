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
</head>
<body>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<div id="sidebar-nav" class="sidebar">
			<div class="sidebar-scroll" style="background: #1E2B44;">
				<nav>
					<ul class="nav">
						<li><a href="index.jsp" class="active"><i
								class="lnr lnr-home"></i> <span>HOME</span></a></li>
					<c:forEach var="m" items="${list}">
						<li>
					<c:if test="${ m.menuLevel ==1 }">
						<c:set var="dId" value="${m.menuNo}"/>
						<a href="#${m.menuNo }" data-toggle="collapse"
							class="collapsed"><i class="${m.icon}"></i><span>${m.menuName }</span>
								<i class="icon-submenu lnr lnr-chevron-left"></i></a>
						</c:if>
							<c:if test="${ m.menuLevel !=1 }">
							<div id="${m.highMenu}" class="collapse ">
								<ul class="nav">
							<c:forEach var="m" items="${list}">
							<c:if test="${ m.menuLevel==2 and dId eq m.highMenu}">
									<li><a href="${m.iAddress}" class="" style="background:#24415C; height:56px;"><label class="menuName"><c:out value="${m.menuName }"></c:out></label></a></li>
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
	<div class="main">
	<div class="container-fluid">
	<label id="route1" style="margin-top:5px;"></label> > <label id="route2" style="margin-top:5px;"></label>
</body>
</html>