<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	body {
    background-color: #f0f6ff;
    color: #28384d;
    overflow: scroll;

}
.card-one {
    position: relative;
    width: 300px;
    background: #fff;
    box-shadow: 0 10px 7px -5px rgba(0, 0, 0, 0.4);
}
.card {
    margin-bottom: 35px;
    box-shadow: 0 10px 20px 0 rgba(26, 44, 57, 0.14);
    border: none;
}

.follower-wrapper li {
    list-style-type: none;
    color: #fff;
    display: inline-block;
    float: left;
    margin-right: 20px;
}



.social-profile {
    color: #fff;
}

.social-profile a {
    color: #fff;
}

.social-profile {
    position: relative;
    margin-bottom: 150px;
}

.social-profile .user-profile {
    position: absolute;
    bottom: -75px;
    width: 150px;
    height: 150px;
    border-radius: 50%;
    left: 50px;
}

.social-nav {
    position: absolute;
    bottom: 0;
}

.social-prof {
    color: #333;
    text-align: center;
}

.social-prof .wrapper {
    width: 70%;
    margin: auto;
    margin-top: -100px;
}

.social-prof img {
    width: 150px;
    height: 150px;
    border-radius: 50%;
    margin-bottom: 20px;
    border: 5px solid #fff;
    /*border: 10px solid #70b5e6ee;*/
}

.social-prof h3 {
    font-size: 36px;
    font-weight: 700;
    margin-bottom: 0;
}

.social-prof p {
    font-size: 18px;
}

.social-prof .nav-tabs {
    border: none;
}

.card .nav>li {
    position: relative;
    display: block;
}

.card .nav>li>a {
    position: relative;
    display: block;
    padding: 10px 15px;
    font-weight: 300;
    border-radius: 4px;
}

.card .nav>li>a:focus,
.card .nav>li>a:hover {
    text-decoration: none;
    background-color: #eee;
}

.card .s-nav>li>a.active {
    text-decoration: none;
    background-color: #3afe;
    color: #fff;
}

.text-blue {
    color: #3afe;
}

ul.friend-list {
    margin: 0;
    padding: 0;
}

ul.friend-list li {
    list-style-type: none;
    display: flex;
    align-items: center;
}

ul.friend-list li:hover {
    background: rgba(0, 0, 0, .1);
    cursor: pointer;
}

ul.friend-list .left img {
    width: 45px;
    height: 45px;
    border-radius: 50%;
    margin-right: 20px;
}

ul.friend-list li {
    padding: 10px;
}

ul.friend-list .right h3 {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 0;
}

ul.friend-list .right p {
    font-size: 11px;
    color: #6c757d;
    margin: 0;
}

.social-timeline-card .dropdown-toggle::after {
    display: none;
}

.info-card h4 {
    font-size: 15px;
}

.info-card h2 {
    font-size: 18px;
    margin-bottom: 20px;
}

.social-about .social-info {
    font-size: 16px;
    margin-bottom: 20px;
}

.social-about p {
    margin-bottom: 20px;
}

.info-card i {
    color: #3afe;
}

.card-one {
    position: relative;
    width: 300px;
    background: #fff;
    box-shadow: 0 10px 7px -5px rgba(0, 0, 0, 0.4);
}

.card-one .header {
    position: relative;
    width: 100%;
    height: 60px;
    background-color: #3afe;
}

.card-one .header::before,
.card-one .header::after {
    content: '';
    position: absolute;
    top: 0;
    bottom: 0;
    left: 0;
    right: 0;
    background: inherit;
}

.card-one .header::before {
    -webkit-transform: skewY(-8deg);
    transform: skewY(-8deg);
    -webkit-transform-origin: 100% 100%;
    transform-origin: 100% 100%;
}

.card-one .header::after {
    -webkit-transform: skewY(8deg);
    transform: skewY(8deg);
    -webkit-transform-origin: 0 100%;
    transform-origin: 0 100%;
}

.card-one .header .avatar {
    position: absolute;
    left: 50%;
    top: 30px;
    margin-left: -50px;
    z-index: 5;
    width: 100px;
    height: 100px;
    border-radius: 50%;
    overflow: hidden;
    background: #ccc;
    border: 3px solid #fff;
}

.card-one .header .avatar img {
    position: absolute;
    top: 50%;
    left: 50%;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    width: 100px;
    height: auto;
}

.card-one h3 {
    position: relative;
    margin: 80px 0 30px;
    text-align: center;
}

.card-one h3::after {
    content: '';
    position: absolute;
    bottom: -15px;
    left: 50%;
    margin-left: -15px;
    width: 30px;
    height: 1px;
    background: #000;
}

.card-one .desc {
    padding: 0 1rem 2rem;
    text-align: center;
    line-height: 1.5;
    color: #777;
}

.card-one .contacts {
    width: 200px;
    max-width: 100%;
    margin: 0 auto 3rem;
}

.card-one .contacts a {
    display: block;
    width: 33.333333%;
    float: left;
    text-align: center;
    color: #c8c;
}

.card-one .contacts a:hover {
    color: #333;
}

.card-one .contacts a:hover .fa::before {
    color: #fff;
}

.card-one .contacts a:hover .fa::after {
    width: 100%;
    height: 100%;
}

.card-one .contacts a .fa {
    position: relative;
    width: 40px;
    height: 40px;
    line-height: 39px;
    overflow: hidden;
    text-align: center;
    font-size: 1.3em;
}

.card-one .contacts a .fa:before {
    position: relative;
    z-index: 1;
}

.card-one .contacts a .fa::after {
    content: '';
    position: absolute;
    top: 50%;
    left: 50%;
    width: 0;
    height: 0;
    -webkit-transform: translate(-50%, -50%);
    transform: translate(-50%, -50%);
    background: #c8c;
    transition: width .3s, height .3s;
}

.card-one .contacts a:last-of-type .fa {
    line-height: 36px;
}

.card-one .footer {
    position: relative;
    padding: 1rem;
    background-color: #3afe;
    text-align: center;
}

.card-one .footer a {
    padding: 0 1rem;
    color: #e2e2e2;
    transition: color .4s;
}

.card-one .footer a:hover {
    color: #c8c;
}

.card-one .footer::before {
    content: '';
    position: absolute;
    top: -27px;
    left: 50%;
    margin-left: -15px;
    border: 15px solid transparent;
    border-bottom-color: #3afe;
}

.card-title, .card .card-title, .card-2 .card-title {
    font-size: 16px;
    font-weight: 700;
    margin-bottom: 20px;
}
a {
    color: #333;
}
.badge {
    font-size: 12px;
    line-height: 1;
    padding: .375rem .5625rem;
    font-weight: normal;
}

.badge-primary {
    color: #447de8;
    background-color: #e6edff;
}
.badge {
    display: inline-block;
    padding: .4em .5em;
    font-size: 75%;
    font-weight: 700;
    line-height: 1;
    text-align: center;
    white-space: nowrap;
    vertical-align: baseline;
    transition: color .15s ease-in-out, background-color .15s ease-in-out, border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
.main{
	height: auto;
}
</style>
</head>
<body onload="$('#route1').text('타임라인')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
		<div class="panel panel-headline" style="height: auto;">
				<div class="panel-heading" style="height: auto;">
<main>
    <div class="container" style="width:1300px;">
        <div class="row">
            <div class="col-md-12">
                <div class="top-breadcrumb">
                    <nav aria-label="breadcrumb">
                       
                    </nav>
                </div>
            </div>
        </div>
        <div class="card social-prof">
            <div class="card-body">
                <div class="wrapper">
                    <img src="<c:url value="/resources/uploadFiles/${loginUser.changeName}"/>" class="user-profile">
                    <h3>${loginUser.memberName }</h3>
                    <p>${loginUser.deptName } / ${loginUser.rankName }</p>
                </div>
                <div class="row ">
                    <div class="col-lg-12">
                        <ul class=" nav nav-tabs justify-content-center s-nav">
                            <li><a class="active" href="#" style="background: #1E2B44;">타임라인</a></li>
                         
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="row" style="display: inline-block;">
                <div class="card" style="display: inline-block;">
                    <div class="card-body">
                        <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                            <ol class="carousel-indicators">
                                <li data-target="#carouselExampleIndicators" data-slide-to="0" class=""></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="1" class=""></li>
                                <li data-target="#carouselExampleIndicators" data-slide-to="2" class="active"></li>
                            </ol>
                          
                            <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="sr-only">Previous</span>
                            </a>
                            <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="sr-only">Next</span>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-9 gedf-main">
                <!--- \\\\\\\Post-->
                <div class="card social-timeline-card">
                    <div class="card-header">
                        <ul class="nav nav-tabs card-header-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="posts-tab" data-toggle="tab" href="#posts" role="tab" aria-controls="posts" aria-selected="true">작성</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" id="images-tab" data-toggle="tab" role="tab" aria-controls="images" aria-selected="false" href="#images">이미지 등록</a>
                            </li>
                        </ul>
                    </div>
                    <div class="card-body">
                    <form action="insertTimeLine.ti" method="post" enctype="multipart/form-data" encoding="multipart/form-data" novalidate="true">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade active show" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" name="content" id="message" rows="3" ></textarea>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group">
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile" name="file">
                                        <label class="custom-file-label" for="customFile">Upload image</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                            <div class="btn-group">
                                <button type="submit" class="btn btn-theme-primary" style="background: #1E2B44; color:white;">등록</button>
                            </div>
                            <div class="btn-group">
                             
                            </div>
                        </div>
                         </form>   
                    </div>
                <i class="fas fa-sync-alt" onclick="location.reload();" style="float:right; margin-top: 10px; margin-right: 10px; color:green; font-size: 18px; cursor: pointer;"></i>
                </div>
                <!-- Post /////-->
                <!--- \\\\\\\Post-->
                <c:forEach var="t" items="${tList }">
                <div class="card social-timeline-card" >
                    <div class="card-header">
                        <div class="d-flex justify-content-between align-items-center">
                            <div class="d-flex justify-content-between align-items-center">
                                <div class="mr-2">
                                    <img class="rounded-circle" width="60" height="50" src="<c:url value="/resources/uploadFiles/${t.userChangeName}"/>" alt="">
                                </div>
                                <div class="ml-2">
                                    <div class="h5 m-0 text-blue">@${t.memberName }</div>
                                </div>
                            </div>
                            <div>
                                <div class="dropdown">
                                    <div class="dropdown-menu dropdown-menu-right" aria-labelledby="gedf-drop11">
                                        <div class="h6 dropdown-header">Configuration</div>
                                        <a class="dropdown-item" href="#">Save</a>
                                        <a class="dropdown-item" href="#">Hide</a>
                                        <a class="dropdown-item" href="#">Report</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="text-muted h7 mb-2" style="margin-bottom: 20px;"> 
                        <c:if test="${t.sec < 60}">
                        	<i class="far fa-clock"></i>${t.sec }초 전
                        </c:if>	
                        <c:if test="${t.sec >= 60}">
                        	<c:if test="${t.min < 60}">
                        		<i class="far fa-clock"></i>${t.min }분 전
                        	</c:if>
                        	<c:if test="${t.min >= 60 and t.hour <= 24}">
                        		<i class="far fa-clock"></i>${t.hour }시간 전
                        	</c:if>
                        	<c:if test="${t.min >= 60 and t.hour > 24}">
                        		<i class="far fa-clock"></i>${t.day }일 전
                        	</c:if>
                        </c:if>
                        
                        </div>
                        	<c:if test="${t.changeName != null}">
                     		 <img width="300" height="200" src="<c:url value="/resources/uploadFiles/${t.changeName}"/>" class="user-profile">
                     		 </c:if>
                        <a class="card-link" href="#">
                            <h5 class="card-title">${t.content}</h5>
                            <h6>${t.enrollDate }</h6>
                        </a>
                        <img src="img/gallery/1a.jpg" alt="" class="img-fluid">

                    </div>
                    <div class="card-footer">
                        <a class="card-link"><i class="fa fa-comment" style="color: #1E2B44;"></i> 댓글</a> &nbsp;&nbsp;
                        <a href="#" class="card-link"><i class="fa fa-mail-forward"></i>공유</a>
                    </div>
                </div>
                </c:forEach>
                <!-- Post /////-->
                <!--- \\\\\\\Post-->
              
              
        </div>
          <div class="col-lg-3"  id="floatMenu" style="display: inline-block !important; float: right; height:800px; overflow: auto;" >
                <div class="card social-timeline-card">
                    <div class="card-body">
                        <h5 class="card-title">PLANNING HUB 인원목록</h5>
                        <ul class="friend-list">
                        <c:forEach var="m" items="${mList }">
                            <li>
                                <div class="left">
                                	<c:if test="${m.changeName != null }">
                                    	<img src="<c:url value="/resources/uploadFiles/${m.changeName}"/>" alt="">
                                    </c:if>
                                	<c:if test="${m.changeName == null}">
                                    	<img src="<c:url value="/resources/img/people.png"/>" alt="">
                                    </c:if>
                                </div>
                                <div class="right">
                                    <h3 style="margin-top: 2px;">${m.memberName }</h3>
                                    <p>${m.deptName }/${m.rankName }</p>
                                </div>
                            </li>
                            </c:forEach>
                       
                        </ul>
                    </div>
                </div>
            </div>
    </div>
</main>

				</div>
		</div>			
		<script>
		/* $(document).ready(function() {

			// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
			var floatPosition = parseInt($("#floatMenu").css('top'));
			// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );
			console.log("확인 스크롤 : " + $(".panel-heading").scrollTop());
			$(window).scroll(function() {
				// 현재 스크롤 위치를 가져온다.
				var scrollTop = $(window).scrollTop();
				var newPosition = scrollTop + floatPosition + "px";
				
				
				$("#floatMenu").stop().animate({
					"top" : newPosition
				}, 100);

			}).scroll();

		}); 
		 */
		/* $(window).scroll(function( ){  //스크롤이 움직일때마다 이벤트 발생 
			
		      var position = $(window).scrollTop(); // 현재 스크롤바의 위치값을 반환합니다.
		      
		      if(position <400){
		    	  position = 0;
		    	  $("#floatMenu").stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
		    	  
		      }else{
		     	 $("#floatMenu").stop().animate({top:position+"px"}, 1); //해당 오브젝트 위치값 재설정
		    	  
		      }
		      
		 }); */
	</script>
	
	<script>
		$(".card-link").click(function(){
			console.log($(this).parent().parent());
			$(this).parent().parent().append("<div class='commentArea' style='width:300px; height:50px;'> sss</div>")
		});
		
		$(".active").click(function(){
			console.log("삭제");
			$(this).parent().parent().append("<div class='commentArea' style='width:300px; height:50px;'> sss</div>")
		});
	</script>


</body>
</html>