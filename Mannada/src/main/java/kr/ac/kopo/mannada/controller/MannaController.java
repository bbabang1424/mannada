package kr.ac.kopo.mannada.controller;

import java.util.HashMap;
import java.util.List;

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
import kr.ac.kopo.mannada.pager.Pager;
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
	public String list(Model model, Pager pager	) {
		pager.setPerPage(12);
		
		List<Manna> list = service.list(pager);
		model.addAttribute("list", list);
		
		return path+"list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		
		service.addViewCnt(id);
		
		Manna item = service.item(id);
		model.addAttribute("item", item);
		
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
		userService.addPartner(map);
		
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
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		service.delete(id);
		
		return "redirect:../list";
	}
	
	/*테스트*/
	@GetMapping("/dummy")
	public String dummy() {
		service.dummy();
		
		return "redirect:list";
	}
	
	@PostMapping("/addPartner/{id}")
	public String addPartner(@PathVariable int id, @SessionAttribute User user) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", id);
		map.put("num", user.getNum());
		userService.addPartner(map);
		
		return "redirect:list";
	}

}
