<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	.oversort {
		 overflow-x: auto;
		 white-space: nowrap; 
		 min-height: calc(100% - 120px); 
	 }
	.sortable { 
		display: inline-block; 
		vertical-align: top; 
		margin: 0; 
		margin-left: 5px; 
		margin-right: 5px; 
		background: #1E2B44; 
		width: 250px; 
		min-height: 25px; 
		border-radius: 4px; 
	}
	.sortable .header { 
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
	}
	.sortable  div { 
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	
	.newlistitem { 
		min-width: 240px;
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		border: 1px solid #8e8e8e; 
		background: #fafafa; 
		border-radius: 4px; 
	}
	.newlistinput { 
		margin-left: 10px; 
		min-width: 230px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		border: 1px solid #8e8e8e; 
		background: #fafafa; 
		border-radius: 4px; 
	}
  
  .sortable-placeholder {
  	display: inline-block;
  	vertical-align: top;
  	margin: 0;
  	width: 250px;
  	min-height: 25px;
  	border-radius: 4px;
	border: 1px dotted black;
  }

  .sortable-placeholder {
	border: 1px dotted black;
	margin: 0 1em 1em 0;
	height: 50px;
	border-radius: 4px;
	
	}
	#newWork1{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	#newWork2{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	#newWork3{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
	
	.header{
		color: white;
	}
</style>
</head>
<body id="bodyAll" onload="$('#route1').text('내 작업'), $('#route2').text('작업 관리')">
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<script src="${path }/resources/js/websocketopen.js"></script>
	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<div class="oversort ui-sortable">
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">내 할일</h5>
					<div>개발작업</div>
					<button id="newWork1">+ 내 작업 추가</button>
				</div>
				
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">개발중</h5>
					<button id="newWork2">+ 새 작업 추가</button>
				</div>
				
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">개발완료</h5>
					<button id="newWork3">+ 새 작업 추가</button>
				</div>
				
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">개발자 테스트 완료</h5>
					<input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item...">
				</div>
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">PL검토중</h5>
					<input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item...">
				</div>
				<div class="sortable ui-sortable">
					<h5 class="nodrag header ">PL검토완료</h5>
					<input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item...">
				</div>
			
    			<!-- <div class="oversort">
					<input type="text" class="newlistinput" name="newlistname" placeholder="Add New List..." />
				</div> -->
				</div>
			</div>
		</div>
	</div>


	<!-- 모달_사용자정보수정 begin -->
		<div class="modal fade" id="myModal" role="dialog" aria-labelledby="gridSystemModalLabel" aria-hidden="true">
		    <div class="modal-dialog">
		      <div class="modal-content">
		        <div class="modal-header">
		          <!-- <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button> -->
		          <h4 class="modal-title" id="gridSystemModalLabel"><i class="fas fa-th-large"></i>&nbsp;신규 작업 등록 정보</h4>
		        </div>
		        <div class="modal-body">
		          <div class="container-fluid">
		            <div class="row" style="margin: 10px;  padding:10px; ">
		            <form action="">
		              <table id="buseoInfoTable" style="border-spacing:0 10px; border-collapse: separate;">
						<tr>
							<td class="titleId" style="width: 130px;">작업명</td>
							<td><input type="text" name="workName" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">프로젝트 번호</td>
							<td><p>P001</p></td>
						</tr>
						<tr>
							<td class="titleId">작업유형</td>
							<td>
								<select name="workType" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="개인">개인</option>
									<option value="일반">일반</option>
									<option value="프로젝트">프로젝트</option>
								</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">시작일</td>
							<td><input name="beginDate" type="date" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">완료일</td>
							<td><input name="completeDate" type="date" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId" style="width: 130px;">선행작업번호</td>
							<td><input name="precedeNo" type="text" class="inputMenu form-control" style="width: 280px;" required="required"></td>
						</tr>
						<tr>
							<td class="titleId">완료율</td>
							<td><input name="completeRate" type="number" class="inputMenu form-control" style="width: 280px;" min="0" max="100"></td>
						</tr>
						<tr>
							<td class="titleId">승인자</td>
							<td>
							<select name="grantorNo" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="개인">개인</option>
									<option value="일반">일반</option>
									<option value="프로젝트">프로젝트</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">작업단계</td>
							<td>
							<select name="workLevel" class="inputMenu form-control" style="width: 280px;" required="required">
									<option value="#" >선택하세요</option>
									<option value="개인">개인</option>
									<option value="일반">일반</option>
									<option value="프로젝트">프로젝트</option>
							</select>
							</td>
						</tr>
						<tr>
							<td class="titleId">상위작업 번호</td>
							<td><p>P001</p></td>
						</tr>
						<tr>
							<td class="titleId">사용여부</td>
							<td style="margin-left: -120px;"><input type="checkbox" class="" style="width: 280px; margin-left: -130px; align:left" required="required"></td>
						</tr>
					 </table>
					</form>
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
	  	</div><!-- /.modal -->
	<script>
	//모달
		$("#newWork1").click(function(){
			$('#myModal').modal('show');
		});  
		
	
	</script>

	<script>

	
	  
	function send(text){
    	ws.send(text);
    }
    
    function closeSocket(){
        ws.close();
    }
    
    function writeResponse(text){
    	$("#bodyAll").val(text);
    	//$(".newlistinput").before(text);
    }
	
	function updateListSortables(){
		$( ".sortable" ).sortable({
			connectWith: ".sortable",
			items: ":not(.nodrag)",
			placeholder: "sortable-placeholder ui-corner-all",
			change: function() {
					var list = $(this).closest('.sortable');
					var anchorBottom = $(list).find('.anchorBottom');
					$(list).append($(anchorBottom).detach());
				}
		});
		
		
		$('input[name="newlistitem"]').unbind().keyup(function(event){
			if(event.key == "Enter" || event.keyCode == "13"){
				$(this).before('<div>' + $(this).val() + '</div>');
				//var test = "$(this).before('<div>' + $(this).val() + '</div>')";
				var text = $("#bodyAll").val();
				send(test);
				$(this).val('');
			}
			
			});
		}
	
	
	$(function(){
		updateListSortables();
		
		$(".oversort").sortable({
			items: ":not(.nodrag)", 
			placeholder: "sortable-placeholder" 
		});
	

        
	$('input[name="newlistname"]').keyup(function(event){
		if(event.key == "Enter" || event.keyCode == "13"){
			$(this).before('<div class="sortable"><h5 class="nodrag header">' + 	$(this).val() + '</h5><input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item..." /></div>');
			//var text = '<div class="sortable"><h5 class="nodrag header">' + 	$(this).val() + '</h5><input type="text" class="nodrag anchorBottom newlistitem" name="newlistitem" placeholder="New List Item..." /></div>';
			var text = $("#bodyAll").val();
			updateListSortables();
			send(text);
			$(this).val('');
			var oversort = $(this).closest('.oversort');
			$( oversort ).scrollLeft( $(oversort).prop("scrollWidth") - $(oversort).width() );
			}
		
		});
	});
	
	
	
	</script>
</body>

</html>
