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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.manage.chat.model.service.ChatService;
import com.kh.manage.chat.model.vo.Message;


@Controller
@ServerEndpoint(value="/chatRoom.ct")
public class WebSocketChat {
    @Autowired
    private ChatService cs;
	
    private static final List<Session> sessionList=new ArrayList<Session>();;
    private static final Logger logger = LoggerFactory.getLogger(WebSocketChat.class);
    public WebSocketChat() {
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
        }
        sessionList.add(session);
    }
    /*
     * 모든 사용자에게 메시지를 전달한다.
     * @param self
     * @param message
     */
    private void sendAllSessionToMessage(Session self,Message me) {
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
        }
		/* sendAllSessionToMessage(session, me); */
    }
    @OnError
    public void onError(Throwable e,Session session) {
        
    }
    @OnClose
    public void onClose(Session session) {
        sessionList.remove(session);
    }
}
 


