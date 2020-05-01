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

.midTable{width:100%;}
.tdMid {width: 49%; height: 380px; padding: 20px; border: 1px solid lightgray; vertical-align:top; background: white;}
.thmidTable{border: 1px solid lightgray; height: 38px; text-align: center; font-size:15px; center; border:none}
.tdmidTable{height: 38px; text-align: center; font-size: 14px;}
.panel-heading

    .progress-sm.progress {
        height: 7px;
        background-color: #f5f5f5;
        box-shadow: inset 0px 1px 2px rgba(0,0,0,0.1);
    }

    .k-grouping-row td {
        text-align: left !important;
        padding: 8px;
    }
    .progressTag{
    	width:70px;
    }
    
    .kt-badge.kt-badge--unified-brand {
    color: #5d78ff;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-nonestart {
    color: #bbbbbb;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-success {
    color: #0abb87;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-danger {
    color: #fd397a;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-complete {
    color: #428bca;
    background: rgba(234, 234, 234, 0.3);
}

.kt-badge.kt-badge--unified-warning {
    color: #ffb822;
    background: rgba(234, 234, 234, 0.3);
}
    

</style>

</head>
<body onload="$('#route1').text('대시보드'); $('#route2').text('종합대시보드')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp"/>
	
	<div id="wrap">
	
		<div class="">
			<div class="panel-heading" style="margin-top: -20px;">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid" style="height: 350px;"><b>주요 프로젝트 현황</b>&nbsp;&nbsp;&nbsp;<i id="stop" class="far fa-stop-circle" style="color:gray; cursor: pointer;"></i>
							<label style="color:gray; font-weight:400; float:right;">more ＞</label>
							<hr style="margin-top: 5px; margin-bottom: 0px;">
							<table class="midTable2" style="width:100%;">
								<tr class="th1" style="font-weight: bold; height: 38px; background: #FAFAFA; border: 1px solid #EAEAEA;">
									<th class="thmidTable">프로젝트명</th>
									<th class="thmidTable">유형</th>
									<th class="thmidTable">등급</th>
									<th class="thmidTable">PM</th>
									<th class="thmidTable">부서</th>
									<th class="thmidTable">상태</th>
									<th class="thmidTable">시작일</th>
									<th class="thmidTable">완료일</th>
									<th class="thmidTable">계획/실적</th>
									<th class="thmidTable">이슈</th>
									<th class="thmidTable">산출물</th>
								</tr>
							<c:forEach var='d' items="${list}">
								<tr>
									<td class="tdmidTable td" style="text-align: left; padding-left: 10px;"><a href="#">${d.projectName}</a></td>
									<td class="tdmidTable td">${d.projectTypeName }</td>
									<td class="tdmidTable td">${d.projectRank }</td>
									<td class="tdmidTable td">${d.managerName }</td>
									<td class="tdmidTable td">${d.deptName }</td>
									<td class="tdmidTable td">
										<div>
											${d.status}
										</div>
									</td>
									<td class="tdmidTable td">${d.startDate}</td>
									<td class="tdmidTable td">${d.endDate}</td>
									<td class="tdmidTable td">
									<c:set var="sum" value="${(100/ d.allWork)*d.workClear}" />
									<c:if test="${(100/ d.allWork)*d.workClear != Double.NaN}">
										<label style="font-size: 7px; margin: 0px;">${sum+(1-(sum%1))%1}%</label>
									</c:if>
									<c:if test="${(100/ d.allWork)*d.workClear == Double.NaN}">
										<label style="font-size: 7px; margin: 0px;">0%</label>
									</c:if>
									
										<div class="bar-container">
										    <progress class="progressTag" value="${sum+(1-(sum%1))%1}" max="100" style="width:70px;"/>
										  </div>
									</td>
									<td class="tdmidTable td"><a href="#">${d.issue}</a></td>
									<td class="tdmidTable td"><a href="#">${d.workProduct}</a></td>
									
								</tr>
						</c:forEach>
							</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>

		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>프로젝트 진행현황</b>
							<hr>
								<div class="tableDiv">
									<div class="kt-portlet__body" style="overflow-y: auto; height:320px; max-height:320px;">

        <table id="deptProjectCount" class="table table-light table-light--info">
            <colgroup>
                <col class="col-md-2" style="width:34%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
                <col class="col-md-2" style="width:11%;">
            </colgroup>
            <thead>
                <tr>
                    <th style="text-align: center;">부서</th>
                    <th style="text-align: center;">전체</th>
                    <th style="text-align: center;">시작전</th>
                    <th style="text-align: center;">정상</th>
                    <th style="text-align: center;">지연</th>

                </tr>
            </thead>
            <tbody style="">
             <c:forEach var = "d" items="${dList}">
                        <tr style="background-color:#fff;">
                            <td style="padding: 10px 10px; text-align: center;">
                             ${d.deptName}
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-brand kt-badge--lg kt-badge--bold">
                                    ${d.before}
                                </span>
                                
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-nonestart kt-badge--lg kt-badge--bold">${d.proceeding }</span>
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-success kt-badge--lg kt-badge--bold">${d.delay }</span>
                            </td>
                            <td style="text-align: center; padding: 10px 10px; cursor:pointer;">
                                <span class="kt-badge kt-badge--unified-danger kt-badge--lg kt-badge--bold">${d.complete}</span>
                            </td>
                           
                        </tr>
               </c:forEach>         
            </tbody>
        </table>

    </div>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>프로젝트 현황</b>
							<hr>
								<div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
		
		<div class="">
			<div class="panel-heading">
				<br>
				<div class="middle">
					<table class="midTable">
						<tr>
							<td class="tdMid"><b>이슈 현황</b>
							<hr>
								<div class="tableDiv">
									<table border="1" class="projectInfoTable">
										<tr>
											<td class="pjtTd td">프로젝트 명</td>
											<td class="pjtTd2 td">프로젝트X</td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">프로젝트 번호</td>
											<td class="pjtTd2 td"></td>
											<td class="pjtTd3 td"></td>
											<td class="pjtTd4 td"></td>
										</tr>
										<tr>
											<td class="pjtTd td">개발 형태</td>
											<td class="pjtTd2 td">양산개발</td>
											<td class="pjtTd3 td">개발 등급</td>
											<td class="pjtTd4 td">SS</td>
										</tr>
										<tr>
											<td class="pjtTd td">PMO</td>
											<td class="pjtTd2 td">데모사용자</td>
											<td class="pjtTd3 td">제품유형</td>
											<td class="pjtTd4 td">-</td>
										</tr>
										<tr>
											<td colspan="4" class="pjtTd td">제품기능(설명)</td>
										</tr>
										<tr>
									 		<td colspan="4" class="pjtTd td">설명입니다.</td>
										</tr>
									</table>
								</div>
							</td>
							<td class="td2"></td>
							<td class="tdMid"><b>월별 프로젝트</b>
							<hr>
								<div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	
	<script>
	 var start = 6;
	 var end = 10;
	 
	 var timer = setInterval(function(){
		 var result = projectUpdate(start, end);
		 
		 if(result <5){
			start = 1;
			end = 5;
		 }else if(result ==6){
			 start += 5;
			 end += 5;
		 }
		 
		
		 
    }, 5000)
    $(document).on('click', '#stop', function(){
    	clearInterval(timer);
    	$("#stop").css("color", "red");
    })
    
    function projectUpdate(a, b){
		var i = 1;
		 $.ajax({ 
				url:'changeAllDahboard.me',
				type: 'post',
				async: false,
				data:{start:a,
					  end:b},
			 success:function(data){
				 var th = $(".midTable2").find(".th1").html();
				 $('.midTable2 tr').not(".th1").empty();

				 for(key in data) {
					 var allWork = data[key]['allWork'];
					 var issue = data[key]['issue'];
					 var workProduct =  data[key]['workProduct'];
					 var workClear =  data[key]['workClear'];
			           //4월 17, 2020
		               var test = data[key]['startDate'];
		               var beginDateTest = test.split(/월 |, /)
		               // 4
		               var month = beginDateTest[0];
		               // 17
		               var day = beginDateTest[1];
		               // 2020
		               var year = beginDateTest[2];
		               
		               var beginDate = 0;
		               var rDay = 0;
		               
		               if(month < 10){
		                  var rMonth = "0" + month;
		                  if(day < 10){
		                     rDay = "0" + day;
		                     beginDate = year +"-"+ rMonth + "-" + rDay;
		                  }else{
		                     beginDate = year +"-"+ rMonth + "-" + day;
		                  }
		               }else{
		                  if(day < 10){
		                     rDay = "0" + day;
		                     beginDate = year +"-"+ month + "-" + rDay;
		                  }else{
		                     beginDate = year +"-"+ month + "-" + day;
		                  }
		               }
		               
		               var ctest = data[key]['endDate'];
		               var completeDateTest = ctest.split(/월 |, /)
		               
		               // 4
		               var cMonth = completeDateTest[0];
		               // 17
		               var cDay = completeDateTest[1];
		               // 2020
		               var cYear = completeDateTest[2];
		               
		               var completeDate = 0;
		               var crDay = 0;
		               
		               if(cMonth < 10){
		                  var crMonth = "0" + cMonth;
		                  if(cDay < 10){
		                     crDay = "0" + cDay;
		                     completeDate = cYear +"-"+ crMonth + "-" + crDay;
		                  }else{
		                     completeDate = cYear +"-"+ crMonth + "-" + cDay;
		                  }
		               }else{
		                  if(cDay < 10){
		                     crDay = "0" + cDay;
		                     completeDate = cYear +"-"+ cMonth + "-" + crDay;
		                  }else{
		                     completeDate = cYear +"-"+ cMonth + "-" + cDay;
		                  }
		               }
		               i++;
		               var re = (100/allWork)* workClear;
					 if(isNaN(re)){
						 re = 0;
					 }else{
					 	 re= Math.round(re/100 * 100).toFixed(0);
					 }
					 
					 $(".midTable2").append("<tr>" +
								"<td class='tdmidTable td' style='text-align: left; padding-left: 10px;'><a href='#'>"+data[key]['projectName']+"</a></td>"
								+"<td class='tdmidTable td'>"+ data[key]['projectTypeName'] +"</td>"
								+"<td class='tdmidTable td'>"+ data[key]['projectRank'] + "</td>"
								+"<td class='tdmidTable td'>"+ data[key]['managerName'] + "</td>"
								+"<td class='tdmidTable td'>"+ data[key]['deptName'] + "</td>"
								+"<td class='tdmidTable td'>"
								+  "<div>"
								+	 data[key]['status'] 
								+	"</div>"
								+"</td>" 
								+"<td class='tdmidTable td'>"+  beginDate + " </td>"
								+"<td class='tdmidTable td1'>"+ completeDate + "</td>"
					   
					    	    + "<td class='tdmidTable td'>"
					    	    + "<label style='font-size: 7px; margin: 0px;'>"+ re +"%</label>"
					    	    + "<div class='bar-container'>"
								+ "<progress class='progressTag' value='"+ (100 / allWork)* workClear +"' max='100' style='width:70px;'/></div>"
								+ "</td>" 
								+ "<td class='tdmidTable td'><a href='#''>"+ issue + "</a></td>"
								+"<td class='tdmidTable td'><a href='#'>"+ workProduct + "</a></td></tr>").fadeIn();
  				 }
			 }
		});
		 
		 return i;
	 }
	</script>
</body>
</html>