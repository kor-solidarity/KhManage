<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="/WEB-INF/views/user/common/header.jsp"/>
	<jsp:include page="/WEB-INF/views/user/common/sidebar.jsp"/>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
	<script src="${path }/resources/js/websocketopen.js"></script>
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
	h5{
		color: white;
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
	#newWork{
		min-width: 240px; 
		margin: 5px; 
		padding: 5px; 
		font-size: 16px; 
		width: 120px; 
		background: #fefefe; 
		border-radius: 4px; 
	}
</style>
</head>
<body id="bodyAll" onload="$('#route1').text('내 작업'), $('#route2').text('작업 관리')">

	<div class="panel panel-headline">
		<div class="panel-heading">
			<div style="width:100%; height:700px; margin:0 auto; overflow:auto;">
			<div class="oversort ui-sortable">
				<!-- <div class="sortable ui-sortable">
					<h5 class="nodrag header">내 할일</h5>
					<div>개발작업</div>
					<button id="newWork">+ 새 작업 추가</button>
				</div>
				
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">개발중</h5>
					<button id="newWork">+ 새 작업 추가</button>
				</div>
				
				<div class="sortable ui-sortable">
					<h5 class="nodrag header">개발완료</h5>
					<button id="newWork">+ 새 작업 추가</button>
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
				</div> -->
			
    			<div class="oversort">
					<input type="text" class="newlistinput" name="newlistname" placeholder="Add New List..." />
				</div>
				</div>
			</div>
		</div>
	</div>

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
