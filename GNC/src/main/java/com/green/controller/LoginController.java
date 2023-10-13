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
	public String login(HttpServletRequest request, HttpServletResponse response, Model model) {

		String id = request.getParameter("MEM_ID");
		String pw = request.getParameter("MEM_PW");
		
		String blog = request.getParameter("blog");
		String blogDetail = request.getParameter("blogDetail");
		String bloNo = request.getParameter("bloNo");
		String question = request.getParameter("question");
		String questionDetail = request.getParameter("questionDetail");
		String queNo = request.getParameter("queNo");
		String answer = request.getParameter("answer");
		String answerDetail = request.getParameter("answerDetail");
		String ansNo = request.getParameter("ansNo");
		
		String searchLogin = (String) request.getParameter("searchLogin");
		String search = (String) request.getParameter("search");

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
		
		if("blogDetail".equals(blogDetail)) {
			
			model.addAttribute("BLO_NO", bloNo);
			
			return "redirect:/blog/blogDetail";
		}
		
		if("question".equals(question)) {
			return "redirect:/question";
		}
		
		if("questionDetail".equals(questionDetail)) {
			
			model.addAttribute("QUE_NO", queNo);
			
			return "redirect:/question/questionDetail";
		}
		
		if("answer".equals(answer)) {
			return "redirect:/answer";
		}
		
		if("answerDetail".equals(answerDetail)) {
			
			model.addAttribute("ANS_NO", ansNo);
			model.addAttribute("QUE_NO", queNo);
			
			return "redirect:/answer/answerDetail";
		}
		
		if("searchLogin".equals(searchLogin)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search";
		}
		
		if("searchEnglish".equals(searchLogin)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/english";
		}
		
		if("in".equals(search)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/in";
		}
		
		if("inEnglish".equals(search)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/in/english";
		}
		
		if("title".equals(search)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/title";
		}
		
		if("titleEnglish".equals(search)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/title/english";
		}
		
		if("content".equals(search)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/content";
		}
		
		if("contentEnglish".equals(search)) {
			
			String content = (String) request.getParameter("content");
			String english = (String) request.getParameter("english");
			
			model.addAttribute("content", content);
			
			if(english != null) {
				model.addAttribute("english", english);
				model.addAttribute("content", english);
			}
			
			return "redirect:/search/content/english";
		}
		
		return "redirect:/";
	}

}