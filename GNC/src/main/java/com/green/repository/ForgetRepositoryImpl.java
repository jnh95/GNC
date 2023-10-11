package com.green.repository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ForgetRepositoryImpl implements ForgetRepository {
	
	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	@Override
	public void pwChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String id = request.getParameter("MEM_ID");
		String pw = request.getParameter("MEM_PW");
		String mail = request.getParameter("MEM_MAIL");
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=? and MEM_MAIL = ?";

		int rowCount = template.queryForObject(SQL, Integer.class, id, mail);
		
		if (rowCount != 0) {
			
			SQL = "UPDATE MEMBER SET MEM_PW = ? where MEM_ID = ?";
			
			template.update(SQL, pw, id);
			session.removeAttribute("pwkey");
			session.setAttribute("pwkey", pw);
		}

	}
}
