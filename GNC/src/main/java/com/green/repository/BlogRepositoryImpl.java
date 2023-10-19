package com.green.repository;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.green.domain.Member;
import com.green.mapper.BlogRowMapper;

@Repository
public class BlogRepositoryImpl implements BlogRepository {

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
		
		String SQL = "INSERT INTO blog (BLO_TITLE, BLO_CONTENT, BLO_DATE, BLO_IN, BLO_IMAGE, MEM_NO)"
				+ "VALUES(?, ?, ?, ?, ?, ?)";
		
		template.update(SQL, title, content, date, "0" , img, memNo);
	}
	
	@Override
	public void blogIn(String bloNo) {
		// TODO Auto-generated method stub
		
		String SQL = "UPDATE blog SET BLO_IN=BLO_IN+1 where BLO_NO=?";
		
		template.update(SQL, bloNo);
	}
	
	@Override
	public void blogDelete(String bloNo) {
		// TODO Auto-generated method stub
		
		String SQL = "DELETE FROM blog WHERE BLO_NO=?";
			
		template.update(SQL, bloNo);
	}
}
