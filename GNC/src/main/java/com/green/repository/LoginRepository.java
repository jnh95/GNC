package com.green.repository;

import javax.servlet.http.HttpServletRequest;

public interface LoginRepository {
	
	void Login(String id, String pw, HttpServletRequest request);
}
