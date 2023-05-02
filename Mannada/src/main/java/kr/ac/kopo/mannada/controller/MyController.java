package kr.ac.kopo.mannada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.service.UserService;

@Controller
@RequestMapping("/mypage")
public class MyController {
	final String path = "mypage/";
	
	@Autowired
	UserService service;
	
	/*회원정보수정 및 회원탈퇴 관련*/
	//회원정보수정
	@RequestMapping("/profile")
	public String profile(Model model) {
		List<User> profile = service.profile();
		model.addAttribute("profile", profile);
		
		return path + "profile";
	}
	
	@GetMapping("/proUpdate/{id}")
	public String proUpdate(@PathVariable String id, Model model, @SessionAttribute User user) {
		User item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "proUpdate";
	}
	@PostMapping("/proUpdate/{id}")
	public String proUpdate(@PathVariable String id, @SessionAttribute User item) {
		item.setId(id);
		
		if(item.getId().equals(id))	
			service.proUpdate(item);
		
		return "redirect:proUpdate";
	}	
	
	//비밀번호변경창	
	@GetMapping("/password/{id}")
	public String updatePW(@PathVariable String id) {
		return path + "password";
	}
	@ResponseBody
	@PostMapping("/checkPW/{id}")
	public String checkPW(@PathVariable String id, @SessionAttribute User item) {
		if(service.checkPW(id))
			return "ok";
		else
			return "fail";
	}
	@PostMapping("/password/{id}")
	public String updatePW(@PathVariable String id, User user, @SessionAttribute User item) {
		user.setId(id);
		
		if(item.getId().equals(id))
			service.updatePW(user);
		
		return "redirect:proUpdate";
	}
	
	//회원탈퇴창
	@GetMapping("/done")
	public String delete(Model model ,@SessionAttribute User user) {	
		return path + "done";
	}
}
