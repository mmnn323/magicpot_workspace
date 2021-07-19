package com.kh.magicpot.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.coupon.model.vo.Coupon;
import com.kh.magicpot.pay.model.vo.DetailPay;
import com.kh.magicpot.pay.model.vo.FundingDetail;
import com.kh.magicpot.pay.model.vo.FundingList;
import com.kh.magicpot.pay.model.vo.Pay;

@Repository
public class PayDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("PayMapper.selectListCount");
		
	}

	public ArrayList<Pay> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("PayMapper.selectList", null, rowBounds);
		
	} 

	public DetailPay selectDetailPay(SqlSessionTemplate sqlSession, int memNo) {
		return sqlSession.selectOne("PayMapper.selectDetailPay", memNo);
	}

	public int ProjectReward(SqlSessionTemplate sqlSession, int rno) {
		return sqlSession.selectOne("PayMapper.fundingList", rno);
	}
	
	public ArrayList<FundingList> orderList(SqlSessionTemplate sqlSession, int rno) {
		return (ArrayList)sqlSession.selectList("PayMapper.fundingList", rno);
	}

	public ArrayList<FundingDetail> selectDetail(SqlSessionTemplate sqlSession, int mno) {
		return (ArrayList)sqlSession.selectList("PayMapper.fundingDetail", mno);
	}


}
