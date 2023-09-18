package com.green.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.repository.JoinRepository;

@Service
public class JoinServiceImpl implements JoinService {
	
	@Autowired
	private JoinRepository joinRepository;
	
	@Override
	public int idCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		int idCheck = joinRepository.idCheck(request);
		
		return idCheck;
	}

	@Override
	public void join(HttpServletRequest request) {
		// TODO Auto-generated method stub
		joinRepository.join(request);
	}

}
