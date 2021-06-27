package com.kh.magicpot.community.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityNotice;

@Repository
public class CommunityDao {
	
	/**
	 * 커뮤니티 공지사항 리스트 조회
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<CommunityNotice> selectCmNoticeList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("communityMapper.selectCmNoticeList");
	}
	
	
	/**
	 * 커뮤니티 글 총 갯수 조회
	 * @param sqlSession
	 * @return
	 */
	public int selectCmListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("communityMapper.selectCmListCount");
	}
	
	/**
	 * 커뮤니티 글 리스트 조회
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Community> selectCmList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("communityMapper.selectCmList", null, rowBounds);
	}
	
}
