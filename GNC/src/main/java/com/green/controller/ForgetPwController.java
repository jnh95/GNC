package com.green.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.MypageService;

@Controller
@RequestMapping("/forgetPw")
public class ForgetPwController {
	
	@Autowired
	private MypageService mypageService;

	@GetMapping
	public String forgetPw(Model model) {
		return "forgetPw";
	}
	
	@PostMapping
	public String pwChange(HttpServletRequest request) {

		String id = request.getParameter("MEM_ID");
		String pw = request.getParameter("MEM_PW");
		String pw2 = request.getParameter("MEM_PW2");

		mypageService.pwChange(id, pw, pw2, request);
		
		return "redirect:/";
	}
}