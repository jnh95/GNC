package com.green.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.green.domain.Member;
import com.green.mapper.AnswerRowMapper;
import com.green.mapper.BlogRowMapper;
import com.green.mapper.QuestionRowMapper;

@Repository
public class SearchRepositoryImpl implements SearchRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	

	@Override
	public List<Member> blog(String bloContent) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_CONTENT LIKE '%"+bloContent+"%' ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());
		
		return blogList;
	}
	
	@Override
	public List<Member> blogIn(String bloIn) {
		// TODO Auto-generated method stub
		List<Member> blogList = new ArrayList<Member>();
		
		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_CONTENT LIKE '%"+bloIn+"%' ORDER BY BLO_IN DESC";

		blogList = template.query(SQL, new BlogRowMapper());
		
		return blogList;
	}
	
	@Override
	public List<Member> blogTitle(String bloTitle) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_TITLE LIKE '%"+bloTitle+"%' ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());
		
		return blogList;
	}
	
	@Override
	public List<Member> blogContent(String bloContent) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO WHERE BLO_CONTENT LIKE '%"+bloContent+"%' or BLO_TITLE LIKE '%"+bloContent+"%' ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());
		
		return blogList;
	}
	
	
	@Override
	public List<Member> question(String queContent) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_CONTENT LIKE '%"+queContent+"%' ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());
		
		return questionList;
	}
	
	@Override
	public List<Member> questionIn(String queIn) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_CONTENT LIKE '%"+queIn+"%' ORDER BY QUE_IN DESC";

		questionList = template.query(SQL, new QuestionRowMapper());
		
		return questionList;
	}
	
	@Override
	public List<Member> questionTitle(String queTitle) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_TITLE LIKE '%"+queTitle+"%' ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());
		
		return questionList;
	}
	
	@Override
	public List<Member> questionContent(String queContent) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO WHERE QUE_CONTENT LIKE '%"+queContent+"%' or QUE_TITLE LIKE '%"+queContent+"%' ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());
		
		return questionList;
	}
	
	
	@Override
	public List<Member> answer(String ansContent) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_CONTENT LIKE '%"+ansContent+"%' ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());
		
		return answerList;
	}
	
	@Override
	public List<Member> answerIn(String ansIn) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_CONTENT LIKE '%"+ansIn+"%' ORDER BY ANS_IN DESC";

		answerList = template.query(SQL, new AnswerRowMapper());
		
		return answerList;
	}
	
	@Override
	public List<Member> answerTitle(String ansTitle) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_TITLE LIKE '%"+ansTitle+"%' ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());
		
		return answerList;
	}
	
	@Override
	public List<Member> answerContent(String ansContent) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO WHERE ANS_CONTENT LIKE '%"+ansContent+"%' or ANS_TITLE LIKE '%"+ansContent+"%' ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());
		
		return answerList;
	}
}
