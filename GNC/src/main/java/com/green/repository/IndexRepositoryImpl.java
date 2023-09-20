package com.green.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.green.domain.Member;
import com.green.mapper.BoardRowMapper;

@Repository
public class IndexRepositoryImpl implements IndexRepository {

	private JdbcTemplate template;

	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	

	@Override
	public List<Member> board() {
		// TODO Auto-generated method stub
		
		List<Member> boardList = new ArrayList<Member>();

		String SQL = "select * from board a join member b ON a.MEM_NO=b.MEM_NO ORDER BY BOA_NO DESC limit 4";

		boardList = template.query(SQL, new BoardRowMapper());
		
		return boardList;

	}

}
