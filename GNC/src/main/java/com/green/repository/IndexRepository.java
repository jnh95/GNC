package com.green.repository;

import java.util.List;

import com.green.domain.Member;

public interface IndexRepository {
	
	List<Member> blog();
	
	List<Member> blog(String bloNo);
	
	List<Member> myBlog(String memNo);
	
	void blogChange(Member blog);
	
	void blogInsert(Member blog);
	
	List<Member> question();
	
	List<Member> question(String queNo);
	
	List<Member> myQuestion(String memNo);
	
	void questionChange(Member question);
	
	void questionInsert(Member question);
	
	List<Member> answer();
	
	List<Member> answer(String ansNo);
	
	List<Member> myAnswer(String memNo);
	
	void answerChange(Member answer);
	
	void answerInsert(Member answer);
}
