package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface IndexService {

	List<Member> blog();
	
	List<Member> blog(String bloNo);
	
	List<Member> myBlog(String memNo);
	
	List<Member> question();
	
	List<Member> question(String queNo);
	
	List<Member> myQuestion(String memNo);
	
	List<Member> answer();
	
	List<Member> answer(String ansNo);
	
	List<Member> myAnswer(String memNo);
}
