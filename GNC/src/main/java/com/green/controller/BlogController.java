package com.green.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.green.domain.Member;
import com.green.service.IndexService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Autowired
	private IndexService indexService;

	@GetMapping
	public String blog(Model model) {
		
		model.addAttribute("blog", "blog");
		
		List<Member> bloglist = indexService.blog();
		
		model.addAttribute("blogList", bloglist);
		
		return "blog";
	}
	
	@GetMapping("blogDetail")
	public String blogDetail(Model model, @RequestParam("BLO_NO") String bloNo) {
		
		model.addAttribute("blogDetail", "blogDetail");
		
		List<Member> bloglist = indexService.blog(bloNo);
		
		model.addAttribute("blogList", bloglist);
		model.addAttribute("bloNo", bloNo);
		
		return "blogDetail";
	}
	
}