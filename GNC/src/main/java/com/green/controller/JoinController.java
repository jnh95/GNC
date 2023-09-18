package com.green.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.green.service.JoinService;

@Controller
@RequestMapping("/join")
public class JoinController {

	@Autowired
	private JoinService joinService;

	@GetMapping
	public String join(Model model) {
		return "join";
	}

	@PostMapping
	public String join(HttpServletRequest request) {

		int idCheck = joinService.idCheck(request);

		if (idCheck == 0) {

			joinService.join(request);

			return "redirect:/";
		}

		return "redirect:/join";
	}

	@GetMapping("/idCheck")
	public String idCheck(HttpServletRequest request, Model model) {

		int idCheck = joinService.idCheck(request);

		String id = request.getParameter("idInput");
		String name = request.getParameter("nameInput");
		String pwd = request.getParameter("pwdInput");
		String pwd2 = request.getParameter("pwd2Input");
		String phone = request.getParameter("phoneInput");
		String mail = request.getParameter("mailInput");
		String add = request.getParameter("addInput");
		String birth = request.getParameter("birthInput");
		
		model.addAttribute("useName", name);

		model.addAttribute("usePwd", pwd);

		model.addAttribute("usePwd2", pwd2);

		model.addAttribute("usePhone", phone);

		model.addAttribute("useMail", mail);

		model.addAttribute("useAdd", add);

		model.addAttribute("useBirth", birth);

		if (idCheck == 0) {
			model.addAttribute("useId", id);
			model.addAttribute("existId", "");

			return "join";
		}

		model.addAttribute("useId", "");
		model.addAttribute("existId", "exist");

		return "join";
	}
}