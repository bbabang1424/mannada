package kr.ac.kopo.mannada.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

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

import kr.ac.kopo.mannada.model.Manager;
import kr.ac.kopo.mannada.model.Notice;
import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.ManagerService;
import kr.ac.kopo.mannada.service.NoticeService;
import kr.ac.kopo.mannada.service.QuestionService;

@Controller
@RequestMapping("/mg")
public class ManagerController {
	final String path = "mg/";
	
	@Autowired
	ManagerService service;
	
	@Autowired
	NoticeService noticeService;
	
	@Autowired
	QuestionService qnaService;
	
	/* 마이페이지 */
	@GetMapping("/view/{nickname}")
	public String view(@PathVariable String nickname, Model model, @SessionAttribute Manager manager) {
		Manager item = service.item(nickname);
		model.addAttribute("manager", item);
		
		Pager pager = new Pager();
		pager.setPerPage(15);
		
		List<Notice> notice = noticeService.list(pager);
		model.addAttribute("myNotice", notice);
		
		List<Question> qna = qnaService.list(pager);
		model.addAttribute("myQnA", qna);
		
		return path + "view";
	}
	
	/* 회원정보 변경 */
	@GetMapping("/update/{id}")
	public String update(@PathVariable String id, Model model, HttpSession session) {
		Manager item = service.item(id);
		model.addAttribute("manager", item);
		
		return path + "update";
	}

	@PostMapping("/update/{id}")
	public String update(@PathVariable String id, Manager item, @SessionAttribute Manager manager) {
		item.setId(manager.getId());
		
		service.update(item);
		
		return "redirect:../view/" + item.getNickname();
	}
	
	/* 비밀번호 변경 */
	@GetMapping("/password/{id}")
	public String password(@PathVariable String id, Model model) {
		Manager item = service.item(id);
		model.addAttribute("manager", item);
		
		return path + "password";
	}
	
	/* 수정 전에 비밀번호 확인 */
	//@ResponseBody : 경로를 고정해서 요청하는 언어테이션임 redirect를 리턴해야할때는 사용x
	@ResponseBody
	@PostMapping("/checkPW")
	public String checkPW(@RequestBody Manager item) {
		//System.out.println(item.getId());
		item.setId(item.getId());
			
		if (service.checkPW(item))
			return "OK";
		else
			return "FAIL";
	}
		
	@PostMapping("/password/{nickname}")
	public String password(@PathVariable String nickname, Manager item, @SessionAttribute Manager manager) {
		//보안을 위해 로그인여부확인
		item.setId(manager.getId());
		
		service.password(item);
		
		return "redirect:../view/" + item.getNickname();
	}
}
