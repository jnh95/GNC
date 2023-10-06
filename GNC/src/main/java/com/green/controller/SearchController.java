package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.domain.Member;
import com.green.service.SearchService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/search")
public class SearchController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@Autowired
	private SearchService searchService;
	
	@GetMapping
	public String search(Model model, @RequestParam("content") String content) {
		
		List<Member> bloglist = searchService.blog(content);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.question(content);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answer(content);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("searchLogin", "searchLogin");
		
		model.addAttribute("content", content);

		return "index";
	}
	
	@GetMapping("/in")
	public String searchIn(Model model, @RequestParam("content") String content) {
		
		List<Member> bloglist = searchService.blog(content);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.question(content);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answer(content);

		model.addAttribute("answerList", answerlist);

		model.addAttribute("search", "in");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("content", content);

		return "index";
	}
	
	@GetMapping("/title")
	public String searchTitle(Model model, @RequestParam("content") String content) {
		
		List<Member> bloglist = searchService.blogTitle(content);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.questionTitle(content);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answerTitle(content);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("search", "title");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("content", content);

		return "index";
	}
	
	@GetMapping("/content")
	public String searchContent(Model model, @RequestParam("content") String content) {
		
		List<Member> bloglist = searchService.blogContent(content);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.questionContent(content);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answerContent(content);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("search", "content");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("content", content);

		return "index";
	}
}