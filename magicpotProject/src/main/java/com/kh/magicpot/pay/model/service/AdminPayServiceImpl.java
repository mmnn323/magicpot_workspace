package com.kh.magicpot.pay.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.pay.model.dao.AdminPayDao;
import com.kh.magicpot.pay.model.vo.AdminPay;

@Service
public class AdminPayServiceImpl implements AdminPayService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private AdminPayDao aDao;
	
	
	@Override
	public int selectListCount() {

		return aDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<AdminPay> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}

	@Override
	public int updateAdminPay(AdminPay a) {
		// TODO Auto-generated method stub
		return 0;
	}


	@Override
	public AdminPay PaySelect(int memNo) {
		// TODO Auto-generated method stub
		return null;
	}





}
