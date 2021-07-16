package com.kh.magicpot.coupon.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.coupon.model.dao.CouponDao;
import com.kh.magicpot.coupon.model.vo.Coupon;

@Service
public class CouponImpl implements CouponService {

	@Autowired
	private SqlSessionTemplate sqlSession;

	@Autowired
	private CouponDao cDao;

	@Override
	public int insertCoupon(Coupon c) {
		int result = cDao.insertCoupon(sqlSession, c);
		return result;
	}

	@Override
	public ArrayList<Coupon> selectCoupon() {
		return cDao.selectCoupon(sqlSession);
	}

	@Override
	public int deleteCoupon(int cpNo) {
		return cDao.deleteCoupon(sqlSession, cpNo);
	}

}