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
import com.green.service.QuestionService;

@Controller
@RequestMapping("/question")
public class QuestionController {
	
	@Autowired
	private QuestionService questionService;

	@GetMapping
	public String question(Model model) {
		
		List<Member> questionlist = questionService.question();

		model.addAttribute("questionList", questionlist);
		
		model.addAttribute("question", "question");
		
		return "question";
	}
	
	@GetMapping("questionBoard")
	public String questionBoard(Model model, @RequestParam("end") String end) {
		
		model.addAttribute("question", "question");
		
		List<Member> questionlist = questionService.question();
		
		model.addAttribute("questionList", questionlist);
		model.addAttribute("end", end);
		
		return "question";
	}
	
	@GetMapping("myQuestionBoard")
	public String myQuestionBoard(Model model, @RequestParam("end") String end, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myQuestion", "myQuestion");
		
		List<Member> questionlist = questionService.myQuestion(memNo);
		
		model.addAttribute("questionList", questionlist);
		model.addAttribute("end", end);
		
		return "question";
	}
	
	@GetMapping("questionDetail")
	public String questionDetail(Model model, @RequestParam("QUE_NO") String queNo) {
		
		model.addAttribute("questionDetail", "questionDetail");
		
		questionService.questionIn(queNo);
		
		List<Member> questionlist = questionService.question(queNo);
		
		model.addAttribute("questionList", questionlist);
		model.addAttribute("queNo", queNo);
		
		return "questionDetail";
	}
	
	@GetMapping("myQuestion")
	public String myQuestion(Model model, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myQuestion", "myQuestion");
		
		List<Member> questionlist = questionService.myQuestion(memNo);
		
		model.addAttribute("questionList", questionlist);
		return "question";
	}
	
	@GetMapping("questionWrite")
	public String questionWrite(Model model) {
		
		model.addAttribute("questionWrite", "questionWrite");
		
		return "questionWrite";
	}
	
	@GetMapping("questionModify")
	public String questionModify(Model model, @RequestParam("QUE_NO") String queNo, HttpServletRequest request) {
		
		model.addAttribute("questionModify", "questionModify");
		
		List<Member> questionlist = questionService.question(queNo);
		
		model.addAttribute("questionList", questionlist);
		
		return "questionWrite";
	}
	
	@PostMapping("questionChange")
	public String questionChange(@ModelAttribute("questionChange") Member question, Model model) {
		
		MultipartFile questionImage = question.getFileName();
		
		String rootDirectory = "C:/Users/Administrator/git/GNC/GNC/src/main/webapp/resources/images/";
		
		if (questionImage != null && !questionImage.isEmpty()) {
			try {
				String fname = questionImage.getOriginalFilename();
				
				questionImage.transferTo(new File(rootDirectory + fname));
				
				question.setQUE_IMAGE(fname);
			} catch (Exception e) {
				throw new RuntimeException("Question Image saving failed", e);
			}
		}
		
		questionService.questionChange(question);
		
		List<Member> questionlist = questionService.question(question.getQUE_NO());
		
		model.addAttribute("questionList", questionlist);
		
		model.addAttribute("MEM_NO", question.getMEM_NO());
		
		return "redirect:/question/myQuestion";
	}
	
	@PostMapping("questionInsert")
	public String questionInsert(@ModelAttribute("questionInsert") Member question, Model model) {
		
		MultipartFile questionImage = question.getFileName();
		
		String rootDirectory = "C:/Users/Administrator/git/GNC/GNC/src/main/webapp/resources/images/";
		
		if (questionImage != null && !questionImage.isEmpty()) {
			try {
				String fname = questionImage.getOriginalFilename();
				
				questionImage.transferTo(new File(rootDirectory + fname));
				
				question.setQUE_IMAGE(fname);
			} catch (Exception e) {
				throw new RuntimeException("Question Image saving failed", e);
			}
		}
		
		questionService.questionInsert(question);
		
		List<Member> questionlist = questionService.question(question.getQUE_NO());
		
		model.addAttribute("questionList", questionlist);
		
		model.addAttribute("MEM_NO", question.getMEM_NO());
		
		return "redirect:/question/myQuestion";
	}
	
}