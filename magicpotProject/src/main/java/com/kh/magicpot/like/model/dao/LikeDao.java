package com.kh.magicpot.like.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.like.model.vo.Like;

@Repository
public class LikeDao {

	/**
	 * 좋아요 리스트 조회
	 * @return
	 */
	public ArrayList<Like> selectLikeList(SqlSessionTemplate sqlSession, int memNo){
		return (ArrayList)sqlSession.selectList("likeMapper.selectLikeList", memNo);
		
	}
}
