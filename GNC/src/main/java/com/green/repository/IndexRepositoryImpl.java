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
public class IndexRepositoryImpl implements IndexRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	

	@Override
	public List<Member> blog() {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper());
		
		return blogList;
	}
	
	@Override
	public List<Member> question() {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper());
		
		return questionList;
	}
	
	@Override
	public List<Member> answer() {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());
		
		return answerList;
	}
}
