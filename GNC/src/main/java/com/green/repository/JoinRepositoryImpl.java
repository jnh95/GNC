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
		
		String phone1 = null;
		String phone2 = null;
		String phone3 = null;
		String phone4 = null;
		
		String birth1 = null;
		String birth2 = null;
		String birth3 = null;
		String birth4 = null;

		if (phone.length() == 11) {
			phone1 = phone.substring(0, 3);
			phone2 = phone.substring(3, 7);
			phone3 = phone.substring(7, 11);
			phone4 = phone1 + "-" + phone2 + "-" + phone3;
		}
		if (phone.length() == 10) {
			phone1 = phone.substring(0, 3);
			phone2 = phone.substring(3, 6);
			phone3 = phone.substring(6, 10);
			phone4 = phone1 + "-" + phone2 + "-" + phone3;
		}
		
		if (birth.length() == 8) {
			birth1 = birth.substring(0, 4);
			birth2 = birth.substring(4, 6);
			birth3 = birth.substring(6, 8);
			
			birth4 = birth1 + "-" + birth2 + "-" + birth3;
		}
		
		String SQL = "INSERT INTO MEMBER (MEM_NAME, MEM_ID, MEM_PW, MEM_DATE, MEM_PHONE, MEM_MAIL,"
				+ "MEM_ADD, MEM_BIRTH, LEV_NO)"
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?)";
		
		template.update(SQL, name, id, pw, date, phone4, mail, add, birth4, "2");
	}

}
