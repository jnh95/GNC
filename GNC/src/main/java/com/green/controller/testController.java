package com.green.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/test")
public class testController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	
	@GetMapping
	public String index(Model model) {
		
		return "test";
	}
}