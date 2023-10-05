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
	public List<Member> blog(String bloNo) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=b.MEM_NO where BLO_NO = ?";

		blogList = template.query(SQL, new BlogRowMapper(), bloNo);
		
		return blogList;
	}
	
	@Override
	public List<Member> myBlog(String memNo) {
		// TODO Auto-generated method stub
		
		List<Member> blogList = new ArrayList<Member>();

		String SQL = "select * from blog a join member b ON a.MEM_NO=? AND b.mem_no=? ORDER BY BLO_NO DESC";

		blogList = template.query(SQL, new BlogRowMapper(), memNo, memNo);
		
		return blogList;
	}
	
	@Override
	public void blogChange(Member blog) {
		// TODO Auto-generated method stub
		
		String title = blog.getBLO_TITLE();
		String content = blog.getBLO_CONTENT();
		String img = blog.getBLO_IMAGE();
		String bloNo = blog.getBLO_NO();
		
		String SQL = "UPDATE blog SET BLO_TITLE=?, BLO_CONTENT=?, BLO_IMAGE=? where BLO_NO=?";
		
		template.update(SQL, title, content, img, bloNo);
	}
	
	@Override
	public void blogInsert(Member blog) {
		// TODO Auto-generated method stub
		
		String title = blog.getBLO_TITLE();
		String content = blog.getBLO_CONTENT();
		String img = blog.getBLO_IMAGE();
		String memNo = blog.getMEM_NO();
		String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		String SQL = "INSERT INTO blog (BLO_TITLE, BLO_CONTENT, BLO_DATE, BLO_IMAGE, MEM_NO)"
				+ "VALUES(?, ?, ?, ?, ?)";
		
		template.update(SQL, title, content, date, img, memNo);
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
		
		String SQL = "INSERT INTO question (QUE_TITLE, QUE_CONTENT, QUE_DATE, QUE_IMAGE, MEM_NO)"
				+ "VALUES(?, ?, ?, ?, ?)";
		
		template.update(SQL, title, content, date, img, memNo);
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
		
		String SQL = "INSERT INTO answer (ANS_TITLE, ANS_CONTENT, ANS_DATE, ANS_IMAGE, MEM_NO, QUE_NO)"
				+ "VALUES(?, ?, ?, ?, ?, ?)";
		
		template.update(SQL, title, content, date, img, memNo, queNo);
	}
}
