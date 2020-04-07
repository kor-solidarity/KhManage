<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
	#projectNav > ul > li{
		padding-left: 10px;
		padding-right:  10px;
	}
	#projectNav > ul > li.active{
		padding-left: 0;
		padding-right: 0;
	}
	#projectNav > ul > li.active > a{
		padding-left: 25px;
		padding-right: 25px;
	}
	#projectNav > ul > li:not(.active) {
		background: #1E2B44;
	}
	#projectNav > ul > li:not(.active) > a {
		color: whitesmoke;
	}

	#projectNav > ul > li:not(.active):hover,
	#projectNav > ul > li:not(.active) >a:hover {
		background: #1E2B44;
		border-color: #1E2B44;
	}
	.nav-tabs{
		border-bottom: 1px solid #1E2B44;
	}

</style>

<%--todo 클릭시 이동, 그리고 해당 페이지에 도달했을 시 클릭여부 등--%>
<div class="container" id="projectNav" style="width: 100%">
	<ul class="nav nav-tabs">
		<li role="presentation" class="active"><a href="#">요약정보</a></li>
		<li role="presentation"><a href="#">기본정보</a></li>
		<li role="presentation"><a href="#">리소스</a></li>
		<li role="presentation"><a href="${ path}/aa">프로젝트작업</a></li>
		<li role="presentation"><a href="#">배정현황</a></li>
		<li role="presentation"><a href="#">이슈</a></li>
		<li role="presentation"><a href="#">산출물</a></li>
		<li role="presentation"><a href="#">히스토리</a></li>
	</ul>
	<%--
	도는 방식:

	--%>
	<script>
		console.log("{ path}: " + "${path}");

	</script>
</div>