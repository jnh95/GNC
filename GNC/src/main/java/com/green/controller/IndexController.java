package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.domain.Member;
import com.green.service.IndexService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/")
public class IndexController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private IndexService indexService;
	
	@GetMapping
	public String index(Model model) {
		
		List<Member> bloglist = indexService.blog();

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = indexService.question();

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = indexService.answer();

		model.addAttribute("answerList", answerlist);

		return "index";
	}
}