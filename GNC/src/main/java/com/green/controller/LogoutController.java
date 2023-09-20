package com.green.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/logout")
public class LogoutController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@PostMapping
	public String login(HttpServletRequest request) {

		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String blog = request.getParameter("blog");
		
		if("blog".equals(blog)) {
			return "redirect:/blog";
		}

		return "redirect:/";
	}

}