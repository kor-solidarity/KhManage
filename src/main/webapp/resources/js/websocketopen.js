 	var ws;

	$(function(){
        	 if(ws!==undefined && ws.readyState!==WebSocket.CLOSED){
                 writeResponse("WebSocket is already opened.");
                 return;
             }
             //웹소켓 객체 만드는 코드
             ws=new WebSocket("ws://localhost:8001/ma/myWorkList.wk");
             
             ws.onopen=function(event){
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