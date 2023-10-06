package com.green.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Member;
import com.green.repository.SearchRepository;

@Service
public class SearchServiceImpl implements SearchService {
	
	@Autowired
	private SearchRepository searchRepository;
	
	@Override
	public List<Member> blog(String bloContent) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = searchRepository.blog(bloContent);
		
		return blogList;
	}
	
	@Override
	public List<Member> blogIn(String bloIn) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = searchRepository.blogIn(bloIn);
		
		return blogList;
	}
	
	@Override
	public List<Member> blogTitle(String bloTitle) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = searchRepository.blogTitle(bloTitle);
		
		return blogList;
	}
	
	@Override
	public List<Member> blogContent(String bloContent) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();
		
		blogList = searchRepository.blogContent(bloContent);
		
		return blogList;
	}
	
	
	@Override
	public List<Member> question(String queContent) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = searchRepository.question(queContent);
		
		return questionList;
	}
	
	@Override
	public List<Member> questionIn(String queIn) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = searchRepository.questionIn(queIn);
		
		return questionList;
	}
	
	@Override
	public List<Member> questionTitle(String queTitle) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = searchRepository.questionTitle(queTitle);
		
		return questionList;
	}
	
	@Override
	public List<Member> questionContent(String queContent) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();
		
		questionList = searchRepository.questionContent(queContent);
		
		return questionList;
	}
	
	
	@Override
	public List<Member> answer(String ansContent) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = searchRepository.answer(ansContent);
		
		return answerList;
	}
	
	@Override
	public List<Member> answerIn(String ansIn) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = searchRepository.answerIn(ansIn);
		
		return answerList;
	}
	
	@Override
	public List<Member> answerTitle(String ansTitle) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = searchRepository.answerTitle(ansTitle);
		
		return answerList;
	}
	
	@Override
	public List<Member> answerContent(String ansContent) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();
		
		answerList = searchRepository.answerContent(ansContent);
		
		return answerList;
	}
	
}
