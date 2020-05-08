<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	
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
html, body {
         margin: 0;
         padding: 0;
         height: 100%;
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
.tag{
   border:1px solid lightgray;
   border-radius: 10px;
}

.tagLabel{
   outline:none;
   cursor:pointer;
}

.commentLabel{
   font-family: 'Stylish', sans-serif;
}
.profile {
	width: 100%;
	height: 100%;
	object-fit: cover;
}
	.box {
	width: 40px;
	height: 40px;
	border-radius: 40%;
	overflow: hidden;
	margin-left: 5px;
	margin-top:20px;
	display: inline-block;
}

.nameDiv{
	font-family: 'Stylish', sans-serif;
}
</style>
<link href="https://fonts.googleapis.com/css2?family=Stylish&display=swap" rel="stylesheet">
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
            <div class="col-lg-9 gedf-main" style="display: inline-block;">
                <!--- \\\\\\\Post-->
                <div class="card social-timeline-card" style="height: auto;">
                    <div class="card-header" style="height: auto">
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
                    <form id="insertForm" action="insertTimeLine.ti" method="post"  enctype="multipart/form-data" encoding="multipart/form-data" novalidate="true">
                        <div class="tab-content" id="myTabContent">
                            <div class="tab-pane fade active show" id="posts" role="tabpanel" aria-labelledby="posts-tab">
                                <div class="form-group" id="plusTest">
                                    <label class="sr-only" for="message">post</label>
                                    <textarea class="form-control" name="content" id="message" rows="3" ></textarea>
                                    <label style="background: skyblue; border-radius:5px; font-size:14px; margin-top:5px; margin-bottom:1px; margin-left:2px; color:white; padding-left: 5px; padding-right: 5px;">#태그</label>
                                    <br>
                                    <input hidden="hidden" name="tagName11"/>
                                    <input type="text" class="tag" name="tag" placeholder="#" >
                                    <label class="shap" style="display:none; color:#1E2B44; margin-bottom:0px; font-size: 12px;">'#'을 붙여주세요</label>
                                    <br><br>
                                </div>
                            </div>
                            <div class="tab-pane fade" id="images" role="tabpanel" aria-labelledby="images-tab">
                                <div class="form-group" >
                                    <div class="custom-file">
                                        <input type="file" class="custom-file-input" id="customFile" name="file">
                                        <label class="custom-file-label" for="customFile">Upload image</label>
                                    </div>
                                </div>
                                <div class="py-4"></div>
                            </div>
                        </div>
                        <div class="btn-toolbar justify-content-between">
                         <i class="fas fa-sync-alt" onclick="location.reload();" style="float:right; margin-top: 10px; margin-bottom:10px; margin-right: 10px; color:green; font-size: 18px; cursor: pointer;"></i>
                            <div class="btn-group">
                                <button type="button" id="submitBtn" class="btn btn-theme-primary" style="background: #1E2B44; color:white;">등록</button>
                            </div>
                            <div class="btn-group">
                             
                            </div>
                        </div>
                         </form>   
                    </div>
                </div>
                
                <!-- Post /////-->
                <!--- \\\\\\\Post-->
                <c:forEach var="t" items="${tList }">
                <div class="card social-timeline-card"  onclick="$('#${t.timeLineNo}').modal('show');" >
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
                    <div class="card-body" style="width: 50%;" >
                        <div class="text-muted h7 mb-2" style="margin-bottom: 20px; width: 50%;"> 
                        <c:if test="${t.sec < 60}">
                           <i class="far fa-clock"></i>&nbsp;${t.sec }초 전
                        </c:if>   
                        <c:if test="${t.sec >= 60}">
                           <c:if test="${t.min < 60}">
                              <i class="far fa-clock"></i>&nbsp;${t.min }분 전
                           </c:if>
                           <c:if test="${t.min >= 60 and t.hour <= 24}">
                              <i class="far fa-clock"></i>&nbsp;${t.hour }시간 전
                           </c:if>
                           <c:if test="${t.min >= 60 and t.hour > 24}">
                              <i class="far fa-clock"></i>&nbsp;${t.day }일 전
                           </c:if>
                        </c:if>
                        </div>
                           <c:if test="${t.changeName != null}">
                            <img width="300" height="200" src="<c:url value="/resources/uploadFiles/${t.changeName}"/>" class="user-profile">
                           
                            </c:if>
                        <a class="card-link" href="#">
                            <h5 class="card-title" style="font-family: 'Stylish', sans-serif;">${t.content}</h5>
                            <h6>${t.enrollDate }</h6>
                        </a>
                        <img src="img/gallery/1a.jpg" alt="" class="img-fluid">

                    </div>
                    <div class="card-footer" style="width: 50%;">
                        <a class="card-link"><i class="fa fa-comment" style="color: #1E2B44;"></i> 댓글</a> &nbsp;&nbsp;
                        <a class="card-link"><i class="fa fa-mail-forward"></i>공유</a>
                    </div>
                </div>
                
            <div class="modal fade" id="${t.timeLineNo}" role="dialog"
                  aria-labelledby="gridSystemModalLabel" aria-hidden="true">
                  <div class="modal-dialog" style="margin: 0 auto;">
                     <div class="modal-content" style="width: 1000px; right: 250px; top: 100px;">
                        <div class="modal-header">
                           <button type="button" class="close" data-dismiss="modal"
                              aria-label="Close">
                              <span aria-hidden="true">&times;</span>
                           </button>
                           <h4 class="modal-title" id="gridSystemModalLabel">
                              <i class="fab fa-instagram" style="font-size:24px;"></i>&nbsp;
                           </h4> 
                        </div>
                        <div class="modal-body">
                           <div class="container-fluid">
                              <div  style="display:inline-block;width:500px; height: 500px; margin-left: 10px;">
                              <div class="d-flex justify-content-between align-items-center">
                                         <div class="mr-2">
                                             <img class="rounded-circle" width="60" style="border-radius: 40px;margin-right: 20px;" height="50" src="<c:url value="/resources/uploadFiles/${t.userChangeName}"/>" alt="">
                                            <!-- 태그 -->
                                            <c:forEach var ="tg" items="${t.tagList }">
                                            	<c:if test="${fn:length(tg.tagName) == 5}">
                                               		<button type="button" style="background: skyblue; border:none; font-family: 'Stylish', sans-serif; color: white; border-radius: 10px; font-size: 12px;">${tg.tagName }</button>
                                               </c:if>
                                            	<c:if test="${fn:length(tg.tagName) == 6}">
                                               		<button type="button" style="background: purple; border:none; font-family: 'Stylish', sans-serif; color: white; border-radius: 10px; font-size: 12px;">${tg.tagName }</button>
                                               </c:if>
                                            	<c:if test="${fn:length(tg.tagName) >= 7}">
                                               		<button type="button" style="background: orange; border:none; font-family: 'Stylish', sans-serif; color: white; border-radius: 10px; font-size: 12px;">${tg.tagName }</button>
                                               </c:if>
                                               <c:if test="${fn:length(tg.tagName) ==4}">
                                               		<button type="button" style="background: pink; border:none;font-family: 'Stylish', sans-serif; color: white; border-radius: 10px; font-size: 12px;">${tg.tagName }</button>
                                               </c:if>
                                               <c:if test="${fn:length(tg.tagName) <=3}">
                                               		<button type="button" style="background: #FFCD5E; border:none; font-family: 'Stylish', sans-serif; color: white; border-radius: 10px; font-size: 12px;">${tg.tagName }</button>
                                               </c:if>
                                               </c:forEach>   
                                             <div class="h5 m-0 text-blue" style="font-family: 'Stylish', sans-serif;">@${t.memberName }</div>
                                         </div>
                                       </div>  
                                       <br>
                               <div class="text-muted h7 mb-2" style="margin-bottom: 20px; width: 50%; font-family: 'Stylish', sans-serif;"> 
                                       <c:if test="${t.sec < 60}">
                                          <i class="far fa-clock"></i>&nbsp;${t.sec }초 전
                                       </c:if>   
                                       <c:if test="${t.sec >= 60}">
                                          <c:if test="${t.min < 60}">
                                             <i class="far fa-clock"></i>&nbsp;${t.min }분 전
                                          </c:if>
                                          <c:if test="${t.min >= 60 and t.hour <= 24}">
                                             <i class="far fa-clock"></i>&nbsp;${t.hour }시간 전
                                          </c:if>
                                          <c:if test="${t.min >= 60 and t.hour > 24}">
                                             <i class="far fa-clock"></i>&nbsp;${t.day }일 전
                                          </c:if>
                                       </c:if>
                                       </div>
                                       <div class="img-wrapper">
                               <img width="300" height="200" onclick="doImgPop('<c:url value="/resources/uploadFiles/${t.changeName}"/>')"  style="border-radius: 15px; margin: 0 auto;" src="<c:url value="/resources/uploadFiles/${t.changeName}"/>" class="user-profile">
                               </div>
                                  <br><br>
                                 <h5 class="card-title" style="color:#1E2B44; font-weight: 600; font-family: 'Stylish', sans-serif;">${t.content}</h5>
                                 <br><br>
                                 <button type="button" style="background: skyblue; border:none; color: white; font-family: 'Stylish', sans-serif; border-radius: 10px; font-size: 12px;">등록일</button>
                                 <c:set var="check" value="안됨"/>
                                  <c:forEach var="ck" items="${t.timeLine}">
                                  		<c:if test="${ck.memberNo eq loginUser.memberNo}">
                                  			<c:set var="check" value="하트"/>
                                  		</c:if>
                                  </c:forEach>
                                  <c:if test="${t.timeLine ne null}">
	                                  	<c:if test="${check eq '하트'}">
	                                    	<label id="count" style="float: right;  margin-right:30px; font-family: 'Stylish', sans-serif; line-height:16px;">${fn:length(t.timeLine)} </label><i class="fas fa-heart plus" id="hart" style="float: right; color:red; margin-right: 3px;"></i>&nbsp;
	                                    </c:if>
	                                    <c:if test="${check eq '안됨'}">
	                                    	<label id="count" style="float: right;  margin-right:30px; font-family: 'Stylish', sans-serif; line-height:16px;">${fn:length(t.timeLine)}</label><i class="far fa-heart" id="hart" style="float: right; color:red; margin-right: 3px;"></i>&nbsp;
	                                    </c:if>
									</c:if>   
									<%--  <c:if test="${empty t.timeLine}">
										<label style="float: right;  margin-right:20px; line-height:16px;">0</label><i class="far fa-heart" id="hart" style="float: right; color:red; margin-right: 3px;"></i>&nbsp;
										</c:if> --%>
                                  <h6 class="card-title" style="color:#777777; font-weight: 400; font-family: 'Stylish', sans-serif; margin-top: 3px;"><i class="far fa-calendar-plus"></i>&nbsp;&nbsp;${t.enrollDate}</h6>
                              </div>
                              <div  style="float:right; height:500px; width:400px; margin-left:20px; border: 2px solid #1E2B44; border-radius: 10px; ">
                              	<div id="commentArea" style="height: 92%; width:100%; overflow: auto;">
                              		<table id="tableComment" style="width: 100%;"></table>
                              	</div>
                              	<div style="width: 100%; height: 8%; border-top: 3px solid #1E2B44;">
                              		<input type="text" id="comment" placeholder=" 댓글입력..." style="border:none; width: 90%; font-family: 'Stylish', sans-serif; outline:none; height:100%; border-radius:10px; background: white;">
                              		<i class="far fa-paper-plane" id="insertComment" style="color:#1E2B44; font-size: 18px;"></i>
                              	</div>
                              </div>
                           </div>
                        </div>
                        <div class="modal-footer">
                        </div>
                     </div>
                     <!-- /.modal-content -->
                  </div>
                  <!-- /.modal-dialog -->
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
      $(document).on('click', '#insertComment', function(){
		 var value = $(this).prev().val(); 
		 $(this).parent().prev().children().append("<tr><td style='width:50px;'><div class='box' style='display:inline-block;'><img class='profile' src='/manage/resources/uploadFiles/${loginUser.changeName}'></div></td><td style='width:60px;'><div class='nameDiv' style='vertical-align:text-top;'>@김성준</div></td><td><br><lable class='commentLabel' style='line-height:10px; color:#1E2B44;'>"+ value +"</label></td></tr>")
		 $(this).prev().val(""); 
      });
      
      
      $(document).on('click', '#hart', function(){
    	    var a = $(this).prev().text();
    	    $(this).prev().text(Number(a)+1);
			var id = $(this).parent().parent().parent().parent().parent().parent().attr('id');
			 $(this).removeClass("far fa-heart");
				$(this).addClass("fas fa-heart");
				$(this).attr('id','chanHart');
			
				$.ajax({
					url:'insertHart.ti',
					type: 'post',
					data:{
						timeLineNo:id
					},
				 success:function(data){
				 }
			 });
      });
      
      $(document).on('click', '#chanHart', function(){
    	    var id = $(this).parent().parent().parent().parent().parent().parent().attr('id');
    	    var a = $(this).prev().text();
    	    console.log(a);
    	    $(this).prev().text(Number(a)-1);
    	    
			$(this).removeClass("fas fa-heart");
			$(this).attr('id','hart');
			$(this).addClass("far fa-heart");
			$.ajax({
				url:'deleteHart.ti',
				type: 'post',
				data:{
					timeLineNo:id
				},
			 success:function(data){
			 }
		 });
    });
      
      
      var count = 0;
      
         $(document).on('click', '#submitBtn', function(){
            console.log("ssss");
             $("#insertForm").submit();
         });
 
         $(".tag").keydown(function(event){
            var val = $(".tag").val();
            var pattern1 = /[#]/g;
            var check = true;
            
            if(event.keyCode == '13'){
               if(pattern1.test(val)){
                  $(".shap").hide();
               }else{
                  $(".shap").show(); 
                  check=false;
               }
               
            if(count ==0 && check== true){
                  $("#plusTest").append("<div id='tag1' style='display:inline-block'><input type='hidden' name='tagName' value='"+val+"'><label class='tagLabel'style='background:green; border-radius:10px; color:white; font-size:12px; margin-left:10px; line-height:25px; padding-left:6px; padding-right:8px; height:25px;'>"+val+"</label></div>");
                   count++;
                  $(".tag").val("#");
               }else if(count ==1 && check== true){
                  $("#plusTest").append("<div id='tag1' style='display:inline-block'><input type='hidden' name='tagName' value='"+val+"'><label class='tagLabel' style='background:skyblue; border-radius:10px; color:white; font-size:12px; margin-left:10px; line-height:25px; padding-left:6px; padding-right:8px; height:25px;'>"+val+"</label></div>");
                  count++;
                  $(".tag").val("#");
               }else if(count ==2 && check== true){
                  $("#plusTest").append("<div id='tag1' style='display:inline-block'><input type='hidden' name='tagName' value='"+val+"'><label class='tagLabel' style='background:purple; border-radius:10px; color:white; font-size:12px; margin-left:10px; line-height:25px; padding-left:6px; padding-right:8px; height:25px;'>"+val+"</label></div>");
                  count++;
                  $(".tag").val("#");
               }else if(count ==3 && check== true){
                  $("#plusTest").append("<div id='tag1' style='display:inline-block'><input type='hidden' name='tagName' value='"+val+"'><label class='tagLabel' style='background:orange; border-radius:10px; color:white; font-size:12px; margin-left:10px; line-height:25px; padding-left:6px; padding-right:8px; height:25px;'>"+val+"</label></div>");
                  count =0;
                  $(".tag").val("#");
               }
            }
         });
         
         $(document).on('click', '#tag1', function(){
            $(this).remove();
         });
         
         $(function(){
           $(".tag").val("#");
           $(".shap").hide(); 
         });
      </script>
               
      <script>
       $(document).ready(function() {
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
            }, 500);

         }).scroll();

      }); 
       
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
    /*    $(".card-link").click(function(){
          $('#myModal').modal('show');
      }); */
      
      /* $(".active").click(function(){
         console.log("삭제");
         $(this).parent().parent().append("<div class='commentArea' style='width:300px; height:50px;'> sss</div>")
      }); */
   </script>
   <script>
   function doImgPop(img){
	   img1= new Image();
	   img1.src=(img);
	   imgControll(img);
	  }
	   
	  function imgControll(img){
	   if((img1.width!=0)&&(img1.height!=0)){
	      viewImage(img);
	    }
	    else{
	       controller="imgControll('"+img+"')";
	       intervalID=setTimeout(controller,20);
	    }
	  }

	  function viewImage(img){
	   W=img1.width;
	   H=img1.height;
	   O="width="+600+",height="+600+",scrollbars=yes";
	   imgWin=window.open("","",O);
	   imgWin.document.write("<html><head><title>이미지 확대</title></head>");
	   imgWin.document.write("<body topmargin=0 leftmargin=0>");
	   imgWin.document.write("<img src="+img+" style='width:600; height:600;'onclick='self.close()' style='cursor:pointer;' title ='클릭하시면 창이 닫힙니다.'>");
	   imgWin.document.close();
	  }
	   </script>


</body>
</html>