package kr.ac.kopo.mannada.websocket;

import java.util.Vector;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatServer extends TextWebSocketHandler {
	Vector<WebSocketSession> list;
	
	public ChatServer() {
		super();
		
		if(list == null)
			list = new Vector<WebSocketSession>();
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		list.add(session);
		
		System.out.println("연결: " + session.getRemoteAddress());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		
		String user = (String) session.getAttributes().get("user");
		
		System.out.println("메세지: " + message.getPayload() + ", " + session.getRemoteAddress());
		
		for(WebSocketSession client : list)
			client.sendMessage( new TextMessage(user + ": " + message.getPayload()) );
		
	}

	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		list.remove(session);
		
		System.out.println("종료: " + session.getRemoteAddress());
		
	}
	
	
}
