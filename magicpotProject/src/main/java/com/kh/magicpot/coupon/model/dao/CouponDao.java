package com.kh.magicpot.coupon.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.coupon.model.vo.Coupon;

@Repository
public class CouponDao {
	
	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.insert("couponMapper.insertCoupon", c);
	}

	public ArrayList<Coupon> selectCoupon(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("couponMapper.selectCoupon");
	}
	
	
	public int deleteCoupon(SqlSessionTemplate sqlSession, int cpNo) {
		return sqlSession.update("couponMapper.deleteCoupon", cpNo);
	}
}
