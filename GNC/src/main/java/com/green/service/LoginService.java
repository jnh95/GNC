package com.green.service;

import javax.servlet.http.HttpServletRequest;

public interface LoginService {
	
	void Login(String id, String pw, HttpServletRequest request);
}