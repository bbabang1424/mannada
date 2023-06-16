package kr.ac.kopo.mannada.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import kr.ac.kopo.mannada.model.Address;
import kr.ac.kopo.mannada.model.Community;
import kr.ac.kopo.mannada.model.Manager;
import kr.ac.kopo.mannada.model.Manna;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.AddressService;
import kr.ac.kopo.mannada.service.CommunityService;
import kr.ac.kopo.mannada.service.MailSendService;
import kr.ac.kopo.mannada.service.ManagerService;
import kr.ac.kopo.mannada.service.MannaService;
import kr.ac.kopo.mannada.service.UserService;

@Controller
public class RootController {

	@Autowired
	UserService service;
	
	@Autowired
	ManagerService mgService;
	
	@Autowired
	AddressService addressService;
	
	@Autowired
	MannaService mannaService;
	
	@Autowired
	CommunityService commuService;
	
	@Autowired
	MailSendService mailService;
	

	@RequestMapping("/")
	public String index(Model model, Pager pager) {
		List<Manna> mannaList = mannaService.list(pager);
		model.addAttribute("mannaList", mannaList);
		
		List<Community> commuList = commuService.list(pager);
		model.addAttribute("commuList", commuList);
		
		List<Community> commuReview = commuService.reviewList(pager);
		model.addAttribute("commuReview", commuReview);
		
		List<Community> commuTalk = commuService.talkList(pager);
		model.addAttribute("commuTalk", commuTalk);

		return "index";
	}
	

	/* 로그인 */
	@GetMapping("/login")
	public String login(HttpSession session, Model model) {
		//아이디, 비밀번호 일치여부 메세지 보내기
		String msg = (String) session.getAttribute("msg");
		
		if(msg != null) {
			model.addAttribute("msg", msg);
			
			session.removeAttribute("msg");
		}
		
		return "login";
	}
	@PostMapping("/userLogin")
	public String userLogin(User user, HttpSession session) {		
		if (service.login(user)) {
			session.setAttribute("user", user);

			String targetUrl = (String) session.getAttribute("target_url");
			System.out.println("RootController: " + targetUrl);
			session.removeAttribute("target_url");
			
			if (targetUrl == null)
				return "redirect:.";
			else
				return "redirect:" + targetUrl;
		} else {
			//유저 : 일치여부 세션 생성 = 메세지는 동일한 내용이니까 변수를 나눌 필요x
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			
			return "redirect:login";
		}
	}
	@PostMapping("/managerLogin")
	public String userLogin(Manager manager, HttpSession session) {		
		if (mgService.login(manager)) {
			session.setAttribute("manager", manager);

			String targetUrl = (String) session.getAttribute("target_url");
			System.out.println("RootController: " + targetUrl);
			session.removeAttribute("target_url");

			if (targetUrl == null)
				return "redirect:.";
			else
				return "redirect:" + targetUrl;

		} else {
			//관리자 : 일치여부 세션 생성 = 메세지는 동일한 내용이니까 변수를 나눌 필요x
			session.setAttribute("msg", "아이디 또는 비밀번호가 일치하지 않습니다");
			
			return "redirect:login";
		}
	}
	
	/* 로그아웃 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.removeAttribute("loginOk"); //로그인 상태 세션 제거
		session.invalidate(); // 세션 데이터 삭제

		return "redirect:.";
	}

	/* 회원가입 */
	@GetMapping("/signup")
	public String signup() {
		return "signup";
	}	
	@GetMapping("/signup_email")
	public String signupEmail() {		
		return "signup_email";
	}
	@PostMapping("/signup")
	public String signup(User item) {
		service.signup(item);
		
		return "signup_ok";
	} 

	/* 회원가입 시 중복 아이디 확인. */
	@ResponseBody
	@GetMapping("/checkId")
	public String checkId(HttpServletRequest request) {
		String id = request.getParameter("id");
		
		if (service.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
	/* 회원가입 시 중복 닉네임 확인. */
	@ResponseBody
	@GetMapping("/checkNick/{id}")
	public String checkNick(@PathVariable String id) {
		if (service.checkNick(id) && mgService.checkNick(id))
			return "OK";
		else
			return "FAIL";
	}
	
	/* 아이디 혹은 비번 찾기 관련 */
	@GetMapping("/findpage")
	public String findpage() {
		return "findpage";
	}
	@PostMapping("/findpage")
	public String findpage(User user, Model model) {
		
		if(service.checkFind(user)==0) {
			model.addAttribute("msg", "닉네임 혹은 이메일이 일치하지 않습니다");
			return "/findpage";
		} else {
			mailService.findPW(user.getId(), user.getNickname());
			model.addAttribute("user", user.getId());
			
			return "/findpage";
		}
		
	}
	
	/*selectbox 주소관련*/
	@ResponseBody
	@GetMapping("/metro")
	public List<Address> metro() {
		 return addressService.metro();
	}	
	@ResponseBody
	@GetMapping("/city")
	public List<Address> city(String metro) {
		 return addressService.city(metro);
	}	
	@ResponseBody
	@GetMapping("/road")
	public List<Address> road(Address address) {
		 return addressService.road(address);
	}	
	@ResponseBody
	@GetMapping("/jibun")
	public List<Address> jibun(Address address) {
		 return addressService.jibun(address);
	}
	/*주소검색*/
	@GetMapping("/searchAddress")
	public String searchAddress(String addressType, String metro, String city, String address, Model model) {
		System.out.println("1111");
		
		/** address 를 select값 제대로 불러오는지 확인하는 코드
		model.addAttribute("address", metro + " " + city + " " + address);
		**/		
		// pager
		Pager pager = new Pager();
		//manna.xml의 "search eq 7"과 keyword값 설정
		pager.setSearch(7);
		pager.setKeyword(metro + " " + city + " " + address);
		
		// 만나다 검색
		List<Manna> mannaList = mannaService.list(pager);
		model.addAttribute("mannaList", mannaList);
		
		/*
		 * String query = "?search=7&keyword=" + metro + " " + city + " " + address;
		 * 
		 * return "redirect:/manna/list" + query;
		 */
		return "searchAddress";
	}
	
	
	//이메일 인증
	@GetMapping("/mailCheck")
	@ResponseBody
	public String mailCheck(String email) {
		System.out.println("이메일 인증 요청이 들어옴!");
		System.out.println("이메일 인증 이메일 : " + email);
		
		return mailService.joinEmail(email);
	}
}
