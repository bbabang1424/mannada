package kr.ac.kopo.mannada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.MannaService;

@Controller
@RequestMapping("/manna")
public class MannaController {
	final String path = "manna/";
	
	@Autowired
	MannaService service;
	
	@GetMapping("/list")
	public String list(Model model, Pager pager) {
		pager.setPerPage(12);
		
		List<Manna> list = service.list(pager);
		model.addAttribute("list", list);
		
		return path+"list";
	}
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		Manna item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "detail";
	}
	
	@GetMapping("/add")
	public String add() {
		return path+"add";
	}
	@PostMapping("/add")
	public String add(Manna item) {
		service.add(item);
		
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
	
	@GetMapping
	public String init() {
		service.init();
		
		return "redirect:list";
	}
}
