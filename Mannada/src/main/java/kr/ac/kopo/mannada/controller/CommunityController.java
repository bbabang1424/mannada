package kr.ac.kopo.mannada.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;

import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Reply;
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
		
		return "redirect:../detail/" + id;
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id) {
		
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		
		service.addViewCnt(id);
		
		Community item = service.item(id);
		model.addAttribute("item", item);
		
		List<Reply> reply = service.detailReply(id); 
		model.addAttribute("reply", reply);
		
		return path + "detail";
	}
	

	/* 댓글 */
	
	@RequestMapping("/replyAdd")
	public String replyAdd(Reply reply, @SessionAttribute User user) throws Exception {
		
		reply.setNum(user.getNum());
		service.addReply(reply);
		
		return "redirect:detail/" + reply.getCommuId();
	}

	
	@GetMapping("replyUpdate/{id}")
	public String replyUpdate(@PathVariable int id, Model model) {

		Reply reply = service.replyItem(id);
		model.addAttribute("reply", reply);
		
		int commuId = reply.getCommuId();
		Community item = service.item(commuId);
		model.addAttribute("item", item);


		return path + "replyUpdate";
	}
	

	@PostMapping("replyUpdate/{id}")
	public String replyUpdate(@PathVariable int id, Reply item, @SessionAttribute User user) {
		
		service.updateReply(item);

		return "redirect:../detail/" + id;

	}
	

	@RequestMapping("/replyDelete/{id}")
	public String replyDelete(@PathVariable int id, @RequestParam(value = "id") int commuId) throws Exception {

		service.deleteReply(id);
		
		return "redirect:../detail/" + commuId ;
	}
}
