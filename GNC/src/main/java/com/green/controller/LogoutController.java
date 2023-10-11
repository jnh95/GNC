package com.green.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
	public String login(HttpServletRequest request, Model model) {

		HttpSession session = request.getSession();
		
		session.invalidate();
		
		String blog = request.getParameter("blog");
		String blogDetail = request.getParameter("blogDetail");
		String bloNo = request.getParameter("bloNo");
		String question = request.getParameter("question");
		String questionDetail = request.getParameter("questionDetail");
		String queNo = request.getParameter("queNo");
		String answer = request.getParameter("answer");
		String answerDetail = request.getParameter("blogDeanswerDetailtail");
		String ansNo = request.getParameter("ansNo");
		
		String searchLogin = (String) request.getParameter("searchLogin");
		String search = (String) request.getParameter("search");
		
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
			
			return "redirect:/answer/answerDetail";
		}
		
		if("searchLogin".equals(searchLogin)) {
			
			String content = (String) request.getParameter("content");
			model.addAttribute("content", content);
			
			return "redirect:/search";
		}
		
		if("in".equals(search)) {
			
			String content = (String) request.getParameter("content");
			model.addAttribute("content", content);
			
			return "redirect:/search/in";
		}
		
		if("title".equals(search)) {
			
			String content = (String) request.getParameter("content");
			model.addAttribute("content", content);
			
			return "redirect:/search/title";
		}
		
		if("content".equals(search)) {
			
			String content = (String) request.getParameter("content");
			model.addAttribute("content", content);
			
			return "redirect:/search/content";
		}
		
		HttpSession session2 = request.getSession();
		
		session2.setAttribute("logout", "logout");

		return "redirect:/";
	}

}