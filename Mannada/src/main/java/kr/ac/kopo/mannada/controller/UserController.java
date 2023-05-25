package kr.ac.kopo.mannada.controller;

import java.io.File;
import java.util.List;
import java.util.UUID;

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
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.Question;
import kr.ac.kopo.mannada.model.Reply;
import kr.ac.kopo.mannada.model.Review;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.CommunityService;
import kr.ac.kopo.mannada.service.MannaService;
import kr.ac.kopo.mannada.service.QuestionService;
import kr.ac.kopo.mannada.service.UserService;

@Controller
@RequestMapping("/user")
public class UserController {
	final String path = "user/";
	private String uploadPath = "d://upload/";
	
	@Autowired
	UserService service;
	
	@Autowired
	MannaService mannaService;
	
	@Autowired
	CommunityService commuSerice;
	
	@Autowired
	QuestionService qnaService;
	
	/* 회원 관리 */
	@GetMapping("/list") 
	public String list(Model model, Pager pager) {
		pager.setPerPage(10);
		
		List<User> list = service.list(pager);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	/* 마이페이지 */
	@GetMapping("/view/{num}")
	public String view(@PathVariable int num, Model model) {
		User item = service.item(num);
		model.addAttribute("user", item);
		
		Pager pager = new Pager();
		pager.setPerPage(5);
		pager.setSearch(2);
		pager.setKeyword(item.getNickname());
		
		List<Manna> manna = mannaService.list(pager);
		model.addAttribute("myManna", manna);
		List<Question> qna = qnaService.list(pager);
		model.addAttribute("myQnA", qna);
		List<Community> commu = commuSerice.list(pager);
		model.addAttribute("myCommu", commu);
		

		Pager rePager = new Pager(); 
		rePager.setPerPage(15);
		rePager.setSearch(2);
		rePager.setKeyword(item.getNickname());
 
		List<Reply> reply = commuSerice.replyList(rePager); 
		model.addAttribute("commuReply", reply);

		
		List<Review> review = service.reviewList(num, rePager);
		model.addAttribute("review", review);
		
		return path + "view";
	}
	
	/* 한줄평 관련 */
	//추가
	@RequestMapping("/review/{num}")
	public String review(@PathVariable int num, Review review, @SessionAttribute User user) {
		review.setNum(num);
		
		review.setWriter(user.getNum());
		
		service.reviewAdd(review);
		
		return "redirect:../view/" + num;
	}
	
	//삭제
	@GetMapping("/{num}/reviewDelete/{id}")
	public String reviewDelete(@PathVariable int id, @PathVariable int num, @SessionAttribute User user) {
		//System.out.println(num);
		
		service.reviewDelete(id);
		
		return "redirect:../../view/" + num;
	}
	
	/* 회원정보 변경 */
	@GetMapping("/update/{num}")
	public String update(@PathVariable int num, Model model, HttpSession session) {
		User item = service.item(num);
		model.addAttribute("user", item);
		
		return path + "update";
	}

	@PostMapping("/update/{num}")
	public String update(@PathVariable int num, User item, @SessionAttribute User user) {
		item.setNum(item.getNum());
		
		service.update(item);
		
		return "redirect:../view/" + num;
	}
	
	/* 비밀번호 변경 */
	@GetMapping("/password/{num}")
	public String password(@PathVariable int num, Model model) {
		User item = service.item(num);
		model.addAttribute("user", item);
		
		return path + "password";
	}
	
	/* 수정 전에 비밀번호 확인 */
	//@ResponseBody : 경로를 고정해서 요청하는 언어테이션임 redirect를 리턴해야할때는 사용x
	@ResponseBody
	@PostMapping("/checkPW/{num}")
	public String checkPW(@PathVariable int num, @RequestBody User item) {
		item.setNum(num);
			
		if (service.checkPW(item))
			return "OK";
		else
			return "FAIL";
	}
		
	@PostMapping("/password/{num}")
	public String password(@PathVariable int num, User item, @SessionAttribute User user) {
		item.setNum(num);
		
		service.password(item);
		
		return "redirect:../view/" + num;
	}
	
	/* 회원탈퇴 */
	@GetMapping("/stop/{num}")
	public String stop(@PathVariable int num, Model model) {
		User item = service.item(num);
		model.addAttribute("user", item);
		
		return path + "stop";
	}
	
	@PostMapping("/stop/{num}")
	public String stop(@PathVariable int num, User item, @SessionAttribute User user, HttpSession session) {
		item.setNum(num);
		
		service.stop(item);
		
		session.invalidate();
		
		return "redirect:/";
	}
	
	/* 프로필 사진 업로드 */
	@GetMapping("/photo/{num}")
	public String photo(@PathVariable int num, Model model) {
		User item = service.item(num);
		
		// System.out.println(item.getAttach().getFilename());
		
		model.addAttribute("user", item);
		
		return path + "photo";
	}
	
	@PostMapping("/photo/{num}")
	public String photo(@PathVariable int num, MultipartFile uploadFile, User item, @SessionAttribute User user) {
		item.setNum(item.getNum());
		
		//삭제하고 등록되게 함 : ajax 필요x
		Attach prevAttach = service.item(num).getAttach();
		service.attachDelete(prevAttach.getId());
		
		//단일 첨부파일
		if(!uploadFile.isEmpty()) {
			String filename = uploadFile.getOriginalFilename();
			String uuid = UUID.randomUUID().toString();
			
			try {
				uploadFile.transferTo(new File(uploadPath + uuid + "_" + filename));
				
				Attach attach = new Attach();
				attach.setUuid(uuid);
				attach.setFilename(filename);
				
				item.setAttach(attach);
				
				service.photo(item);
			} catch (Exception e) {
				// TODO: handle exception
			}
		}		
		
		return "redirect:../view/" + num;
	}
	@GetMapping("/attach/delete/{attachId}")
	public int attachDelete(@PathVariable int attachId) {
		service.attachDelete(attachId);
		
		return attachId;
	}
}
