package com.green.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.repository.LoginRepository;

@Service
public class LoginServiceImpl implements LoginService {
	
	@Autowired
	private LoginRepository loginRepository;

	@Override
	public void Login(String id, String pw, HttpServletRequest request) {
		// TODO Auto-generated method stub
		loginRepository.Login(id, pw, request);
	}

}
