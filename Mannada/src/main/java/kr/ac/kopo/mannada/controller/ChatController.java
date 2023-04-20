package kr.ac.kopo.mannada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.service.ChatService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	final String path = "chat/";
	
	@Autowired
	ChatService service;
	
	
	@GetMapping("/list")
	public String list(@SessionAttribute User user, Model model) {
		
		int num = user.getNum();
		
		List<Manna> list = service.mannaList(num);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/detail/{mannaId}")
	public String detail(@PathVariable int mannaId, Model model) {
		
		List<Chat> list = service.chatList(mannaId);
		model.addAttribute("list", list);
		
		return path + "detail";
	}
}
