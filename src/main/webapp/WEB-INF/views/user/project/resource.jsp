<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<title>Insert title here</title>
<style>
	.selectBar{
		width:180px;
		broder:1px solid lightgray;
		border-radius: 5px;
	}
	
	
	/* .memberListTr:hover {
		background: #F3F3F3;
		color: black;
		cursor: pointer;
	} */
	
	.memberListTr {
		width: 100%;
		border: 1px solid black;
	}
	
	.memberListTd {
		width: 100%;
		
	}
	
	/* .addedMemberTr:hover {
		background: #F3F3F3;
		color: black;
		cursor: pointer;
	} */
	
	
	
	tr:hover {
		background: #F3F3F3;
		color: black;
		cursor: pointer;
		
	}
	
	
</style>
</head>
<body onload="$('#route1').text('프로젝트 센터')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/sidebar2.jsp" />
	<jsp:include page="/WEB-INF/views/user/common/projectNav.jsp" />


	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width: 100%; height: 600px; margin: 0 auto; overflow: auto;">
			
			   <div style="margin-left:50px; margin-top: 10px; margin-bottom: 10px;">
				<label>부서선택</label>&nbsp;&nbsp;&nbsp;&nbsp;
			   		
			   		<select id="deptNo" class="selectBar" name="deptNo">
			   			<option id="deptOption" class="form-control" value="0">선택하세요</option>
			   			<c:forEach var="d" items="${deptList}">
			   			<option id="deptOption" class="form-control" value="${d.deptNo}">
			   				<c:out value="${d.deptName}"/>
			   				<%-- <input type="hidden" id="memberNo" name="memberNo" value="${d.memberNo}">
			   				<input type="hidden" id="detpNo" name="detpNo" value="${d.deptNo}">
			   				<input type="hidden" id="rankNo" name="rankNo" value="${d.deptNo}"> --%>
			   			</option>
			   			</c:forEach>
			   		</select>
			   		
			   </div>
			   
			   
				<div class="row">
						<!-- 인원 조회 영역 -->						
                            <div id="memberList" class="col-md-5" style="width:400px; height:500px; margin-left:50px; border:2px solid lightgray; padding-top: 10px;">
                                <table class="memberListTable" border="1" style="width: 100%">
                                	<tr id="" class="memberListTr">
                                		<td class="memberListTd chooseMember">인원을 추가해주세요.</td>
                                	</tr>
                                </table>
                            </div>
                        <!-- 인원 조회영역 종료 -->    
                            <div class="col-md-1" style="text-align:center;margin-top:150px;width:90px;">
                                    <button id="btnResourceAdd" type="button" class="btn point-color" style="margin-bottom:15px; background: #1E2B44;  color:white;">
                                        <i class="icon-arrow-right"></i>추가
                                    </button>
                                    <button id="btnResourceDelete" type="button" class="btn point-color" style="margin-bottom:15px; color:white; background: #1E2B44;">
                                        <i class="icon-arrow-left"></i>삭제
                                    </button>
                                    <button id="btnResourceChange" type="button" class="btn point-color" style="background: #1E2B44; color:white">
                                        <i class="icon-refresh"></i>변경
                                    </button>
                            </div>
                         <!-- 현재 프로젝트에 소속되어 있거나 추가되는 인원 영역 -->   
                            <div class="addedMemberDiv col-md-5" style="width:400px; height:500px; border:2px solid lightgray; padding-top: 10px;">
                                <table id="addedMemberTable" class="addedMemberTable">
                                	<tr id="addedMemberTr" class="addedMemberTr addedTr">
                                		<td>인원을 추가해주세요.</td>
                                	</tr>
                                </table>
                            </div>
                          <!-- 추가 인원 종료 -->  
                            <div class="col-md-1"></div>
                        </div>
			</div>
		</div>
	</div>
	
	<script>
	
	//부서선택 시 해당 member div1에 출력
	$(function() {
		$("#deptNo").on('change', function() {
			
			var deptName = $(this).val();
			
			console.log(deptName);
			
			$.ajax({
				url: "selectMember.pr",
				type: 'post',
				data: {
					deptNo : deptName
				},
				success: function(data) {
					
					/* console.log(data); */
					
					$("#memberList").empty();
					
						for(key in data) {
							
							$("#memberList").append("<tr class='memberListTr'><td class='memberListTd'><b>" 
									+ data[key]['memberName'] + "</b>" 
									+ "&nbsp;/&nbsp;" + data[key]['deptName'] + "&nbsp;/&nbsp;" + data[key]['rankName'] 
									
									+ "<input type='hidden' id='memberNo' class='memberNo' name='memberNo' value='" + data[key]['memberNo'] + "'>"
									+ "<input type='hidden' id='deptNo' name='deptNo' value='" + data[key]['deptNo'] + "'>"
									+ "<input type='hidden' id='rankNo' name='rankNo' value='" + data[key]['rankNo'] + "'>"
									
									+ "</td></tr>");
							
							
							/* console.log(memberNo);
							console.log(deptNo);
							console.log(rankNo);
							 */
						}
						
				}
				
			});
			
		});
		
	});

	
	
	
	$(function() {
		//선택된 member 추가하기(div3으로 이동)
		$(document).on('click', '.memberListTr', function(){
			var check=0;
			var memberListTr = $(this).html();
			var memberNo = $(this).find("#memberNo").val();
			
			/* console.log(memberList);
			console.log(memberNo);
			console.log($(".memberListTr").children().find(".memberNo").val()); */
			
			//리스트에 남아있어야 함 삭제X
			//$(this).remove();
			
			$("#addedMemberTr").empty();
			
			//우측테이블에 같은 memberNo가 있으면 추가 제한 
			$(".addedMemberTable").children().children().filter(function(){
				
				if(memberNo == $(this).find(".memberNo").val()){	
					alert("동일한 사원입니다!");
					check = 1;
				}
				
			});
			
			// 없으면 추가
			if(check == 0) {
				
				$("#addedMemberTable").append("<tr id='memberListTr'>" + memberListTr + "</tr>");
				
			}
			
		});
		
		//셀렉트 옵션 "인원을 선택하세요" 나타내기
		/* $(document).on('click', '.chooseMember'), function(){
			$(this).show();
		} */
		
	});
	
	
	
	
	//우측 추가된 목록에서 제외(삭제)
	$(document).on('click', '#addedMemberTable tr', function(){
		$(this).remove();
		$(this).css("color", "red");
	});

	
	//css처리
	//$("#addedMemberTable tr").css("color", "red");		
	
		
		
	
	</script>
	
	
	
	
</body>
</html>













