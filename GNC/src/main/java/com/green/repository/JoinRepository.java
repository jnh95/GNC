package com.green.repository;

import javax.servlet.http.HttpServletRequest;

public interface JoinRepository {
	
	int idCheck(HttpServletRequest request);
	
	void join(HttpServletRequest request);
}
