package kr.ac.kopo.mannada.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.MannaService;
import kr.ac.kopo.mannada.service.UserService;

@RestController
public class MannaRestController {
	
	@Autowired
	MannaService service;

	@Autowired
	UserService userService;


	@GetMapping("/api/manna")
	public Map<String, Object> list(Pager pager){
		Map<String, Object> map = new HashMap<>();
		
		pager.setPerPage(8);
		
		List <Manna> list = service.list(pager);
		
		map.put("list", list);
		map.put("pager", pager);
		
		return map;
	}
	
	@GetMapping("/api/item/{id}")
	public Map<String, Object> item(@PathVariable int id){
		
		service.addViewCnt(id);
		
		Map<String, Object> map = new HashMap<String, Object>();
		
		Manna item = service.item(id);
		
		List <User> member = service.memberList(id);
		
		map.put("item", item);
		map.put("member", member);
		
		return map;
	}
	
	
	@PostMapping("/addJoin/{id}")
	public String addjoin(@PathVariable int id, @SessionAttribute User user) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", id);
		map.put("num", user.getNum());
		service.addJoin(map);
		
		return "redirect:list";
	}
	

	@DeleteMapping("/deleteJoin/{id}")
	public String deleteJoin(@PathVariable int id, @SessionAttribute User user) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("mannaId", id);
		map.put("num", user.getNum());
		service.deleteJoin(map);
		
		return "redirect:list";
	}

}
