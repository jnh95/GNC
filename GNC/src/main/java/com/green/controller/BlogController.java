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
	
	@GetMapping("myBlog")
	public String myBlog(Model model, @RequestParam("MEM_NO") String memNo) {
		
		model.addAttribute("myBlog", "myBlog");
		
		List<Member> bloglist = indexService.myBlog(memNo);
		
		model.addAttribute("blogList", bloglist);
		
		return "blog";
	}
	
	@GetMapping("blogWrite")
	public String blogWrite(Model model) {
		
		model.addAttribute("blogWrite", "blogWrite");
		
		return "blogWrite";
	}
	
	@GetMapping("blogModify")
	public String blogModify(Model model, @RequestParam("BLO_NO") String bloNo, HttpServletRequest request) {
		
		model.addAttribute("blogModify", "blogModify");
		
		List<Member> bloglist = indexService.blog(bloNo);
		
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
		
		indexService.blogChange(blog);
		
		List<Member> bloglist = indexService.blog(blog.getBLO_NO());
		
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
		
		indexService.blogInsert(blog);
		
		List<Member> bloglist = indexService.blog(blog.getBLO_NO());
		
		model.addAttribute("blogList", bloglist);
		
		model.addAttribute("MEM_NO", blog.getMEM_NO());
		
		return "redirect:/blog/myBlog";
	}

}