package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/blog")
public class BlogController {

	@GetMapping
	public String blog(Model model) {
		
		model.addAttribute("blog", "blog");
		
		return "blog";
	}
	
}