package com.green.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.ForgetService;

@Controller
@RequestMapping("/forgetPw")
public class ForgetPwController {
	
	@Autowired
	private ForgetService forgetService;

	@GetMapping
	public String forgetPw(Model model) {
		return "forgetPw";
	}
	
	@PostMapping
	public String pwChange(HttpServletRequest request) {

		forgetService.pwChange(request);
		
		return "redirect:/";
	}
}