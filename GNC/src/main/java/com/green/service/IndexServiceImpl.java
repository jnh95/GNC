package com.green.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.green.domain.Member;
import com.green.repository.IndexRepository;

@Service
public class IndexServiceImpl implements IndexService {
	
	@Autowired
	private IndexRepository indexRepository;
	
	@Override
	public List<Member> board() {
		// TODO Auto-generated method stub
		
		return indexRepository.board();
	}

}
