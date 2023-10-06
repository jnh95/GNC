package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface QuestionService {

	List<Member> question();
	
	List<Member> question(String queNo);
	
	List<Member> myQuestion(String memNo);
	
	void questionChange(Member question);
	
	void questionInsert(Member question);
	
	void questionIn(String queNo);
	
}
