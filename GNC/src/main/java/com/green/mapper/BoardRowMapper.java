package com.green.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.green.domain.Member;

public class BoardRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member login = new Member();
		
//		login.setMEM_NO(rs.getString("MEM_NO"));
//		login.setMEM_NAME(rs.getString("MEM_NAME"));
//		login.setMEM_ID(rs.getString("MEM_ID"));
//		login.setMEM_PW(rs.getString("MEM_PW"));
//		login.setMEM_DATE(rs.getString("MEM_DATE"));
//		login.setMEM_PHONE(rs.getString("MEM_PHONE"));
//		login.setMEM_MAIL(rs.getString("MEM_MAIL"));
//		login.setMEM_ADD(rs.getString("MEM_ADD"));
//		login.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
//		login.setLEV_NO(rs.getString("LEV_NO"));
//		login.setBOA_NO(rs.getString("BOA_NO"));
//		login.setBOA_TITLE(rs.getString("BOA_TITLE"));
//		login.setBOA_CONTENT(rs.getString("BOA_CONTENT"));
//		login.setBOA_DATE(rs.getString("BOA_DATE"));
//		login.setBOA_IN(rs.getString("BOA_IN"));
//		login.setBOA_IMAGE(rs.getString("BOA_IMAGE"));
		
		login.setBOA_NO(rs.getString(1));
		login.setBOA_TITLE(rs.getString(2));
		login.setBOA_CONTENT(rs.getString(3));
		login.setBOA_DATE(rs.getString(4));
		login.setBOA_IN(rs.getString(5));
		login.setBOA_IMAGE(rs.getString(6));
		login.setMEM_NO(rs.getString(8));
		login.setMEM_NAME(rs.getString(9));
		login.setMEM_ID(rs.getString(10));
		login.setMEM_PW(rs.getString(11));
		login.setMEM_DATE(rs.getString(12));
		login.setMEM_PHONE(rs.getString(13));
		login.setMEM_MAIL(rs.getString(14));
		login.setMEM_ADD(rs.getString(15));
		login.setMEM_BIRTH(rs.getString(16));
		login.setLEV_NO(rs.getString(17));

		return login;
	}
}
