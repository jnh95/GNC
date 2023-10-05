package com.green.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.green.domain.Member;

public class QuestionRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member queston = new Member();
		
		queston.setMEM_NO(rs.getString("MEM_NO"));
		queston.setMEM_NAME(rs.getString("MEM_NAME"));
		queston.setMEM_ID(rs.getString("MEM_ID"));
		queston.setMEM_PW(rs.getString("MEM_PW"));
		queston.setMEM_DATE(rs.getString("MEM_DATE"));
		queston.setMEM_PHONE(rs.getString("MEM_PHONE"));
		queston.setMEM_MAIL(rs.getString("MEM_MAIL"));
		queston.setMEM_ADD(rs.getString("MEM_ADD"));
		queston.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
		queston.setLEV_NO(rs.getString("LEV_NO"));
		queston.setQUE_NO(rs.getString("QUE_NO"));
		queston.setQUE_TITLE(rs.getString("QUE_TITLE"));
		queston.setQUE_CONTENT(rs.getString("QUE_CONTENT"));
		queston.setQUE_DATE(rs.getString("QUE_DATE"));
		queston.setQUE_IN(rs.getString("QUE_IN"));
		queston.setQUE_IMAGE(rs.getString("QUE_IMAGE"));
		
		return queston;
	}
	
}
