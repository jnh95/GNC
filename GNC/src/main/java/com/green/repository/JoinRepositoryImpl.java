package com.green.repository;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class JoinRepositoryImpl implements JoinRepository {
	
	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	@Override
	public int idCheck(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("idInput");
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		return rowCount;
	}

	@Override
	public void join(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		
		String name = request.getParameter("MEM_NAME");
		String id = request.getParameter("MEM_ID");
		String pw = request.getParameter("MEM_PWD");
		String date = LocalDateTime.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		String phone = request.getParameter("MEM_PHONE");
		String mail = request.getParameter("MEM_MAIL");
		String add = request.getParameter("MEM_ADD");
		String birth = request.getParameter("MEM_BIRTH");
		
		String SQL = "INSERT INTO MEMBER (MEM_NAME, MEM_ID, MEM_PW, MEM_DATE, MEM_PHONE, MEM_MAIL,"
				+ "MEM_ADD, MEM_BIRTH, LEV_NO)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		template.update(SQL, name, id, pw, date, phone, mail, add, birth, "2");
	}

}
