package kr.ac.kopo.mannada.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.service.MannaService;
import kr.ac.kopo.mannada.service.UserService;

@Controller
@RequestMapping("/manna")
public class MannaController {
	final String path = "manna/";
	
	@Autowired
	MannaService service;

	@Autowired
	UserService userService;


	@GetMapping("/list")
	public String list() {
		return path+"list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model, @SessionAttribute(required = false) User user) {
		
		service.addViewCnt(id);
		
		if(user == null) {
			int num = 0;
		} else {
			int num = user.getNum();
		}
		
		Map<String, Object> js = new HashMap<String, Object>();
		js.put("id", id);
		if(user != null) {
			js.put("num", user.getNum());
		}
		int status = service.joinStatus(js);
		model.addAttribute("status", status);
		 
		
		Manna item = service.item(id);
		model.addAttribute("item", item);
		
		List<User> memberList = service.memberList(id); 
		model.addAttribute("list", memberList);
		
		return path + "detail";
	}
	
	@GetMapping("/add")
	public String add() {
		return path+"add";
	}
	
	@PostMapping("/add")
	public String add(@SessionAttribute User user, Manna item) {
		
		System.out.println(user.getNum());
		
		item.setNum(user.getNum());
		service.add(item);
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", item.getId());
		map.put("num", user.getNum());
		service.addJoin(map);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		Manna item=service.item(id);
		model.addAttribute("item", item);
		
		return path+"update";
	}
	
	@PostMapping("/update/{id}")
	public String update(@PathVariable int id, Manna item) {
		item.setId(id);
		service.update(item);
		
		return "redirect:../detail/" + id;
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id, @SessionAttribute User user) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", id);
		map.put("num", user.getNum());
		service.deleteJoin(map);
		
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@GetMapping("/addJoin/{id}")
	public String addjoin(@PathVariable int id, @SessionAttribute User user) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", id);
		map.put("num", user.getNum());
		service.addJoin(map);
		
		return "redirect:../detail/" + id;
	}
	

	@GetMapping("/deleteJoin/{id}")
	public String deleteJoin(@PathVariable int id, @SessionAttribute User user) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", id);
		map.put("num", user.getNum());
		service.deleteJoin(map);
		
		return "redirect:../detail/" + id;
	}

}