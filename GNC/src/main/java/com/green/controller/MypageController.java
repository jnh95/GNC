package com.green.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.service.MypageService;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/mypage")
public class MypageController {
	/**
	 * Simply selects the home view to render by returning its name.
	 */

	@Autowired
	private MypageService mypageService;

	@GetMapping
	public String mypage(Model model) {
		return "mypage";
	}

	@PostMapping("/pw")
	public String pwChange(HttpServletRequest request) {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idkey");
		String pw = request.getParameter("pw4");
		String pw2 = request.getParameter("pw5");

		mypageService.pwChange(id, pw, pw2, request);

		return "redirect:/mypage";
	}

	@PostMapping("/phone")
	public String phoneChange(@RequestParam("phone4") String phone, HttpServletRequest request) {

		mypageService.phoneChange(request);
		return "redirect:/mypage";
	}

	@PostMapping("/mail")
	public String mailChange(HttpServletRequest request) {
		mypageService.mailChange(request);

		return "redirect:/mypage";
	}

	@PostMapping("/birth")
	public String birthChange(@RequestParam("birth4") String birth, HttpServletRequest request) {

		mypageService.birthChange(request);

		return "redirect:/mypage";
	}

	@PostMapping("/add")
	public String addChange(@RequestParam("add4") String add, HttpServletRequest request) {

		mypageService.addChange(request);

		return "redirect:/mypage";
	}
	
	@PostMapping("/delete")
	public String mypageDelete(Model model, HttpServletRequest request) {
		
		mypageService.delete(request);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("delete", "delete");
		
		return "redirect:/";
	}
}