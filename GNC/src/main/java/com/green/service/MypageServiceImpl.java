package com.green.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.repository.MypageRepository;

@Service
public class MypageServiceImpl implements MypageService {
	
	@Autowired
	private MypageRepository mypageRepository;

	@Override
	public void pwChange(String id, String pw, String pw2, HttpServletRequest request) {
		// TODO Auto-generated method stub
		mypageRepository.pwChange(id, pw, pw2, request);

	}

	@Override
	public void phoneChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		mypageRepository.phoneChange(request);

	}

	@Override
	public void mailChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		mypageRepository.mailChange(request);

	}

	@Override
	public void birthChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		mypageRepository.birthChange(request);

	}

	@Override
	public void addChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		mypageRepository.addChange(request);

	}
	
	@Override
	public void delete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		mypageRepository.delete(request);

	}

}
