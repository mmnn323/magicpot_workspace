package com.kh.magicpot.address.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.address.vo.AddressList;
import com.kh.magicpot.message.model.vo.Message;

@Repository
public class AddressListDAO {
	public int newAddress(SqlSessionTemplate sqlSession, AddressList addressList) {
		return sqlSession.insert("addressListMapper.newAddress", addressList);
	}
}

