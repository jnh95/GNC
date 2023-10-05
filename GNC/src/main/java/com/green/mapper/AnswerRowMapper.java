package com.green.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.green.domain.Member;

public class AnswerRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member answer = new Member();
		
		answer.setMEM_NO(rs.getString("MEM_NO"));
		answer.setMEM_NAME(rs.getString("MEM_NAME"));
		answer.setMEM_ID(rs.getString("MEM_ID"));
		answer.setMEM_PW(rs.getString("MEM_PW"));
		answer.setMEM_DATE(rs.getString("MEM_DATE"));
		answer.setMEM_PHONE(rs.getString("MEM_PHONE"));
		answer.setMEM_MAIL(rs.getString("MEM_MAIL"));
		answer.setMEM_ADD(rs.getString("MEM_ADD"));
		answer.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
		answer.setLEV_NO(rs.getString("LEV_NO"));
		answer.setANS_NO(rs.getString("ANS_NO"));
		answer.setANS_TITLE(rs.getString("ANS_TITLE"));
		answer.setANS_CONTENT(rs.getString("ANS_CONTENT"));
		answer.setANS_DATE(rs.getString("ANS_DATE"));
		answer.setANS_IN(rs.getString("ANS_IN"));
		answer.setANS_IMAGE(rs.getString("ANS_IMAGE"));
		answer.setQUE_NO(rs.getString("QUE_NO"));
		
		return answer;
	}
	
}
