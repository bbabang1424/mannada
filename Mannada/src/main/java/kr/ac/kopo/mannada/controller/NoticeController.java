package kr.ac.kopo.mannada.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;

import kr.ac.kopo.mannada.model.Attach;
import kr.ac.kopo.mannada.model.Manager;
import kr.ac.kopo.mannada.model.Notice;
import kr.ac.kopo.mannada.pager.Pager;
import kr.ac.kopo.mannada.service.NoticeService;

@Controller
@RequestMapping("/notice")
public class NoticeController {
	final String path = "notice/";
	final String uploadPath = "d://upload/";

	@Autowired
	NoticeService service;
	
	
	@GetMapping("/list")
	public String list(Model model, Pager pager) {
		
		List<Notice> list = service.list(pager);
		model.addAttribute("list", list);
		
		return path + "list";
	}
	
	@GetMapping("/add")
	public String add() {
		return path + "add";
	}
	
	@PostMapping("/add")
	public String add(Notice item, @SessionAttribute Manager manager) {
		item.setMgrId(manager.getId());
		
		System.out.println(manager.getId());
		
		try {
			List<Attach> list = new ArrayList<Attach>();
			
			for(MultipartFile attach : item.getAttach()) {
				
				if(attach != null && !attach.isEmpty()) {
					String filename = attach.getOriginalFilename();
					String uuid = UUID.randomUUID().toString();
					
					attach.transferTo(new File(uploadPath + uuid + "_" + filename));
					
					Attach attachItem = new Attach();
					attachItem.setFilename(filename);
					attachItem.setUuid(uuid);
					
					list.add(attachItem);
				}
			}
			
			item.setAttachs(list);
			
			service.add(item);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:list";
	}
	
	@GetMapping("/update/{id}")
	public String update(@PathVariable int id, Model model, @SessionAttribute Manager manager) {
		Notice item = service.item(id);
		
		if(manager.getId().equals(item.getMgrId())) {
			model.addAttribute("item", item);
			return path + "update";
		} else		
			return "redirect:../detail/" + id;
	}
	
	@PostMapping("/update/{id}")
	public String update(@PathVariable int id, Notice item, @SessionAttribute Manager manager) {
		item.setMgrId(manager.getId());
		
		try {
			
			List<Attach> list = new ArrayList<Attach>();
			
			for(MultipartFile attach : item.getAttach()) {
				
				if(attach != null && !attach.isEmpty()) {
					String filename = attach.getOriginalFilename();
					String uuid = UUID.randomUUID().toString();
					
					attach.transferTo(new File(uploadPath + uuid + "_" + filename));
					
					Attach attachItem = new Attach();
					attachItem.setFilename(filename);
					attachItem.setUuid(uuid);
					
					list.add(attachItem);
				}
			}
			
			item.setAttachs(list);
			
			service.update(item);
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		return "redirect:../detail/" + id;
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable int id, @SessionAttribute Manager manager) {
		service.delete(id);
		
		return "redirect:../list";
	}
	
	@GetMapping("/detail/{id}")
	public String detail(@PathVariable int id, Model model) {
		
		service.addViewCnt(id);
		
		Notice item = service.item(id);
		model.addAttribute("item", item);
		
		return path + "detail";
	}
	
	
	@ResponseBody
	@RequestMapping("/delete_attach/{id}")
	public String deleteAttach(@PathVariable int id) {
		if(service.deleteAttach(id)) {
			return "OK";
		}
		else
			return "FAIL";
	}
}
