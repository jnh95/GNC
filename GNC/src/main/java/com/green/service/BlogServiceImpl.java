package com.green.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Member;
import com.green.repository.BlogRepository;

@Service
public class BlogServiceImpl implements BlogService {
	
	@Autowired
	private BlogRepository blogRepository;
	
	@Override
	public List<Member> blog() {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = blogRepository.blog();
		
		return blogList;
	}
	
	@Override
	public List<Member> blog(String bloNo) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = blogRepository.blog(bloNo);
		
		return blogList;
	}
	
	@Override
	public List<Member> myBlog(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = blogRepository.myBlog(memNo);
		
		return blogList;
	}
	
	@Override
	public void blogChange(Member blog) {
		// TODO Auto-generated method stub
		
		blogRepository.blogChange(blog);
	}
	
	@Override
	public void blogInsert(Member blog) {
		// TODO Auto-generated method stub
		
		blogRepository.blogInsert(blog);
	}
	
	@Override
	public void blogIn(String bloNo) {
		// TODO Auto-generated method stub
		
		blogRepository.blogIn(bloNo);
	}
	
	@Override
	public void blogDelete(String bloNo) {
		// TODO Auto-generated method stub
		
		blogRepository.blogDelete(bloNo);
	}
}
