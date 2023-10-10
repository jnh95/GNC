package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface SearchService {

	String engToKor(String eng);
	
	List<Member> blog(String bloContent);

	List<Member> blogIn(String bloIn);
	
	List<Member> blogTitle(String blotitle);

	List<Member> blogContent(String bloContent);
	
	
	List<Member> question(String queContent);

	List<Member> questionIn(String queIn);
	
	List<Member> questionTitle(String quetitle);

	List<Member> questionContent(String queContent);
	
	
	List<Member> answer(String ansContent);

	List<Member> answerIn(String ansIn);
	
	List<Member> answerTitle(String anstitle);

	List<Member> answerContent(String ansContent);
	
}
