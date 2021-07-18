package com.kh.magicpot.address.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.address.dao.AddressListDAO;
import com.kh.magicpot.address.vo.AddressList;

@Service
public class AddressServiceImpl implements AddressService{

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AddressListDAO addressListDAO;
	
	@Override
	public int newAddress(AddressList a) {
		return addressListDAO.newAddress(sqlSession, a);
	}
	
	
}
