package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface BlogService {

	List<Member> blog();
	
	List<Member> blog(String bloNo);
	
	List<Member> myBlog(String memNo);
	
	void blogChange(Member blog);
	
	void blogInsert(Member blog);

	void blogIn(String bloNo);
	
}
