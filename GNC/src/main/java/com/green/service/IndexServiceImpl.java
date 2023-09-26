package com.green.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Member;
import com.green.repository.IndexRepository;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexRepository indexRepository;
	
	@Override
	public List<Member> blog() {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = indexRepository.blog();
		
		return blogList;
	}
	
	@Override
	public List<Member> blog(String bloNo) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = indexRepository.blog(bloNo);
		
		return blogList;
	}
	
	@Override
	public List<Member> myBlog(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = indexRepository.blog(memNo);
		
		return blogList;
	}
	
	@Override
	public List<Member> question() {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = indexRepository.question();
		
		return questionList;
	}
	
	@Override
	public List<Member> question(String queNo) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = indexRepository.question(queNo);
		
		return questionList;
	}
	
	@Override
	public List<Member> myQuestion(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = indexRepository.question(memNo);
		
		return questionList;
	}
	
	@Override
	public List<Member> answer() {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = indexRepository.answer();
		
		return answerList;
	}
	
	@Override
	public List<Member> answer(String ansNo) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = indexRepository.answer(ansNo);
		
		return answerList;
	}
	
	@Override
	public List<Member> myAnswer(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = indexRepository.answer(memNo);
		
		return answerList;
	}

}
