package kr.ac.kopo.mannada.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.ac.kopo.mannada.model.Manager;
import kr.ac.kopo.mannada.model.User;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.ManagerService;
import kr.ac.kopo.mannada.service.UserService;

@Controller
public class RootController {

	@Autowired
	UserService service;
	
	@Autowired
	ManagerService managerService;

	@RequestMapping("/")
	public String index(Model model, Pager pager) {

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
		
		if (managerService.login(manager)) {
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

		return "redirect:.";
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
	
	@GetMapping("/mypage")
	public String mypage() {
		return "mypage";
	}
	
}
