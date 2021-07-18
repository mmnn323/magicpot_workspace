package com.kh.magicpot.pay.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.pay.model.dao.PayDao;
import com.kh.magicpot.pay.model.vo.DetailPay;
import com.kh.magicpot.pay.model.vo.FundingDetail;
import com.kh.magicpot.pay.model.vo.FundingList;

import com.kh.magicpot.pay.model.vo.Pay;

@Service
public class PayServiceImpl implements PayService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private PayDao aDao;
	
	
	@Override 
	public int selectListCount() {

		return aDao.selectListCount(sqlSession);
	}


	@Override
	public ArrayList<Pay> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}


	@Override
	public DetailPay selectDetailPay(int memNo) {
		return aDao.selectDetailPay(sqlSession, memNo);
	}

	@Override
	public int ProjectReward(int rno) {
		return aDao.ProjectReward(sqlSession, rno);
	}

	
	@Override
	public ArrayList<FundingList> orderList(int rno) {
		return aDao.orderList(sqlSession, rno);
	}

	@Override
	public ArrayList<FundingDetail> selectDetail(int mno) {
		return aDao.selectDetail(sqlSession, mno);
	}








	







}
