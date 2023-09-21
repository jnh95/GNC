package com.green.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.domain.Member;
import com.green.service.IndexService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private IndexService indexService;

	@GetMapping
	public String blog(Model model) {
		
		List<Member> questionlist = indexService.question();

		model.addAttribute("questionList", questionlist);
		
		model.addAttribute("question", "question");
		
		return "question";
	}
	
}