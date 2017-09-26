package com.gyejoong.mdmuserweb.websocket;

import java.util.HashSet;
import java.util.Set;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.gyejoong.mdmuserweb.HomeController;

public class locationWebSocketHandler extends TextWebSocketHandler {

	private static final Logger logger = LoggerFactory.getLogger(locationWebSocketHandler.class);
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	
	public locationWebSocketHandler(){
		super();
		logger.info("create SocketHandler instance!");
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		sessionSet.remove(session);
		logger.info("connection closed");
	}
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		super.afterConnectionEstablished(session);
		
		sessionSet.add(session);
		logger.info("connection success");
	}
	
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);
		
		logger.info("receive message : " + message.toString());
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		logger.error("web socket error ! ", exception);
	}
	
	@Override
	public boolean supportsPartialMessages() {
		
		return super.supportsPartialMessages();
	}
	
	public void sendLocationinfo(String locationinfo, String username){
		for(WebSocketSession session : sessionSet){
			if(session.isOpen()){
				if(session.getAttributes().get("username").equals(username)){ // MDM 서버로부터 받은 사번인지 확인 & 현재 로그인 된 세션 & 웹소켓 세션
					try{
						session.sendMessage(new TextMessage(locationinfo));
					}catch(Exception exception){
						logger.error("fail to send Message!", exception);
					}
				}
			}
		}
	}

}
