package com.green.service;

import javax.servlet.http.HttpServletRequest;

public interface JoinService {
	
	int idCheck(HttpServletRequest request);
	
	void join(HttpServletRequest request);
}
