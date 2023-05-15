package kr.ac.kopo.mannada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Chat;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.service.ChatService;
import kr.ac.kopo.mannada.service.MannaService;

@Controller
@RequestMapping("/chat")
public class ChatController {
	final String path = "chat/";
	
	@Autowired
	ChatService service;
	
	@Autowired
	MannaService mannaService;
	
	
	@GetMapping("/list")
	public String list(@SessionAttribute User user, Model model) {
		
		int num = user.getNum();
		
		List<Manna> list = service.mannaList(num);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, @SessionAttribute User user, Model model) {

		int num = user.getNum();
		
		List<Manna> roomList = service.mannaList(num);
		model.addAttribute("roomList", roomList);
		
		Manna item = mannaService.item(id);
		model.addAttribute("item", item);
		
		List<Chat> chatList = service.chatList(id);
		model.addAttribute("chatList", chatList);
		
		return path + "detail";
	}
	
	@ResponseBody
	@PostMapping("/add")
	public String add(Chat item) {
		
		service.add(item);
		
		return "redirect:detail/"+ item.getMannaId(); 
	}
}
