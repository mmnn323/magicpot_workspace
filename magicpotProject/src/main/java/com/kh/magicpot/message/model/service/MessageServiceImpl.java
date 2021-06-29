package com.kh.magicpot.message.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.message.model.dao.MessageDao;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MessageDao msgDao;
}
