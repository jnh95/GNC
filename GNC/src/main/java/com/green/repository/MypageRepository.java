package com.green.repository;

import javax.servlet.http.HttpServletRequest;

public interface MypageRepository {
	
	void pwChange(String id, String pw, String pw2, HttpServletRequest request);
	
	void phoneChange(HttpServletRequest request);
	
	void mailChange(HttpServletRequest request);
	
	void birthChange(HttpServletRequest request);
	
	void addChange(HttpServletRequest request);

	void delete(HttpServletRequest request);
}
