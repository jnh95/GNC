package com.green.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.LoginService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/login")
public class LoginController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	private LoginService loginService;

	@PostMapping
	public String login(HttpServletRequest request, HttpServletResponse response) {

		String id = request.getParameter("MEM_ID");
		String pw = request.getParameter("MEM_PW");
		
		String blog = request.getParameter("blog");

		Cookie[] cookies = request.getCookies();

		if (cookies != null) {

			for (Cookie c : cookies) {
				String name = c.getName();

				if (name.equals("rememberId")) {
					Cookie cookie = new Cookie("rememberId", null);
					cookie.setMaxAge(0);
					cookie.setPath("/");
					response.addCookie(cookie);
				}
			}
		}

		loginService.Login(id, pw, request);

		if (request.getParameter("remember") != null) {
			Cookie cookie = new Cookie("rememberId", id);
			cookie.setMaxAge(60 * 60 * 365);
			cookie.setPath("/");
			response.addCookie(cookie);
		}
		
		if("blog".equals(blog)) {
			return "redirect:/blog";
		}
		
		return "redirect:/";
	}

}