package com.green.repository;

import java.util.List;

import com.green.domain.Member;

public interface BlogRepository {
	
	List<Member> blog();
	
	List<Member> blog(String bloNo);
	
	List<Member> myBlog(String memNo);
	
	void blogChange(Member blog);
	
	void blogInsert(Member blog);

	void blogIn(String bloNo);
	
}
