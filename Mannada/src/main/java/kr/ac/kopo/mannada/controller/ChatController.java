package kr.ac.kopo.mannada.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.service.ChatService;

@RestController
@RequestMapping("/chat")
public class ChatController {
	
	@Autowired
	ChatService service;
	
	
	@GetMapping
	public Map<String, Object> list(@SessionAttribute User user){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		int num = user.getNum();
		
		List<Manna> mannaList = service.mannaList(num);
		map.put("manna", mannaList);
		
		return map;
	}
	
	@GetMapping("/{mannaId}")
	public Map<String, Object> chat(@PathVariable int mannaId){
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		List<Chat> chatList= service.chatList(mannaId);
		map.put("chat", chatList);
		
		return map;
	}

	
	@PostMapping
	public Chat sendMessage(@RequestBody Chat item) {
		service.sendMessage(item);
		
		return item;
	}
}
