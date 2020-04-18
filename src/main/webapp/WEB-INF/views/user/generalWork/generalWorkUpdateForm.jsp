<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.titleTd{
		width:20%;
		color:#5E738B;
		font-weight:600;
	}
	.tdValue{
		color:#666666;
	}
	.cancleBtn {
	width: 70px;
	height: 30px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
}

.deleteBtn {
	width: 60px;
	height: 25px;
	border: none;
	background: #F3565D;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 12px;
}

.okBtn {
	width: 100px;
	height: 30px;
	border: none;
	background: #1E2B44;
	color: white;
	font-weight: 400;
	border-radius: 5px;
	font-size: 14px;
	margin-left: 100px;
}
.inputMenu {
	border: 1px solid lightgray;
	width: 300px;
	outline:none;
	border-radius: 5px;
}
</style>
</head>
<body onload="$('#route1').text('일반 작업'); $('#route2').text('작업 수정');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: auto; margin: 0 auto; overflow: auto;">
				<div class="menuArea" style="margin-left: 12px;">
					<table class="menuTable" style="width: 100%;">
						<tr>
							<td class="titleText" colspan="2">일반작업 등록 수정</td>
						</tr>
						<tr style="height: 5px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr height="20px;"></tr>
						</table>
					<form id="updateGeneralWork" action="updateGeneralWork.gw" method="post" enctype="multipart/form-data" encoding="multipart/form-data" novalidate="true" >		
					<table class="menuTable" style="width:100%">
						<tr>
							<td class="titleTd" align="center">작업종류</td>
							<td class="tdValue">
								<select id="gwType" class="inputMenu" name="gwType" style="width:200px;">
									<option value="일반작업">일반 작업</option>
									<option value="출장">출장</option>
								</select>
								<input type="hidden" name="gwNo" value="${work.gwNo}">
							</td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd"  align="center">시작일</td>
							<td class="tdValue"><input type="date" name="beginDate" class="inputMenu" style="width:200px;" value="${work.beginDate}"></td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">종료일</td>
							<td class="tdValue"><input type="date" class="inputMenu" name="endDate" style="width:200px;" value="${work.endDate}"></td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">작업제목</td>
							<td class="tdValue"><input type="text" name="gwName" class="inputMenu" value="${work.gwName}"></td>
						</tr>
						<tr height="20px;"></tr>
						<tr>
							<td class="titleTd" align="center">작업설명</td>
							<td class="tdValue">
								<textarea id="gwMemo" name="gwMemo" required="required" class="inputMenu" rows="" cols="10" style="width:70%; height:150px;" value="${work.gwMemo }"></textarea>
							</td>
						</tr>
						<tr height="30px;"></tr>
						<tr>
							<td class="titleTd" align="center" style="line-height: 10px;">첨부파일</td>
							<td class="tdValue">
								<table style="width:70%;">
									<tr style="border:1px solid lightgray;">
									<th class="titleTd" style="font-size:14px; height:30px; background: #EEEEEE;">&nbsp;&nbsp;등록된 첨부 파일</th>
									</tr>
									<tr style="border:1px solid lightgray; height:auto;">
									 <td>
									 	<div id="fileArea" class="inputMenu" style="width:100%; height:auto;  border:1px solid lightgray;">
											 <a href="#this" id="add" class="btn" style="padding-bottom: 0px;">파일 추가하기</a> 
									 		<c:if test="${list != null }">
								  				<c:forEach var="a" items="${list }">
													<div style='filePlus'><div style="margin-top: 0px; margin-left: 10px; margin-bottom: 0px;"><i class="fas fa-file-upload"></i>&nbsp;&nbsp;<c:out value="${a.originName}"/><input id="hiddenAtNo" name="atNo" class="hiddenAtNo" type="hidden" value="${a.atNo}"><a href='#this' name='delete' class='btn'><i class='fas fa-minus-square'></i></a></div></div>
								  				</c:forEach>
										 </c:if>
									 	</div>	
									 </td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="height:30px;"></tr>
						<tr>
							<td colspan="2"><div
									style="width: 100%; height: 2px; background: #EEEEEE; margin: 0 auto; margin-bottom: 10px;"></div></td>
						</tr>
						<tr>
							<td colspan="2">
								<button type="button"class="okBtn" id="save"  onclick="sweetTest();">
									<i class="fas fa-pencil-alt"></i>&nbsp;수정하기
								</button> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a>
									<button type="button" class="cancleBtn" onclick="history.go(-1)">
										<i class="fas fa-ban"></i>&nbsp;취소
									</button>
							</a>
							</td>
						</tr>
					</table>
					</form>
					<script>
						$(function(){
							$(".MU03").css("color", "white");
						});
					
						$(function(){
							$(document).on('click', '.td1', function(){
								var downNo =  $(this).find(".hiddenAtNo").val();
								location.href = "download.fo?no="+downNo;
							});
						});
					</script>
					<script>
						$("#deleteBtn").on("click", function(){
							var a = "${work.gwNo}";
							swal({
								  title: "해당 업무를 삭제 하시겠습니까?",
								  icon: "warning",
								  buttons: ["취소", "삭제"],
								  dangerMode: true,
								})
								.then((willDelete) => {
								  if (willDelete) {
								    swal({
								    	title: "삭제 완료!",
								      	icon: "success"
								    }).then((value) => {	// 애니메이션 V 나오는 부분!
									 location.href='deleteGeneralWork.gw?gwNo='+ a;
								    });
								  } else {
									  swal({
									  	title: "취소 하셨습니다.",
									    icon: "error"
									  });
								  }
							});
						});
					</script>
						<script type="text/javascript">
        var g_count =1;
        $(document).ready(function(){
            $("#list").on("click",function(e){
                e.preventDefault();
                fn_openBoardList();
            })
              $("#gwMemo").val("${work.gwMemo}");
            $("#write").on("click",function(e){
                e.preventDefault();
                fn_writeBoard();
            })
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));
            })
            $("#add").on("click",function(e){
                e.preventDefault();
                fn_fileAdd();
            })
        });
         
         
        function fn_openBoardList(){
            var comSubmit = new ComSubmit();
            comSubmit.setUrl("<c:url value='/sample/openBoardList.do'/>");
            comSubmit.submit();
        }
         
        function fn_writeBoard(){
            var comSubmit = new ComSubmit("frm");
            comSubmit.setUrl("<c:url value='/sample/writeBoard.do'/>");
            comSubmit.submit();
        }
        function fn_fileDelete(obj){
            obj.parent().parent().remove();
        }
        function fn_fileAdd(){
            var str = "<div style='filePlus'><div style='display: inline-flex;'><input type='file' class='fileCss' name='file' style='padding-left:10px;'></div><div style='display: inline-flex;'><a href='#this' name='delete' class='btn'><i class='fas fa-minus-square'></i></a></div></div>";
            $("#fileArea").append(str);
             
            $("a[name='delete']").on("click",function(e){
                e.preventDefault();
                fn_fileDelete($(this));         
            })
        }
    </script>
    <script>
    	$("#gwType option").filter(function(){
    		console.log($(this).val());
    		var type = '${work.gwType}';
    		if($(this).val() == type){
    			console.log("sssss");
    			$(this).prop('selected', 'selected').change();
    		}
    	});
    </script>
    <script>
	function sweetTest(){
		swal({
			  title: "일반 업무를 수정하시겠습니까?",
			  icon: "warning",
			  buttons: ["취소", "수정"],
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
			    swal({
			    	title: "수정 완료!",
			      	icon: "success"
			    }).then((value) => {	// 애니메이션 V 나오는 부분!
			    	$("#updateGeneralWork").submit();
			    });
			  } else {
				  swal({
				  	title: "취소 하셨습니다.",
				    icon: "error"
				  });
			  }
		});
	}
    </script>
			</div>			
		</div>
	</div>
</div>				
</body>
</html>