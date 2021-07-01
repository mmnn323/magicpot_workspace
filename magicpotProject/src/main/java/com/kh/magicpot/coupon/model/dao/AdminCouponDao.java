package com.kh.magicpot.coupon.model.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.coupon.model.vo.Coupon;

@Repository
public class AdminCouponDao {
	
	public int insertCoupon(SqlSessionTemplate sqlSession, Coupon c) {
		return sqlSession.insert("couponMapper.insertCoupon", c);
	}

}
