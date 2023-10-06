package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface AnswerService {
	
	List<Member> answer();
	
	List<Member> answer(String ansNo);
	
	List<Member> myAnswer(String memNo);
	
	void answerChange(Member answer);
	
	void answerInsert(Member answer);
	
	void answerIn(String ansNo);
	
}
