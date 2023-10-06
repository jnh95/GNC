package com.green.repository;

import java.util.List;

import com.green.domain.Member;

public interface AnswerRepository {
	
	List<Member> answer();
	
	List<Member> answer(String ansNo);
	
	List<Member> myAnswer(String memNo);
	
	void answerChange(Member answer);
	
	void answerInsert(Member answer);
	
	void answerIn(String ansNo);
	
}
