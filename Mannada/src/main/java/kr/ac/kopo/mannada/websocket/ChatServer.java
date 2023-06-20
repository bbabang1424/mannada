package kr.ac.kopo.mannada.websocket;

import java.util.Vector;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

public class ChatServer extends TextWebSocketHandler {
	private class Channel {
		private String title;
		private Vector<WebSocketSession> list;
		
		public Channel(String title) {
			this.title = title;
			this.list = new Vector<WebSocketSession>();
		}

		public String getTitle() {
			return title;
		}
		
		public void setTitle(String title) {
			this.title = title;
		}
		
		public Vector<WebSocketSession> getList() {
			return list;
		}
		
		public void setList(Vector<WebSocketSession> list) {
			this.list = list;
		}
	}
	
	Vector<Channel> list;
	
	public ChatServer() {
		super();
		
		if(list == null) {
			list = new Vector<Channel>();
			
			list.add(new Channel("lobby"));
		}
	}
	
	
	synchronized private void joinChannel(String title, WebSocketSession wss) {
		for(Channel item : list) {
			if(title.equals(item.getTitle())) {
				item.getList().add(wss);				
			}
		}
	}
	
	synchronized private void makeChannel(String title, WebSocketSession wss) {		
		list.add(new Channel(title));
		
		joinChannel(title, wss);
	}

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);
		
		joinChannel("lobby", session);
		
		System.out.println("연결: " + session.getRemoteAddress());
	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		super.handleTextMessage(session, message);
		
		String user = (String) session.getAttributes().get("user");
		
		System.out.println("메세지: " + message.getPayload() + ", " + session.getRemoteAddress());
		
		String[] msg = message.getPayload().split("//");
		// msg[0] // 명령어 - make, move, chat
		// msg[1] // 방제목
		// msg[2] // 내용
		
		if("make".equals(msg[0])) {
			makeChannel(msg[1], session);
		} else if("move".equals(msg[0])) {
			joinChannel(msg[1], session);
		} else {
			Channel channel = getChannel(msg[1]);
			
			if(channel == null)
				return;
			
			for(WebSocketSession client : channel.getList())
				client.sendMessage( new TextMessage(msg[2]) );
		}
	}

	synchronized private Channel getChannel(String title) {
		for(Channel item : list) {
			if(title.equals(item.getTitle())) {				
				return item;
			}
		}
		
		return null;
	}


	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		
		for(Channel item : list) {
			item.getList().remove(session);
		}
		
		System.out.println("종료: " + session.getRemoteAddress());
		
	}
	
	
}
