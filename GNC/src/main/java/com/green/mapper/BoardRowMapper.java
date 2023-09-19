package com.green.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.green.domain.Member;

public class BoardRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member board = new Member();
		
		board.setMEM_NO(rs.getString("MEM_NO"));
		board.setMEM_NAME(rs.getString("MEM_NAME"));
		board.setMEM_ID(rs.getString("MEM_ID"));
		board.setMEM_PW(rs.getString("MEM_PW"));
		board.setMEM_DATE(rs.getString("MEM_DATE"));
		board.setMEM_PHONE(rs.getString("MEM_PHONE"));
		board.setMEM_MAIL(rs.getString("MEM_MAIL"));
		board.setMEM_ADD(rs.getString("MEM_ADD"));
		board.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
		board.setLEV_NO(rs.getString("LEV_NO"));
		board.setBOA_NO(rs.getString("BOA_NO"));
		board.setBOA_TITLE(rs.getString("BOA_TITLE"));
		board.setBOA_CONTENT(rs.getString("BOA_CONTENT"));
		board.setBOA_DATE(rs.getString("BOA_DATE"));
		board.setBOA_IN(rs.getString("BOA_IN"));
		board.setBOA_IMAGE(rs.getString("BOA_IMAGE"));
		
		return board;
	}
}
