package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.domain.Member;
import com.green.service.IndexService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private IndexService indexService;

	@GetMapping
	public String question(Model model) {
		
		List<Member> questionlist = indexService.question();

		model.addAttribute("questionList", questionlist);
		
		model.addAttribute("question", "question");
		
		return "question";
	}
	
	@GetMapping("questionDetail")
	public String questionDetail(Model model, @RequestParam("QUE_NO") String queNo) {
		
		model.addAttribute("questionDetail", "questionDetail");
		
		List<Member> questionlist = indexService.question(queNo);
		
		model.addAttribute("questionList", questionlist);
		model.addAttribute("queNo", queNo);
		
		return "questionDetail";
	}
	
	@GetMapping("myQuestion")
	public String myQuestion(Model model, @RequestParam("myQuestion") String memNo) {
		
		model.addAttribute("myQuestion", "myQuestion");
		
		List<Member> questionlist = indexService.myQuestion(memNo);
		
		model.addAttribute("questionlist", questionlist);
		
		return "question";
	}
	
	@GetMapping("questionWrite")
	public String questionWrite(Model model) {
		
		model.addAttribute("questionWrite", "questionWrite");
		
		return "questionWrite";
	}
	
}