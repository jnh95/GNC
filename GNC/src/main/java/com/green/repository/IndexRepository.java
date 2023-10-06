package com.green.repository;

import java.util.List;

import com.green.domain.Member;

public interface IndexRepository {
	
	List<Member> blog();
	
	List<Member> question();
	
	List<Member> answer();
	
}
