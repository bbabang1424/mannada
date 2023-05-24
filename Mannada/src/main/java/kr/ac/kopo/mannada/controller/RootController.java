package kr.ac.kopo.mannada.controller;

import java.util.List;

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
	

	@RequestMapping("/")
	public String index(Model model, Pager pager) {
		List<Manna> mannaList = mannaService.list(pager);
		model.addAttribute("mannaList", mannaList);
		
		List<Community> commuList = commuService.list(pager);
		model.addAttribute("commuList", commuList);

		return "index";
	}

	/* 로그인 */
	@GetMapping("/login")
	public String login() {
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
		} else
			return "redirect:.";
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

		} else
			return "redirect:.";
	}
	/* 로그아웃 */
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
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
	@GetMapping("/checkId/{id}")
	public String checkId(@PathVariable String id) {

		if (service.checkId(id))
			return "OK";
		else
			return "FAIL";
	}
	/* 회원가입 시 중복 닉네임 확인. */
	@ResponseBody
	@GetMapping("/checkNick/{id}")
	public String checkNick(@PathVariable String id) {
		if (service.checkNick(id))
			return "OK";
		else
			return "FAIL";
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
		
		return "searchAddress";
	}
}
