package com.kh.magicpot.pay.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.pay.model.vo.AdminPay;

@Repository
public class AdminPayDao {

	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminPayMapper.selectListCount");
		
	}

	public ArrayList<AdminPay> selectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset =(pi.getCurrentPage() - 1) * pi.getBoardLimit(); 
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminPayMapper.selectList", null, rowBounds);
		
	}

	
}
