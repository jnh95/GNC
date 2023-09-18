package com.green.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.repository.JoinRepository;

@Controller
@RequestMapping("/join")
public class JoinController {
	
	@Autowired
	private JoinRepository joinRepository;

	@GetMapping
	public String join(Model model) {
		return "join";
	}
	
	@PostMapping
	public String join(HttpServletRequest request) {
		
		int idCheck = joinRepository.idCheck(request);
		
		if(idCheck == 0) {
		
			joinRepository.join(request);
		
			return "redirect:/";
		}
		
		return "redirect:/join";
	}
	
	@GetMapping("/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {
		
		int idCheck = joinRepository.idCheck(request);
		
		String id = request.getParameter("idInput");
		
		if(idCheck == 0) {
			model.addAttribute("useId", id);
			model.addAttribute("existId", "");
			return "join";
		}
			model.addAttribute("useId", "");
			model.addAttribute("existId", "exist");
		 return "join";
	}
}