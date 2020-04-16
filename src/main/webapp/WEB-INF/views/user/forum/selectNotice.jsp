<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
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
	background: #F3F3F3;
	height: 50px;
	border: 1px solid #B0B0B0;
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

	#noticeTable{
		width:95%;
		text-align:left;
		margin-top: 10px;
	}
	
	/* .p{
		margin-top: 10px;
		font-weight: bold;
		font-size: 18px;
		color: #5e738b;
	} */
	#noticeTitle{
		width: 1500px;
		height: 40px;
	}
	.div{
		margin-bottom: 20px;
		margin-top: 20px;
	}
	
	.delBtn{
		width: 70px;
		height: 30px;
		border: none;
		background: #F3565D;
		color: white;
		font-weight: 400;
		border-radius: 5px;
		font-size: 14px;
	
	}
	
	.okBtn {
		width: 70px;
		height: 30px;
		border: none;
		background: #1E2B44;
		color: white;
		font-weight: 400;
		border-radius: 5px;
		font-size: 14px;
	}
	#noticeTable{
		width:95%;
		text-align:left;
		margin-top: 30px;
	}
	.tr{
		width: 95%;
	}
	.tr2{
		width: 95%;
	}
	.pp{
		
	}
	.p{
		font-size: 18px;
		color: #5e738b;
		margin-bottom: 40px;
		font-weight: bold;
	}
	#content{
		width: 80%;
		height: 350px;
		border: 1px solid black;
	}
	.container{
		float: left;
		margin-left: 26px;
	}
	.redelete{
		background: #C6C6C6;
		float: right;
		color: white;
		margin-right: 10px;
		
	}
	.update{
		background: #1E2B44;
		color: white;
		float: right;
	}
	#down{
		margin-right: 400px;
	}
	
</style>
</head>
<body onload="$('#route1').text('공지사항'),$('#route2').text('상세보기')">
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div
				style="width: 100%; height: 900px; margin: 0 auto; overflow: auto;">
				
				<p class="p">상세보기</p>
				
				<hr>
				
				<table id="noticeTable" align="center">
					<tr class="tr">
						<td colspan="2"><p class="pp">공지사항 제목</p></td>
						<td>
							<c:if test="${loginUser.memberNo == notice.memberNo }">
								<button class="okBtn" id="nUpdate">
									<i class="fas fa-check"></i>&nbsp;수정
								</button>
								&nbsp;
								<button class="delBtn" id="nDelete">
									<i class="fas fa-ban"></i>&nbsp;삭제
								</button>
							</c:if>
						</td>
					</tr>
					<tr  class="tr2">
						<td><p class="p"><c:out value="${notice.noticeTitle}" /> </p></td>
					</tr>
					<tr  class="tr">
						<td><p class="pp">공지사항 내용</p></td>
					</tr>
					<tr  class="tr2">
						<td colspan="3">
							<div id="content"> <%-- <c:out value="${notice.noticeContent}"/> --%></div>
						</td>
					</tr>
					<tr>
						<td></td>
					</tr>
					<tr class="tr">
						<td style="width: 15%"><p class="p" style="margin-top: 40px;">첨부파일 다운로드</p></td>
						<td>
							<div id="down">${at.originName}</div>
							<input type="hidden" value="${at.atNo}">
						</td>
					</tr>
					
				</table>	
				
		<div class="container">
		    <form id="commentForm" name="commentForm" method="post">
		    <br><br>
		        <div>
		            <div>
		                <span><strong>댓글</strong></span> <span id="cCnt"></span>
		            </div>
		            <div>
		                <table class="table" >                    
		                    <tr>
		                        <td>
		                            <textarea style="width: 1200px" rows="3" cols="30" id="comment" name="comment" placeholder="댓글을 입력하세요"></textarea>
		                            <br>
		                            <div>
		                               <button class="btn btn-default" type="button" name="commentInsertBtn" id="btnReply">등록</button>
		                            </div>
		                        </td>
		                    </tr>
		                </table>
		            </div>
		        </div>
		    </form>
		</div>
		<div class="container">
		    <!-- <form id="commentListForm" name="commentListForm" method="post"> -->
		        <div id="commentList">
		        	
		        </div>
		    <!-- </form> -->
		</div>				

		</div>
		</div>
	</div>
</body>
<script>
	
	$(function(){
		
	getCommentList();
	var dd = '${notice.noticeContent}';
	
	$("#content").html(dd);
	
	var downNo = '${at.atNo}';
	var nNo = '${notice.noticeNo}';
	
	$("#down").click(function(){
		
		location.href = "download.fo?no="+downNo;
	});
	
	$("#btnReply").click(function(){
        
		var nNo = "${notice.noticeNo}";
	    var content = $("#comment").val();   
	    var memberNo =  "${loginUser.memberNo}";
	    console.log(content);
	    console.log(memberNo);
	    console.log(nNo);
	    
	    $.ajax({
	        type: "post", 
	        url: "replyInsert.fo", 
	        data:  {
	        			content : content,
	        			memberNo: memberNo,
	        			nNo : nNo
					},
	        
	        success: function(data){
	            alert("댓글이 등록되었습니다.");
	            console.log(data);
	            
	            getCommentList();
	                }
	            });
	        });	
   function reDelete(){
		   
		   var rno= $(this).childeren("input").val();
		    console.log(rno);
		    console.log("Dsadsad");
		    
		   $.ajax({
		        type: "post", 
		        url: "replyDelete.fo", 
		        data:  {
		        			nNo : nNo
						},
		        
		        success: function(data){
		            alert("댓글이 등록되었습니다.");
		            console.log(data);
		            
		            getCommentList();
		                }
		       });
	   }
	   
	
	
	function getCommentList(){
	    
		var nNo = "${notice.noticeNo}";
		var memberNo =  "${loginUser.memberNo}";
	    $.ajax({
	        type:'GET',
	        url : "replySelectAll.fo",
	        dataType : "json",
	        //data:$("#commentForm").serialize(),
	        data:{
	        	nNo : nNo
	        },
	        //contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
	        success : function(data){
	            
	        	console.log(data);
	        	
	            var html = "";
	            var cCnt = data.length;
	            
	            if(data.length > 0){
	                
	                for(i=0; i<data.length; i++){
	                	console.log(data[i].replyNo);
	                    html += "<div>";
	                    html += "<div><table class='table'><h6><strong>"+data[i].memberNo+"</strong></h6></div><div class='updiv'>";
	                    	if(data[i].memberNo == memberNo){
	                    		 html += data[i].replyContent + "<button class='update' id="+data[i].replyNo+">수정 <input type='hidden' value=" +data[i].replyNo + "></button> <button id="+data[i].replyNo+" class='redelete'>삭제 <input type='hidden' value= "+data[i].replyNo + "></button> <tr><td></td></tr>";
	                    	}else{	
	                    		 html += data[i].replyContent + "<tr><td></td></tr>"
	                    	}
	                    	
	                    html += "</table></div>";
	                    html += "</div>";
	                    
							                	
	                }
	                
	            } else {
	                
	                html += "<div>";
	                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
	                html += "</table></div>";
	                html += "</div>";
	                
	            }
	            
	            $("#cCnt").html(cCnt);
	            $("#commentList").html(html);
	            
	        },
	        error:function(request,status,error){
	            
	       }
	    });
	    
	    
	}	
	
	
	$("#nDelete").click(function(){
		
		location.href = "deleteNotice.fo?nNo="+nNo;
	});
	 
	$("#nUpdate").click(function(){
		
		location.href = "updateNoticeSelect.fo?nNo="+nNo;
	}); 
	 
	 
	 
	
	});
	
	
	$(document).on('click', '.redelete', function(){
		console.log($(this).children().val());
		
		var nNo = $(this).children().val();
		
		 $.ajax({
 	        type: "post", 
 	        url: "replyDelete.fo", 
 	        data:  {
 	        			nNo : nNo
 					},
 	        
 	        success: function(data){
 	            alert("댓글이 삭제되었습니다.");
 	            console.log(data);
 	            
 	            getCommentList();
 	           }
 	   });
	}); 
			 
		 $(document).on('click', '.update', function(){
				console.log($(this).children().val());
				
				var nNo = $(this).children().val();
				
				$(this).parent().html("<div style='width:100%'><textarea style='width: 1200px' rows='3' cols='30' id='comment' name='comment' placeholder='댓글을 입력하세요'></textarea></div><button class='rupdate'>수정</button>&nbsp;&nbsp;<button>취소</button>");
				
				
			/*  $(".rupdate").click(function(){
				
				 console.log("sdadsad")
				 
				 $.ajax({
			 	        type: "post", 
			 	        url: "replyUpdate.fo", 
			 	        data:  {
			 	        			nNo : nNo,
			 	        			comment : comment
			 					},
			 	        
			 	        success: function(data){
			 	            alert("댓글이 수정되었습니다.");
			 	            console.log(data);
			 	            
			 	            getCommentList();
			 	           }
			 	   });
				
			 }); */
			 
				
				
		 });
		 
	
	
		 function getCommentList(){
			    
				var nNo = "${notice.noticeNo}";
				var memberNo =  "${loginUser.memberNo}";
			    $.ajax({
			        type:'GET',
			        url : "replySelectAll.fo",
			        dataType : "json",
			        //data:$("#commentForm").serialize(),
			        data:{
			        	nNo : nNo
			        },
			        //contentType: "application/x-www-form-urlencoded; charset=UTF-8", 
			        success : function(data){
			            
			        	console.log(data);
			        	
			            var html = "";
			            var cCnt = data.length;
			            
			            if(data.length > 0){
			                
			                for(i=0; i<data.length; i++){
			                	console.log(data[i].replyNo);
			                    html += "<div>";
			                    html += "<div><table class='table'><h6><strong>"+data[i].memberNo+"</strong></h6>";
			                    	if(data[i].memberNo == memberNo){
			                    		 html += data[i].replyContent + "<button class='update' id=u"+data[i].replyNo+">수정 <input type='hidden' value=" +data[i].replyNo + "></button> <button id="+data[i].replyNo+" class='redelete'>삭제 <input type='hidden' value= "+data[i].replyNo + "></button> <tr><td></td></tr>";
			                    	}else{	
			                    		 html += data[i].replyContent + "<tr><td></td></tr>"
			                    	}
			                    	
			                    html += "</table></div>";
			                    html += "</div>";
			                    
									                	
			                }
			                
			            } else {
			                
			                html += "<div>";
			                html += "<div><table class='table'><h6><strong>등록된 댓글이 없습니다.</strong></h6>";
			                html += "</table></div>";
			                html += "</div>";
			                
			            }
			            
			            $("#cCnt").html(cCnt);
			            $("#commentList").html(html);
			            
			        },
			        error:function(request,status,error){
			            
			       }
			    });
			    
			    
			}	
			
	
	
	
	
	
</script>



</html>


