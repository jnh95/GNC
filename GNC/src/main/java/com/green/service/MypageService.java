package com.green.service;

import javax.servlet.http.HttpServletRequest;

public interface MypageService {
	
	void pwChange(String id, String pw, String pw2, HttpServletRequest request);
	
	void phoneChange(HttpServletRequest request);
	
	void mailChange(HttpServletRequest request);
	
	void birthChange(HttpServletRequest request);
	
	void addChange(HttpServletRequest request);
	
	void delete(HttpServletRequest request);
}
