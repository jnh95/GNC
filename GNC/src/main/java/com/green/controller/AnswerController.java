package com.green.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
	
	@GetMapping("answerBoard")
	public String answerBoard(Model model, @RequestParam("end") String end) {
		
		model.addAttribute("answer", "answer");
		
		List<Member> answerlist = indexService.answer();
		
		model.addAttribute("answerList", answerlist);
		model.addAttribute("end", end);
		
		return "answer";
	}
	
	@GetMapping("myAnswerBoard")
	public String myAnswerBoard(Model model, @RequestParam("end") String end, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myAnswer", "myAnswer");
		
		List<Member> answerlist = indexService.myAnswer(memNo);
		
		model.addAttribute("answerList", answerlist);
		model.addAttribute("end", end);
		
		return "answer";
	}
	
	@GetMapping("answerDetail")
	public String answerDetail(Model model, @RequestParam("ANS_NO") String ansNo, @RequestParam("QUE_NO") String queNo) {
		
		model.addAttribute("answerDetail", "answerDetail");
		
		List<Member> answerlist = indexService.answer(ansNo);
		List<Member> qustionlist = indexService.question(queNo);
		
		model.addAttribute("answerList", answerlist);
		model.addAttribute("ansNo", ansNo);
		
		model.addAttribute("questionList", qustionlist);
		model.addAttribute("queNo", queNo);
		
		return "answerDetail";
	}
	
	@GetMapping("myAnswer")
	public String myAnswer(Model model, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myAnswer", "myAnswer");
		
		List<Member> answerlist = indexService.myAnswer(memNo);
		
		model.addAttribute("answerList", answerlist);
		
		return "answer";
	}
	
	@GetMapping("answerWrite")
	public String answerWrite(Model model, @RequestParam("QUE_NO") String queNo) {
		
		model.addAttribute("answerWrite", "answerWrite");
		model.addAttribute("QUE_NO", queNo);
		
		return "answerWrite";
	}
	
	@GetMapping("answerModify")
	public String answerModify(Model model, @RequestParam("ANS_NO") String ansNo, HttpServletRequest request) {
		
		model.addAttribute("answerModify", "answerModify");
		
		List<Member> answerlist = indexService.answer(ansNo);
		
		model.addAttribute("answerList", answerlist);
		
		return "answerWrite";
	}
	
	@PostMapping("answerChange")
	public String answerChange(@ModelAttribute("answerChange") Member answer, Model model) {
		
		MultipartFile answerImage = answer.getFileName();
		
		String rootDirectory = "C:/Users/Administrator/git/GNC/GNC/src/main/webapp/resources/images/";
		
		if (answerImage != null && !answerImage.isEmpty()) {
			try {
				String fname = answerImage.getOriginalFilename();
				
				answerImage.transferTo(new File(rootDirectory + fname));
				
				answer.setANS_IMAGE(fname);
			} catch (Exception e) {
				throw new RuntimeException("Answer Image saving failed", e);
			}
		}
		
		indexService.answerChange(answer);
		
		List<Member> answerlist = indexService.answer(answer.getANS_NO());
		
		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("MEM_NO", answer.getMEM_NO());
		
		return "redirect:/answer/myAnswer";
	}
	
	@PostMapping("answerInsert")
	public String answerInsert(@ModelAttribute("answerInsert") Member answer, Model model) {
		
		MultipartFile answerImage = answer.getFileName();
		
		String rootDirectory = "C:/Users/Administrator/git/GNC/GNC/src/main/webapp/resources/images/";
		
		if (answerImage != null && !answerImage.isEmpty()) {
			try {
				String fname = answerImage.getOriginalFilename();
				
				answerImage.transferTo(new File(rootDirectory + fname));
				
				answer.setANS_IMAGE(fname);
			} catch (Exception e) {
				throw new RuntimeException("Answer Image saving failed", e);
			}
		}
		
		indexService.answerInsert(answer);
		
		List<Member> answerlist = indexService.answer(answer.getANS_NO());
		
		model.addAttribute("answerList", answerlist);
		
		model.addAttribute("MEM_NO", answer.getMEM_NO());
		
		return "redirect:/answer/myAnswer";
	}

}