package com.green.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.green.domain.Member;

public class BlogRowMapper implements RowMapper<Member> {

	public Member mapRow(ResultSet rs, int rowNum) throws SQLException {

		Member blog = new Member();
		
		blog.setMEM_NO(rs.getString("MEM_NO"));
		blog.setMEM_NAME(rs.getString("MEM_NAME"));
		blog.setMEM_ID(rs.getString("MEM_ID"));
		blog.setMEM_PW(rs.getString("MEM_PW"));
		blog.setMEM_DATE(rs.getString("MEM_DATE"));
		blog.setMEM_PHONE(rs.getString("MEM_PHONE"));
		blog.setMEM_MAIL(rs.getString("MEM_MAIL"));
		blog.setMEM_ADD(rs.getString("MEM_ADD"));
		blog.setMEM_BIRTH(rs.getString("MEM_BIRTH"));
		blog.setLEV_NO(rs.getString("LEV_NO"));
		blog.setBLO_NO(rs.getString("BLO_NO"));
		blog.setBLO_TITLE(rs.getString("BLO_TITLE"));
		blog.setBLO_CONTENT(rs.getString("BLO_CONTENT"));
		blog.setBLO_DATE(rs.getString("BLO_DATE"));
		blog.setBLO_IN(rs.getString("BLO_IN"));
		blog.setBLO_IMAGE(rs.getString("BLO_IMAGE"));
		
		return blog;
	}
}
