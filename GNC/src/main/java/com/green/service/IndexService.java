package com.green.service;

import java.util.List;

import com.green.domain.Member;

public interface IndexService {

	List<Member> blog();
	
	List<Member> question();
	
	List<Member> answer();
	
}
