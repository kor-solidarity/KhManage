<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
   
</style>
</head>
<body onload="$('#route1').text('사용자관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/admin/common/sidebar.jsp"/>
	
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
				<table align="left" style="margin-bottom:10px;">	
					<tr>
						<td><button class="projectBtn" onclick="location.href='registerUser.me'"><i class="fas fa-edit"></i> &nbsp;사용자 등록</button>
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
					<tr class="trRange">
						<td class="td1"><a href="#">데모사용자</a></td>
						<td class="tdText">연구소</td>
						<td class="tdText">과장</td>
						<td class="tdText">8건</td>
						<td class="tdText">uandme1206@naver.com</td>
						<td class="tdText">Y</td>
						<td class="tdText">2020-04-03</td>
						<td class="tdText">
							<button class="pwdResetBtn">패스워드 초기화</button>
						</td>
					</tr>
					<tr class="trRange">
						<td class="td1"><a href="#">데모사용자</a></td>
						<td class="tdText">연구소</td>
						<td class="tdText">과장</td>
						<td class="tdText">8건</td>
						<td class="tdText">uandme1206@naver.com</td>
						<td class="tdText">Y</td>
						<td class="tdText">2020-04-03</td>
						<td class="tdText">
							<button class="pwdResetBtn">패스워드 초기화</button>
						</td>
					</tr>
					<tr class="trRange">
						<td class="td1"><a href="#">데모사용자</a></td>
						<td class="tdText">연구소</td>
						<td class="tdText">과장</td>
						<td class="tdText">8건</td>
						<td class="tdText">uandme1206@naver.com</td>
						<td class="tdText">Y</td>
						<td class="tdText">2020-04-03</td>
						<td class="tdText">
							<button class="pwdResetBtn">패스워드 초기화</button>
						</td>
					</tr>
					<tr class="trRange">
						<td class="td1"><a href="#">데모사용자</a></td>
						<td class="tdText">연구소</td>
						<td class="tdText">과장</td>
						<td class="tdText">8건</td>
						<td class="tdText">uandme1206@naver.com</td>
						<td class="tdText">Y</td>
						<td class="tdText">2020-04-03</td>
						<td class="tdText">
							<button class="pwdResetBtn">패스워드 초기화</button>
						</td>
					</tr>
					
					<tr class="pagingArea">
                        <td colspan="8">
                           <div class="paging"><< < 1 2 > >></div>
                        </td>
                    </tr>
					
					
					
				</table>
				</div>
			</div>
		</div>
		
	
	
	
	
</body>
</html>












