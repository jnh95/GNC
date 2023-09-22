package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface IndexService {

	List<Member> blog();
	
	List<Member> blog(String bloNo);
	
	List<Member> question();
	
	List<Member> question(String queNo);
	
	List<Member> answer();
	
	List<Member> answer(String ansNo);
}
