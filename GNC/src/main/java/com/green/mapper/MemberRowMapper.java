package com.green.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.green.domain.Member;

public class MemberRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member login = new Member();
		
		login.setMEM_NO(rs.getString("MEM_NO"));
		login.setMEM_NAME(rs.getString("MEM_NAME"));
		login.setMEM_ID(rs.getString("MEM_ID"));
		login.setMEM_PW(rs.getString("MEM_PW"));
		login.setMEM_DATE(rs.getString("MEM_DATE"));
		login.setMEM_PHONE(rs.getString("MEM_PHONE"));
		login.setMEM_MAIL(rs.getString("MEM_MAIL"));
		login.setMEM_ADD(rs.getString("MEM_ADD"));
		login.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
		login.setLEV_NO(rs.getString("LEV_NO"));

		return login;
	}
}
