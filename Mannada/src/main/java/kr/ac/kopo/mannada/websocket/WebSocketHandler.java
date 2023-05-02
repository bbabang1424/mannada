package kr.ac.kopo.mannada.websocket;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

@Component
public class WebSocketHandler extends TextWebSocketHandler{

    private static List<WebSocketSession> list = new ArrayList<>();


    @Override // 웹소켓이 연결되었을때
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        list.add(session); // 어디에서 웹소켓이 연결이 되면 임이의 session 을 넣어줄것이다
    }

    @Override // 웹소캣이 끊어졌을때
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
        list.remove(session); // 특정 세션을 가진 사람이 웹소캣을 종료하면 세션에서 제거
    }

    @Override // 웹소켓 메세지 핸들링 (보낸다고 할때)
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        String payload = message.getPayload();


        for(WebSocketSession sess: list) {
            sess.sendMessage(message);
        }
    }

}