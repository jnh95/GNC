package com.green.repository;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class MypageRepositoryImpl implements MypageRepository {
	
	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}

	@Override
	public void pwChange(String id, String pw, String pw2, HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		if (rowCount != 0) {
			
			SQL = "UPDATE MEMBER SET MEM_PW = ? where MEM_ID = ? ";
			
			template.update(SQL, pw, id);
			session.removeAttribute("pwkey");
			session.setAttribute("pwkey", pw);
		}
	}

	@Override
	public void phoneChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idkey");
		String phone = request.getParameter("phone4");

		String phone1 = null;
		String phone2 = null;
		String phone3 = null;
		String phone4 = null;

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
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		if (rowCount != 0) {
			
			SQL = "UPDATE MEMBER SET MEM_PHONE = ? where MEM_ID = ? ";
			
			template.update(SQL, phone4, id);
			session.removeAttribute("phonekey");
			session.setAttribute("phonekey", phone4);
		}
	}

	@Override
	public void mailChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idkey");
		String mail = request.getParameter("mail4");
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		if (rowCount != 0) {
			
			SQL = "UPDATE MEMBER SET MEM_MAIL = ? where MEM_ID = ? ";
			
			template.update(SQL, mail, id);
			session.removeAttribute("mailkey");
			session.setAttribute("mailkey", mail);
		}
	}

	@Override
	public void birthChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idkey");
		String birth = request.getParameter("birth4");

		String birth1 = null;
		String birth2 = null;
		String birth3 = null;
		String birth4 = null;

		if (birth.length() == 8) {
			birth1 = birth.substring(0, 4);
			birth2 = birth.substring(4, 6);
			birth3 = birth.substring(6, 8);
			birth4 = birth1 + "-" + birth2 + "-" + birth3;
		}
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		if (rowCount != 0) {
			
			SQL = "UPDATE MEMBER SET MEM_BIRTH = ? where MEM_ID = ? ";
			
			template.update(SQL, birth4, id);
			session.removeAttribute("birthkey");
			session.setAttribute("birthkey", birth4);
		}
	}

	@Override
	public void addChange(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idkey");
		String add = request.getParameter("add4");
		
		String SQL = "SELECT count(*) FROM member where MEM_ID=?";

		int rowCount = template.queryForObject(SQL, Integer.class, id);
		
		if (rowCount != 0) {
			
			SQL = "UPDATE MEMBER SET MEM_ADD = ? where MEM_ID = ? ";
			
			template.update(SQL, add, id);
			session.removeAttribute("addkey");
			session.setAttribute("addkey", add);
		}
	}
	
	@Override
	public void delete(HttpServletRequest request) {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("idkey");
		
		session.invalidate();
		
		String SQL = "DELETE FROM member WHERE MEM_ID=?";
			
		template.update(SQL, id);
	}

}
