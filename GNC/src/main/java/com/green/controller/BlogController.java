package com.green.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
import com.green.service.BlogService;

@Controller
@RequestMapping("/blog")
public class BlogController {
	
	@Autowired
	private BlogService blogService;

	@GetMapping
	public String blog(Model model) {
		
		model.addAttribute("blog", "blog");
		
		List<Member> bloglist = blogService.blog();
		
		model.addAttribute("blogList", bloglist);
		
		return "blog";
	}
	
	@GetMapping("blogBoard")
	public String blogBoard(Model model, @RequestParam("end") String end) {
		
		model.addAttribute("blog", "blog");
		
		List<Member> bloglist = blogService.blog();
		
		model.addAttribute("blogList", bloglist);
		model.addAttribute("end", end);
		
		return "blog";
	}
	
	@GetMapping("myBlogBoard")
	public String myBlogBoard(Model model, @RequestParam("end") String end, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myBlog", "myBlog");
		
		List<Member> bloglist = blogService.myBlog(memNo);
		
		model.addAttribute("blogList", bloglist);
		model.addAttribute("end", end);
		
		return "blog";
	}
	
	@GetMapping("myBlog")
	public String myBlog(Model model, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myBlog", "myBlog");
		
		List<Member> bloglist = blogService.myBlog(memNo);
		
		model.addAttribute("blogList", bloglist);
		
		return "blog";
	}
	
	@GetMapping("blogDetail")
	public String blogDetail(Model model, @RequestParam("BLO_NO") String bloNo) {
		
		model.addAttribute("blogDetail", "blogDetail");
		
		blogService.blogIn(bloNo);
		
		List<Member> bloglist = blogService.blog(bloNo);
		
		model.addAttribute("blogList", bloglist);
		model.addAttribute("bloNo", bloNo);
		
		return "blogDetail";
	}
	
	@GetMapping("blogWrite")
	public String blogWrite(Model model) {
		
		model.addAttribute("blogWrite", "blogWrite");
		
		return "blogWrite";
	}
	
	@GetMapping("blogModify")
	public String blogModify(Model model, @RequestParam("BLO_NO") String bloNo, HttpServletRequest request) {
		
		model.addAttribute("blogModify", "blogModify");
		
		List<Member> bloglist = blogService.blog(bloNo);
		
		model.addAttribute("blogList", bloglist);
		
		return "blogWrite";
	}
	
	@PostMapping("blogChange")
	public String blogChange(@ModelAttribute("blogChange") Member blog, Model model) {
		
		MultipartFile blogImage = blog.getFileName();
		
		String rootDirectory = "C:/Users/Administrator/git/GNC/GNC/src/main/webapp/resources/images/";
		
		if (blogImage != null && !blogImage.isEmpty()) {
			try {
				String fname = blogImage.getOriginalFilename();
				
				blogImage.transferTo(new File(rootDirectory + fname));
				
				blog.setBLO_IMAGE(fname);
			} catch (Exception e) {
				throw new RuntimeException("Blog Image saving failed", e);
			}
		}
		
		blogService.blogChange(blog);
		
		List<Member> bloglist = blogService.blog(blog.getBLO_NO());
		
		model.addAttribute("blogList", bloglist);
		
		model.addAttribute("MEM_NO", blog.getMEM_NO());
		
		return "redirect:/blog/myBlog";
	}
	
	@PostMapping("blogInsert")
	public String blogInsert(@ModelAttribute("blogInsert") Member blog, Model model) {
		
		MultipartFile blogImage = blog.getFileName();
		
		String rootDirectory = "C:/Users/Administrator/git/GNC/GNC/src/main/webapp/resources/images/";
		
		if (blogImage != null && !blogImage.isEmpty()) {
			try {
				String fname = blogImage.getOriginalFilename();
				
				blogImage.transferTo(new File(rootDirectory + fname));
				
				blog.setBLO_IMAGE(fname);
			} catch (Exception e) {
				throw new RuntimeException("Blog Image saving failed", e);
			}
		}
		
		blogService.blogInsert(blog);
		
		List<Member> bloglist = blogService.blog(blog.getBLO_NO());
		
		model.addAttribute("blogList", bloglist);
		
		model.addAttribute("MEM_NO", blog.getMEM_NO());
		
		return "redirect:/blog/myBlog";
	}
	
	@PostMapping("blogDelete")
	public String blogDelete(Model model, @RequestParam("BLO_NO") String bloNo, HttpServletRequest request) {
		
		blogService.blogDelete(bloNo);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("blogDelete", "blogDelete");
		
		return "redirect:/blog";
	}
	
	@PostMapping("myBlogDelete")
	public String myAnswerDelete(Model model, @RequestParam("BLO_NO") String bloNo, @RequestParam("MEM_NO") String memNo, HttpServletRequest request) {
		
		blogService.blogDelete(bloNo);
		
		model.addAttribute("MEM_NO", memNo);
		
		HttpSession session = request.getSession();
		
		session.setAttribute("blogDelete", "blogDelete");
		
		return "redirect:/blog/myBlog";
	}

}