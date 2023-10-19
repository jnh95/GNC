package com.green.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Member;
import com.green.repository.AnswerRepository;

@Service
public class AnswerServiceImpl implements AnswerService {
	
	@Autowired
	private AnswerRepository answerRepository;
	
	@Override
	public List<Member> answer() {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = answerRepository.answer();
		
		return answerList;
	}
	
	@Override
	public List<Member> answer(String ansNo) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = answerRepository.answer(ansNo);
		
		return answerList;
	}
	
	@Override
	public List<Member> myAnswer(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = answerRepository.myAnswer(memNo);
		
		return answerList;
	}
	
	@Override
	public void answerChange(Member answer) {
		// TODO Auto-generated method stub
		
		answerRepository.answerChange(answer);
	}
	
	@Override
	public void answerInsert(Member answer) {
		// TODO Auto-generated method stub
		
		answerRepository.answerInsert(answer);
	}
	
	@Override
	public void answerIn(String ansNo) {
		// TODO Auto-generated method stub
		
		answerRepository.answerIn(ansNo);
	}
	
	@Override
	public void answerDelete(String ansNo) {
		// TODO Auto-generated method stub
		
		answerRepository.answerDelete(ansNo);
	}
}
