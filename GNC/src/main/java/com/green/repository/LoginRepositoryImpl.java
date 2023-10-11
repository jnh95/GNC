package com.green.repository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.green.domain.Member;
import com.green.mapper.MemberRowMapper;

@Repository
public class LoginRepositoryImpl implements LoginRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	@Override
	public void Login(String id, String pw, HttpServletRequest request) {
		// TODO Auto-generated method stub

		HttpSession session = request.getSession();
		
		Member login = new Member();

		String SQL = "SELECT count(*) FROM member where MEM_ID=? and MEM_PW=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id, pw);

		if (rowCount != 0) {
			
			SQL = "SELECT * from member where MEM_ID=? and MEM_PW=?";

			login = template.queryForObject(SQL, new MemberRowMapper(), id, pw);

			if (login != null) {
				session.removeAttribute("pwkey");
				
				session.setAttribute("nokey", login.getMEM_NO());
				session.setAttribute("namekey", login.getMEM_NAME());
				session.setAttribute("idkey", login.getMEM_ID());
				session.setAttribute("pwkey", login.getMEM_PW());
				session.setAttribute("datekey", login.getMEM_DATE());
				session.setAttribute("phonekey", login.getMEM_PHONE());
				session.setAttribute("mailkey", login.getMEM_MAIL());
				session.setAttribute("addkey", login.getMEM_ADD());
				session.setAttribute("birthkey", login.getMEM_BIRTH());
				session.setAttribute("lenokey", login.getLEV_NO());
				
				session.setAttribute("loginSuccess", "loginSuccess");
			}				
		} else {
			session.setAttribute("loginFailed", "loginFailed");
		}
	}

}
