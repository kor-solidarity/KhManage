package com.kh.manage.chat.controller;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;
import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.RemoteEndpoint.Basic;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
@ServerEndpoint(value="/chatRoom.ct")
public class WebSocketChat {
    
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
        // TODO Auto-generated constructor stub
        System.out.println("웹소켓(서버) 객체생성");
    }
    @RequestMapping(value="/chat.do")
    public ModelAndView getChatViewPage(ModelAndView mav) {
        mav.setViewName("chatRoom");
       
        return mav;
    }
    @OnOpen
    public void onOpen(Session session) {
        logger.info("Open session id:"+session.getId());
        try {
            final Basic basic=session.getBasicRemote();
        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        sessionList.add(session);
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self,String message) {
        try {
                                                                       
			/*
			 * for(Session session : WebSocketChat.sessionList) {
			 * if(!self.getId().equals(session.getId())) { } }
			 */
        }catch (Exception e) {
       
        }
    }
    @OnMessage
    public void onMessage(String message, Session session) {
    	System.out.println("2번");
    	System.out.println(message);
        try {
        	for(int i = 0; i < sessionList.size(); i++) {
        		if(session.getId() == sessionList.get(i).getId()) {
        			
        		}else {
        			final Basic basic=sessionList.get(i).getBasicRemote();
                	
                	basic.sendText(message);
        		}
        	}

        }catch (Exception e) {
            // TODO: handle exception
            System.out.println(e.getMessage());
        }
        //sendAllSessionToMessage(session, message);
    }
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    @OnClose
    public void onClose(Session session) {
        logger.info("Session "+session.getId()+" has ended");
        sessionList.remove(session);
    }
}
 


