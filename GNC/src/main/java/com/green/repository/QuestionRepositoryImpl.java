package com.green.repository;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.green.domain.Member;
import com.green.mapper.QuestionRowMapper;

@Repository
public class QuestionRepositoryImpl implements QuestionRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
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
	public List<Member> question(String queNo) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=b.MEM_NO where QUE_NO = ?";

		questionList = template.query(SQL, new QuestionRowMapper(), queNo);
		
		return questionList;
	}
	
	@Override
	public List<Member> myQuestion(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> questionList = new ArrayList<Member>();

		String SQL = "select * from question a join member b ON a.MEM_NO=? AND b.mem_no=? ORDER BY QUE_NO DESC";

		questionList = template.query(SQL, new QuestionRowMapper(), memNo, memNo);
		
		return questionList;
	}
	
	@Override
	public void questionChange(Member question) {
		// TODO Auto-generated method stub
		
		String title = question.getQUE_TITLE();
		String content = question.getQUE_CONTENT();
		String img = question.getQUE_IMAGE();
		String queNo = question.getQUE_NO();
		
		String SQL = "UPDATE question SET QUE_TITLE=?, QUE_CONTENT=?, QUE_IMAGE=? where QUE_NO=?";
		
		template.update(SQL, title, content, img, queNo);
	}
	
	@Override
	public void questionInsert(Member question) {
		// TODO Auto-generated method stub
		
		String title = question.getQUE_TITLE();
		String content = question.getQUE_CONTENT();
		String img = question.getQUE_IMAGE();
		String memNo = question.getMEM_NO();
		String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		String SQL = "INSERT INTO question (QUE_TITLE, QUE_CONTENT, QUE_DATE, QUE_IN, QUE_IMAGE, MEM_NO)"
				+ "VALUES(?, ?, ?, ?, ?, ?)";
		
		template.update(SQL, title, content, date, "0", img, memNo);
	}
	
	@Override
	public void questionIn(String queNo) {
		// TODO Auto-generated method stub
		
		String SQL = "UPDATE question SET QUE_IN=QUE_IN+1 where QUE_NO=?";
		
		template.update(SQL, queNo);
	}
	
}
