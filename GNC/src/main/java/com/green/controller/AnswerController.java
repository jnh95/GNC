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
@RequestMapping("/answer")
public class AnswerController {
	
	@Autowired
	private IndexService indexService;

	@GetMapping
	public String answer(Model model) {
		
		List<Member> answerlist = indexService.answer();

		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("answer", "answer");
		
		return "answer";
	}
	
	@GetMapping("answerDetail")
	public String answerDetail(Model model, @RequestParam("ANS_NO") String ansNo) {
		
		model.addAttribute("answerDetail", "answerDetail");
		
		List<Member> answerlist = indexService.answer(ansNo);
		
		model.addAttribute("answerList", answerlist);
		model.addAttribute("ansNo", ansNo);
		
		return "answerDetail";
	}
	
	@GetMapping("myAnswer")
	public String myAnswer(Model model, @RequestParam("myAnswer") String memNo) {
		
		model.addAttribute("myAnswer", "myAnswer");
		
		List<Member> answerlist = indexService.myAnswer(memNo);
		
		model.addAttribute("answerlist", answerlist);
		
		return "answer";
	}
	
	@GetMapping("answerWrite")
	public String answerWrite(Model model) {
		
		model.addAttribute("answerWrite", "answerWrite");
		
		return "answerWrite";
	}
	
}