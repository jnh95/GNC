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
		
		content = content.replace("\"", "'");
		String content2 = content.replace("\'", "");
		String content3 = "";

		if (content.isBlank() == false && content.matches("^([a-zA-Z\\s]+[0-9\\s\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]*[a-zA-Z\\\\s]*)*")) {
			model.addAttribute("english", content);
			content2 = searchService.engToKor(content2);
			content3 = searchService.engToKor(content);
		}
		
		List<Member> bloglist = searchService.blog(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.question(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answer(content2);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("searchLogin", "searchLogin");
		
		if("".equals(content3)) {
			model.addAttribute("content", content);
		} else {
			model.addAttribute("content", content3);
		}

		return "index";
	}
	
	@GetMapping("/english")
	public String searchEnglish(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		
		model.addAttribute("englishKeep", "englishKeep");
		
		List<Member> bloglist = searchService.blog(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.question(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answer(content2);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("searchLogin", "searchEnglish");
		
		model.addAttribute("content", content);

		return "index";
	}
	
	@GetMapping("/in")
	public String searchIn(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		String content3 = "";
		
		if (content.isBlank() == false && content.matches("^([a-zA-Z\\s]+[0-9\\s\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]*[a-zA-Z\\\\s]*)*")) {
			model.addAttribute("english", content);
			content2 = searchService.engToKor(content2);
			content3 = searchService.engToKor(content);
		}
		
		List<Member> bloglist = searchService.blog(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.question(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answer(content2);

		model.addAttribute("answerList", answerlist);

		model.addAttribute("search", "in");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		if("".equals(content3)) {
			model.addAttribute("content", content);
		} else {
			model.addAttribute("content", content3);
		}

		return "index";
	}
	
	@GetMapping("/in/english")
	public String searchInEnglish(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		
		model.addAttribute("englishKeep", "englishKeep");
		
		List<Member> bloglist = searchService.blog(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.question(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answer(content2);

		model.addAttribute("answerList", answerlist);

		model.addAttribute("search", "inEnglish");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("content", content);

		return "index";
	}
	
	@GetMapping("/title")
	public String searchTitle(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		String content3 = "";
		
		if (content.isBlank() == false && content.matches("^([a-zA-Z\\s]+[0-9\\s\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]*[a-zA-Z\\\\s]*)*")) {
			model.addAttribute("english", content);
			content2 = searchService.engToKor(content2);
			content3 = searchService.engToKor(content);
		}
		
		List<Member> bloglist = searchService.blogTitle(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.questionTitle(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answerTitle(content2);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("search", "title");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		if("".equals(content3)) {
			model.addAttribute("content", content);
		} else {
			model.addAttribute("content", content3);
		}

		return "index";
	}
	
	@GetMapping("/title/english")
	public String searchTitleEnglish(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		
		model.addAttribute("englishKeep", "englishKeep");
		
		List<Member> bloglist = searchService.blogTitle(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.questionTitle(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answerTitle(content2);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("search", "titleEnglish");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("content", content);

		return "index";
	}
	
	@GetMapping("/content")
	public String searchContent(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		String content3 = "";
		
		if (content.isBlank() == false && content.matches("^([a-zA-Z\\s]+[0-9\\s\\{\\}\\[\\]\\/?.,;:|\\)*~`!^\\-_+<>@\\#$%&\\\\\\=\\(\\'\\\"]*[a-zA-Z\\\\s]*)*")) {
			model.addAttribute("english", content);
			content2 = searchService.engToKor(content2);
			content3 = searchService.engToKor(content);
		}
		
		List<Member> bloglist = searchService.blogContent(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.questionContent(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answerContent(content2);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("search", "content");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		if("".equals(content3)) {
			model.addAttribute("content", content);
		} else {
			model.addAttribute("content", content3);
		}

		return "index";
	}
	
	@GetMapping("/content/english")
	public String searchContentEnglish(Model model, @RequestParam("content") String content) {
		
		content = content.replace("\"", "'");
		String content2 = content.replace("'", "");
		
		model.addAttribute("englishKeep", "englishKeep");
		
		List<Member> bloglist = searchService.blogContent(content2);

		model.addAttribute("blogList", bloglist);
		
		List<Member> questionlist = searchService.questionContent(content2);

		model.addAttribute("questionList", questionlist);
		
		List<Member> answerlist = searchService.answerContent(content2);

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("search", "contentEnglish");
		
		model.addAttribute("indexSearch", "indexSearch");
		
		model.addAttribute("content", content);

		return "index";
	}
}