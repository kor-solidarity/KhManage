<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>
	#projectTable{
		width:100%;
		text-align:left;
	}
	.projectBtn{
		width:130px;
		height:27px;
		border:none;
		background:#1E2B44;
		color:white;
		font-weight:600;
		border-radius: 5px;
		margin-right:6px;
		font-size:14px;
	}
	.tdText{
		text-align:center;
		height:30px;
		font-size:14px;
	}
	.thRange{
		background:#F3F3F3;
		color:#626262;
		font-size:15px;
		border:#B0B0B0 1px solid;
		height:35px;
		padding:3px;		
	}
	.th1{
		width:220px;
		text-indent: 5px;
	}
	.td1{
		text-indent: 5px;
		color:#71A8D7;
		height: 40px;
	}
	.trRange{
		border:1px solid #B0B0B0;
		width:30px;
	}
	.inputCss{
		border-radius: 5px;
		border:1px solid lightgray;
	}
	.buseoSelect{
		width:180px;
		border:1px solid #626262;
		height:25px;
		border-radius: 5px;
	}
	
	.pwdResetBtn {
		width: 130px;
		height: 25px;
		background: white;
		border-radius: 5px;
		border: 1px solid #B0B0B0;
		color: gray;
	}
	
	.pagingArea{
      background:#F3F3F3;
      height:50px;
      border:1px solid #B0B0B0;
   }
   .paging{
      margin-left:200px;
      width:50%;
   }
   
   .titleId{color:#5E738B; font-weight: bold;}
   
</style>
</head>
<body onload="$('#route1').text('관리자'); $('#route2').text('사용자관리');">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
				<table align="left" style="margin-bottom:10px;">	
					<tr>
						<td><button class="projectBtn" onclick="location.href='registerMember.me'"><i class="fas fa-edit"></i> &nbsp;사용자 등록</button>
						<td><button class="projectBtn"><i class="fas fa-download"></i> &nbsp;액셀 다운로드</button>
					</tr>
				</table>
					
				<table id="projectTable" align="center">
					<tr>
						<td class="thRange th1">이름</td>
						<td class="tdText thRange">부서</td>
						<td class="tdText thRange">직급</td>
						<td class="tdText thRange">진행중인프로젝트</td>
						<td class="tdText thRange">이메일</td>
						<td class="tdText thRange">사용여부</td>
						<td class="tdText thRange">최근접속일</td>
						<td class="tdText thRange"></td>
					</tr>
					<tr>
						<td class="thRange th1"><input type="text" class="inputCss" style="width:200px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:60px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:220px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="width:100px;"></td>
						<td class="tdText thRange"><input type="text" class="inputCss" style="visibility:hidden; width:160px;"></td>
					</tr>
					
					<c:forEach var="m" items="${mlist}">
					<tr class="trRange">
						<%-- <td class="td1"><a href="selecMemberModal.me?memberNo=${m.memberNo}" id="memberName">${m.memberName}</a></td> --%>
						<td class="td1"><a href="#" id="memberName">${m.memberName}</a></td>
						<td class="tdText">${m.deptName}</td>
						<td class="tdText">${m.rankName}</td>
						<td class="tdText">88 건수 추가</td>
						<td class="tdText" style="text-align:left; padding-left: 25px;">${m.email}</td>
						<td class="tdText">${m.status}</td>
						<td class="tdText">2020-04-03 추가할 것</td>
						<td class="tdText">
							<button class="pwdResetBtn">패스워드 초기화</button>
						</td>
					</tr>
					</c:forEach>
					
					<tr class="pagingArea">
                        <td colspan="8">
                           <div class="paging"><< < 1 2 > >></div>
                        </td>
                    </tr>
					
				</table>
				</div>
			</div>
		</div>
		
		<!-- 모달_사용자정보수정 begin -->
		<div class="modal fade" id="myModal"role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		<form action="modalUpdateMember.me" method="post">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;사용자 정보 수정</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">이름<span style="color:red;"> *</span></td>
							<td><input type="text" class="inputMenu form-control" style="width: 280px;" name="memberName" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">이메일<span style="color:red;"> *</span></td>
							<td><input type="email" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">부서<span style="color:red;"> *</span></td>
							<td>
								<select class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="" >선택하세요</option>
									<option value="">1</option>
									<option value="">2</option>
									<option value="">3</option>
									<option value="">4</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">직급<span style="color:red;"> *</span></td>
							<td><input type="text" class="inputMenu form-control" style="width: 280px;" required></td>
						</tr>
						<tr>
							<td class="titleId">사용여부</td>
							<td style="margin-left: -120px;"><input type="checkbox" class="" style="width: 280px; margin-left: -130px; align:left" required="required"></td>
						</tr>
					 </table>
		            </div>
		            <div class="row">
		              <div class="col-sm-9">
		                <div class="row"></div>
		              </div>
		            </div>
		          </div>
		        </div>
		        <div class="modal-footer">
		          <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
		          <button type="button" class="btn btn-primary" style="background:#1E2B44; outline:none; border:none;">저장</button>
		        </div>
		      </div><!-- /.modal-content -->
		    </div><!-- /.modal-dialog -->
		    </form>
	  	</div><!-- /.modal -->
	
	
	
	
	
	
	
	<script>
	
	//모달
	$("#memberName").click(function(){
		$('#myModal').modal('show');
		
		
		//모달창 회원정보 조회
		$.ajax({
			url: 'selecMemberModal.me?memberNo=${m.memberNo}',
			type: "post",
			data: {memberNo:name}
		});
		
		
	});
	
	
	
	
	
	
	
	
	
	
	
	
	
	</script>
	
	
	
</body>
</html>












