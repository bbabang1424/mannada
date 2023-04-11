package kr.ac.kopo.mannada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.CommunityService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	final String path = "community/";
	
	@Autowired
	CommunityService service;
	
	
	@GetMapping("/list")
	public String list(Model model, Pager pager) {
		
		List<Community> list = service.list(pager);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(@SessionAttribute User user, Community item) {
		
		item.setNum(user.getNum());
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		
		Community item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{id}")
	public String update(@PathVariable int id, Community item) {
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		
		Community item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "detail";
	}
}
