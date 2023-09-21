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
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private IndexService indexService;

	@GetMapping
	public String blog(Model model) {
		
		List<Member> answerlist = indexService.answer();

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("answer", "answer");
		
		return "answer";
	}
	
}