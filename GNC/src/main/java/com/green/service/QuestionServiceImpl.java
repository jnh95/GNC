package com.green.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Member;
import com.green.repository.QuestionRepository;

@Service
public class QuestionServiceImpl implements QuestionService {
	
	@Autowired
	private QuestionRepository questionRepository;
	
	@Override
	public List<Member> question() {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = questionRepository.question();
		
		return questionList;
	}
	
	@Override
	public List<Member> question(String queNo) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = questionRepository.question(queNo);
		
		return questionList;
	}
	
	@Override
	public List<Member> myQuestion(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = questionRepository.myQuestion(memNo);
		
		return questionList;
	}
	
	@Override
	public void questionChange(Member question) {
		// TODO Auto-generated method stub
		
		questionRepository.questionChange(question);
	}
	
	@Override
	public void questionInsert(Member question) {
		// TODO Auto-generated method stub
		
		questionRepository.questionInsert(question);
	}
	
	@Override
	public void questionIn(String queNo) {
		// TODO Auto-generated method stub
		
		questionRepository.questionIn(queNo);
	}
	
	@Override
	public void questionDelete(String queNo) {
		// TODO Auto-generated method stub
		
		questionRepository.questionDelete(queNo);
	}
}
