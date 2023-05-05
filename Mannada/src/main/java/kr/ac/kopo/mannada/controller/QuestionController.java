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

import kr.ac.kopo.mannada.model.Answer;
import kr.ac.kopo.mannada.model.Manager;
import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.QuestionService;

@Controller
@RequestMapping("/qna")
public class QuestionController {
	final String path = "qna/";
	
	@Autowired
	QuestionService service;
	
	
	@RequestMapping("/list")
	public String list(Model model, Pager pager) {
		
		List<Question> list = service.list(pager);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(@SessionAttribute User user, Question item) {
		
		item.setNum(user.getNum());
		service.add(item);
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model) {
		
		Question item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "update";
	}
	
	@PostMapping("/update/{id}")
	public String update(@PathVariable int id, Question item) {
		
		service.update(item);
		
		return "redirect:../list";
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@RequestMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		
		service.addViewCnt(id);
		
		Question item = service.item(id);
		model.addAttribute("question", item);
		
		Answer answer = service.answer(id);
		model.addAttribute("answer", answer);
		
		return path + "detail";
	}
	
	@PostMapping("/addAnswer")
	public String addAnswer(@SessionAttribute Manager manager, Answer item) {
		
		item.setMgrId(manager.getId());
		service.addAnswer(item);
		

		return "redirect:detail/" + item.getQuestionId();
	}
	
	
	@PostMapping("/updateAnswer/{id}")
	public String updateAnswer(@PathVariable int id, Answer item) {
		
		item.setId(id);
		service.updateAnswer(item);
		
		return "redirect:detail/" + item.getQuestionId();
	}
	
	@GetMapping("/detail/deleteAnswer/{id}")
	public String deleteAnswer(@PathVariable int id) {
		
		service.deleteAnswer(id);

		return "redirect:detail/" + id;
	}
	
}
