package com.kh.magicpot.like.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.like.model.dao.LikeDao;
import com.kh.magicpot.like.model.vo.Like;

@Service
public class LikeServiceImpl implements LikeService{

	/**
	 * 전역변수 : SqlSessionTemplate, CommunityDao
	 */
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private LikeDao lDao;
	
	/**
	 * 좋아요 리스트 조회
	 */
	@Override
	public ArrayList<Like> selectLikeList(int memNo) {
		return lDao.selectLikeList(sqlSession, memNo);
	}

	@Override
	public int insertLike(Like l) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	/**
	 * 좋아요 삭제
	 */
	@Override
	public int deleteLike(Like l) {
		return lDao.deleteLike(sqlSession, l);
	}
	
	/**
	 * 좋아요 여부 확인
	 */
	@Override
	public int isChecked(Like l) {
		return lDao.isChecked(sqlSession, l);
	}

}
