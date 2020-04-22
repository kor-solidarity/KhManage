<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--프로젝트 센터 부분 navbar--%>
<style>
	#projectNav > ul > li {
		padding-left: 10px;
		padding-right: 10px;
	}

	#projectNav > ul > li.active {
		padding-left: 0;
		padding-right: 0;
	}

	#projectNav > ul > li.active > a {
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
	#projectNav > ul > li:not(.active) > a:hover {
		background: #1E2B44;
		border-color: #1E2B44;
	}

	.nav-tabs {
		border-bottom: 1px solid #1E2B44;
	}

</style>

<%--todo 클릭시 이동, 그리고 해당 페이지에 도달했을 시 클릭여부 등 - 겟 형태로 프로젝트ID 넘겨야할듯--%>
<div class="container" id="projectNav" style="width: 100%">
	<ul class="nav nav-tabs">
		<li role="presentation" class=""><a href="showProjectSummary.pr?pid=${pid}&type=0">요약정보</a></li>
		<li role="presentation"><a href="#">기본정보</a></li>
		<li role="presentation"><a href="showResource.pr?pid=${pid}&type=2">리소스</a></li>
		<li role="presentation"><a href="${path}/projectTask.pr?pid=${pid}&type=3">프로젝트작업</a></li>
		<li role="presentation"><a href="#">배정현황</a></li>
		<li role="presentation"><a href="projectIssue.pr?pid=${pid}&type=5">이슈</a></li>
		<li role="presentation"><a href="projectOutput.pr?pid=${pid}&type=6">산출물</a></li>
		<li role="presentation"><a href="#">히스토리</a></li>
	</ul>
	<%--
	도는 방식:

	--%>
	<script>
        <%--console.log("{ path}: " + "${path}");--%>
		<%--console.log("adding active class... pid: " + '${pid}' )--%>
		// 위에 li 목록에 선택된건지 조치시키는 절차.
		// 	그렇기에 프로젝트 작업페이지 여는게 있으면 무조건 타입 어트리뷰트 넣을것. 안그러면 오류남
		// 	요약정보 부터 0에서 시작함
		var urlString = window.location.href;
		var url = new URL(urlString);
		$(".nav-tabs li").eq(url.searchParams.get("type")).attr('class', 'active');
	</script>
</div>