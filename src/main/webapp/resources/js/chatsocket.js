  var ws;
        var messages=document.getElementById("messages");

$(function(){
        	 if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                 writeResponse("WebSocket is already opened.");
                 return;
             }
             //웹소켓 객체 만드는 코드
             ws=new WebSocket("ws://localhost:8001/manage/chatRoom.ct?");
             
             ws.onopen=function(event){
            	 alert("연결")
                 if(event.data===undefined) return;
                 
                 writeResponse(event.data);
             };
             ws.onmessage=function(event){
                 writeResponse(event.data);
             };
             ws.onclose=function(event){
                 writeResponse("Connection closed");
             }
        }); 