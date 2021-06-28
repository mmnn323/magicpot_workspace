package com.kh.magicpot.guide.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.guide.model.dao.GuideDao;

@Service
public class GuideServiceImpl implements GuideService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private GuideDao gDao;
	
	
	
}
