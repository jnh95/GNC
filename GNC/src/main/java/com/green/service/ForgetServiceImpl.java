package com.green.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.repository.ForgetRepository;

@Service
public class ForgetServiceImpl implements ForgetService {
	
	@Autowired
	private ForgetRepository forgetRepository;

	@Override
	public void pwChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		forgetRepository.pwChange(request);
	}

}
