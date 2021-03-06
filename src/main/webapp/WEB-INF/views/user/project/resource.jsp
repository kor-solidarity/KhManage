<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
   .selectBar{
      width:180px;
      broder:1px solid lightgray;
      border-radius: 5px;
   }
   
   .memberListTr {
      width: 100%;
   }
   
   .memberListTd {
      width: 100%;
   }
   
   tr:hover {
      background: #F3F3F3;
      color: black;
      cursor: pointer;
   }
   
   .btn:hover {
      font-weight: bold;
   }
   
   tr * {
      width: 100%;
   }

   td * {
      padding-left: 10px;
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
            
            
            <div class="row" style="width: 100%">
               <!-- 인원 조회 영역 -->
               <form id="formBeforeAdd" action="addResource.pr" method="get">
                           <div id="memberList" class="col-md-5" style="width:400px; height:500px; margin-left:50px; border:2px solid lightgray; padding-top: 10px; overflow:auto;">
                               <table id="memberListTable" class="memberListTable" style="width: 100%">
                                  <tr id="" class="memberListTr" style="width: 100%">
                                     <td class="memberListTd chooseMember" style="padding-left: 10px;">인원을 추가해주세요.</td>
                                  </tr>
                               </table>
                            <input type="hidden" id="" class="" name="projectPk" value="${pid}">
                           </div>
                       </form>
                       <!-- 인원 조회영역 종료 -->    
                           <div class="col-md-1" style="text-align:center;margin-top:150px;width:90px;">
                                   <button id="btnResourceAdd" type="button" class="btn point-color" style="margin-bottom:15px; background: #1E2B44;  color:white;">
                                       <i class="icon-arrow-right"></i>추가
                                   </button>
                                   <button id="btnResourceDelete" type="button" class="btn point-color" style="margin-bottom:15px; color:white; background: #F3565D;">
                                       <i class="icon-arrow-left"></i>삭제
                                   </button>
                                   <button id="btnResourceChange" type="button" class="btn point-color" style="background: #1E2B44; color:white; display: none;" >
                                       <i class="icon-refresh"></i>변경
                                   </button>
                                   
                                   <!-- <button id="saveResourceBtn" type="submit" class="btn point-color" style="margin-top:50px; background: #1E2B44; color:white;">
                                       <i class="icon-refresh"></i>저장
                                   </button> -->
                                   
                           </div>
                        <!-- 현재 프로젝트에 소속되어 있거나 추가되는 인원 영역 -->   
                           <div class="addedMemberDiv col-md-5" style="width:400px; height:500px; border:2px solid lightgray; padding-top: 10px; overflow:auto;">
                              <form id="formAdded" action="" method="post">
                                <table id="addedMemberTable" class="addedMemberTable" style="width: 100%">
                                <c:forEach var="tm" items="${tmList}">
                                   <tr id="addedMemberTr" class="addedMemberTr addedTr" style="width: 100%; margin-bottom: 15px;">
                                        <td id="addedMemberTd" class="addedMemberTd" style="width: 100%; padding-left: 10px;"><b>${tm.memberName}</b> / ${tm.deptName} / ${tm.rankName}
                                           <input type="hidden" id="memberNo" class="memberNo" name="memberNo" value="${tm.memberNo}">
                                        </td>
                                   </tr>
                                   
                                   <%-- <c:if test="${tmList != null}" var="">
                                      <tr id="addedMemberTr" class="addedMemberTr addedTr" style="width: 100%">
                                         <td style="width: 100%; padding-left: 10px;">인원을 추가해주세요.</td>
                                         <td style="width: 100%; padding-left: 10px;"><b>${tm.memberName}</b> / ${tm.deptName} / ${tm.rankName}</td>
                                      </tr>
                                   </c:if>
                                   <c:if test="${tmList == null}" var="">
                                      <tr id="addedMemberTr" class="addedMemberTr addedTr" style="width: 100%">
                                         <td style="width: 100%; padding-left: 10px;">인원을 추가해주세요.</td>
                                   </c:if> --%>
                                      </tr>
                                   
                                </c:forEach>
                                </table>
                                   <input type="hidden" id="projectPk" class="" name="projectPk" value="${projectPk}">
                               </form>
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
               
               $("#memberListTable").empty();
               
               
               if(deptName != null) {
                  
                  for(key in data) {
                     
                     $("#memberListTable").append("<tr class='memberListTr' style='width:100%;'><td class='memberListTd' style='width:100%;'><b>" 
			                           + 			data[key]['memberName'] + "</b>" 
			                           + 			"&nbsp;/&nbsp;" + data[key]['deptName'] + "&nbsp;/&nbsp;" + data[key]['rankName'] 
			                           + 			"<input type='hidden' id='memberNo' class='memberNo clicked' name='memberNo' value='" + data[key]['memberNo'] + "'>"
			                           + 			"</td></tr>");
                     
                     /* $("#memberList").append("<tr class='memberListTr' style='width:100%;'><td class='memberListTd' style='width:100%;'><b>" 
                           + data[key]['memberName'] + "</b>" 
                           + "&nbsp;/&nbsp;" + data[key]['deptName'] + "&nbsp;/&nbsp;" + data[key]['rankName'] 
                           
                           + "<input type='hidden' id='memberNo' class='memberNo' name='memberNo' value='" + data[key]['memberNo'] + "'>"
                           + "<input type='hidden' id='deptNo' name='deptNo' value='" + data[key]['deptNo'] + "'>"
                           + "<input type='hidden' id='rankNo' name='rankNo' value='" + data[key]['rankNo'] + "'>"
                           
                           + "</td></tr>"); */
                     
                  }
                  
               } else {
                  
                  $("#memberList").append("<tr class='memberListTr' style='width:100%;'><td class='memberListTd'><b>" 
                        
                           + "해당 부서에 조회된 사원이 없습니다. ssssssssss" + "</b></td></tr>");
               }
               
              

               /* $("#deptOption").on('change', function() {
            	   
	               if($("#deptOption").val() == '0') {
	            	   
	            	   $("#memberListTable").append("<tr class='memberListTr' style='width:100%;'><td class='memberListTd' style='width:100%;'>
	                           			+			"ssssssssssssssssssssssssssssssssssssssssss"
	            	   					+ 			"</td></tr>");
	            	   
	               }
               }); */
               
               
                  
            }
            
         });
         
      });
      
   });

   
   //조회한 사원 선택
   $(function () {
      
      $(document).on('click', 'td', function() {
         
         if($(this).hasClass("clicked")) {
            $(this).removeClass("clicked");
            $(this).css({"background": "white", "color":"#676a6d"});
         } else {
            $(this).addClass("clicked");
            $(this).css({"background": "#F0F0F0", "color":"black"});
         }
         
         var memberNo = $(this).find("input[name='memberNo']").val();
         var projectPk = "${pid}"; 
         /* console.log("memberNo : " + memberNo);
         console.log("projectPk : " + projectPk); */
         
      });
      
   });
    
   
      
   //resource 추가하기
   var list;
   
   $("#btnResourceAdd").on('click', function() {
      
      //var memberNo = $("#memberNo").val();
      
      list = "";
      
      var z = 1;
      
      //console.log(memberNo);
      
      $("#memberListTable tr").filter(function(){
    	  
         var a = $(this).find(".memberListTd.clicked").find(".memberNo").val();
         
         if(a != undefined){
        	 
            if(z == 1){
            	
               list = a;
               z++;
               
            }else{
            	
               list += "," +  a;
               
               }
            }
      });
         
      
      var str = list.split(",");

	      
      var check = true;
      
      for(var i = 0; i < str.length; i++ ){
    	  console.log("i : " + i);
          $("#addedMemberTable tr").filter(function(){
             if(str[i] == $(this).find(".memberNo").val()){
                
                i = str.length;
                
                swal({
                    title: "중복되는 회원입니다.",  
                    text: "",
                    icon: "warning"
              	});
                
                //서블릿 동작 안 되게 !!
                check = false;
                
             } else {
             	 
             }
             
          });
       

      }
		if(check) {
			//리소스 멤버 추가 버튼 실행
			//$("#formBeforeAdd").submit();
			for(var i = 0; i < str.length; i++ ){
				console.log("ajax : " +  str[i])
			  $.ajax({
	    		  url: 'addResource.pr',
	    		  type: 'post',
	    		  data: {
	    			  memberNo : str[i],
			  		   projectPk:"${pid}"},
	    		  success: function(data){
	    			
	    		  }
	    		   
	    	   });
			}
			
			swal({
                title: "팀원에 추가되었습니다.",
                icon: "success"
             }).then((value) => {
				location.reload();
             });
			
			
		}
      
   });
      
   
   
   
   var deleteList;
   //리소스 삭제
   $("#btnResourceDelete").on('click', function() {
	   
	   var question = confirm("삭제하시겠습니까?");
	      
       //var memberNo = $("#memberNo").val();
       
       var i = 0;
       $("#addedMemberTable tr").filter(function(){
           var clicked = $(this).find("#addedMemberTd.clicked").find(".memberNo").val();

           if(clicked != undefined){
	           console.log("선택 member clicked : " + clicked);
	           if(i == 0){
	        	   deleteList = clicked;
	        	   i++;
	           }else{
	        	   deleteList += "," + clicked;
	           }
           }
       });
       
       var str1 = deleteList.split(",");
       var result = true;
       var projectPk = "${pid}";
       var memberNo;
       
       for(var i = 0; i < str1.length; i++){
    	   
			$.ajax({
				url:'checkWorkMember.pr',
				type:'post',
				async: false,
				data:{
					
					memberNo : str1[i],
					projectPk : projectPk
			
				},
				success:function(data){
				console.log("결과 값 : "+ data);
					if(data == 0){
						
						//for문 종료시키기
						i = str1.length;
						
						result = false;
						
						
						//작업이 있는 member 이름 띄우기
						for(var i = 0; i < str1.length; i++) {
							
							$.ajax({
								url:'memberCheck.pr',
								type:'post',
								data:{
									
									memberNo : str1[i],
				    			    projectPk : projectPk
				    	   
				    	   		},
								success:function(data){
									
									i = str1.length;
									result = false;
									
									swal({
						                 title: "프로젝트내 " + data + "님에게" + "\n" + "배정된 작업이 있어 삭제할 수 없습니다.",  
						                 text: "",
						                 icon: "warning"
						           });
									
									//alert("삭제할 수 없습니다." + "\n" + "프로젝트내 " + data + "님에게 배정된 작업이 있습니다.");
									
									
								} 
				    	   		
							});
						}
						
						//alert("삭제할 수 업습니다." + "\n" + data['memberName'] + "님에게 배정된 작업이 있습니다.");
						
					}
				}
			});
       }

       
       //result == 0 일때 삭제
       if(result == true){
			console.log("결과 result : " + result);
       	 //삭제 서블릿
       	   if(question) {
       		   
	       	   for(var i = 0; i < str1.length; i++) {
	
	       		   $.ajax({
		    		  url: 'deleteProjectMember.pr',
		    		  type: 'post',
		    		  data: {
		    			  memberNo : str1[i],
		    			  projectPk : projectPk
		    		  },
		    		  success: function(data){
		    			  
		    			  i = str1.length;
		    			  
		    			  swal({
		                         title: "삭제되었습니다.",
		                         icon: "success"
		                      }).then((value) => {

		                    	  location.reload();
		                    	  
		                      });
		    		  }
		    		   
		    	   }); 
	       		   
	       	   }
       		   
       	   }
       	   
       } 
       
   });
   
   
   
   </script>
   
   
   
   
</body>
</html>












