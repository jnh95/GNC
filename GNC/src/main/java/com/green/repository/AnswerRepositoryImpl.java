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
import com.green.mapper.AnswerRowMapper;

@Repository
public class AnswerRepositoryImpl implements AnswerRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	
	@Override
	public List<Member> answer() {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper());
		
		return answerList;
	}
	
	@Override
	public List<Member> answer(String ansNo) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=b.MEM_NO where ANS_NO = ?";

		answerList = template.query(SQL, new AnswerRowMapper(), ansNo);
		
		return answerList;
	}
	
	@Override
	public List<Member> myAnswer(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> answerList = new ArrayList<Member>();

		String SQL = "select * from answer a join member b ON a.MEM_NO=? AND b.mem_no=? ORDER BY ANS_NO DESC";

		answerList = template.query(SQL, new AnswerRowMapper(), memNo, memNo);
		
		return answerList;
	}
	
	@Override
	public void answerChange(Member answer) {
		// TODO Auto-generated method stub
		
		String title = answer.getANS_TITLE();
		String content = answer.getANS_CONTENT();
		String img = answer.getANS_IMAGE();
		String ansNo = answer.getANS_NO();
		
		String SQL = "UPDATE answer SET ANS_TITLE=?, ANS_CONTENT=?, ANS_IMAGE=? where ANS_NO=?";
		
		template.update(SQL, title, content, img, ansNo);
	}
	
	@Override
	public void answerInsert(Member answer) {
		// TODO Auto-generated method stub
		
		String title = answer.getANS_TITLE();
		String content = answer.getANS_CONTENT();
		String img = answer.getANS_IMAGE();
		String memNo = answer.getMEM_NO();
		String queNo = answer.getQUE_NO();
		String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		String SQL = "INSERT INTO answer (ANS_TITLE, ANS_CONTENT, ANS_DATE, ANS_IN, ANS_IMAGE, MEM_NO, QUE_NO)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?)";
		
		template.update(SQL, title, content, date, "0", img, memNo, queNo);
	}
	
	@Override
	public void answerIn(String ansNo) {
		// TODO Auto-generated method stub
		
		String SQL = "UPDATE answer SET ANS_IN=ANS_IN+1 where ANS_NO=?";
		
		template.update(SQL, ansNo);
	}
}
