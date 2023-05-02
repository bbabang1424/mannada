package kr.ac.kopo.mannada.websocket;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.WebSocketHandler;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;

@Configuration    //설정 파일 등록
@EnableWebSocket  //이 프로젝트에서 webSocket 를 사용하겠다는 의미입니다 
public class WebSocketConfiguration implements WebSocketConfigurer{
	
    //핸들러 파일 bean  등록
	@Autowired
	private  WebSocketHandler webSocketHandler;
	
    //websocket bean 을 등록하고 요청을 어디로 보내야 할지 그 외 설정 등록
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		
		registry.addHandler(webSocketHandler, "/chat/detail").setAllowedOrigins("*");
	}
}
