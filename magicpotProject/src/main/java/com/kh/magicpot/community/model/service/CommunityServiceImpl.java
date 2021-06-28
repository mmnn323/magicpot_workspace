package com.kh.magicpot.community.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.community.model.dao.CommunityDao;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityNotice;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	/**
	 * 전역변수 : SqlSessionTemplate, CommunityDao
	 */
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommunityDao cDao;
	
	/**
	 * 커뮤니티 공지사항 리스트 조회
	 */
	@Override
	public ArrayList<CommunityNotice> selectCmNoticeList() {
		return cDao.selectCmNoticeList(sqlSession);
	}
	
	/**
	 * 커뮤니티 공지사항 작성
	 */
	@Override
	public int insertCmNotice(CommunityNotice cn) {
		return cDao.insertCmNotice(sqlSession, cn);
	}

	@Override
	public int increaseCmNoticeCount(int cmNoticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public CommunityNotice selectCmNotice(int cmNoticeNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCmNotice(CommunityNotice cn) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCmNotice(int cmNoticeNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int selectCmListCount() {
		return cDao.selectCmListCount(sqlSession);
	}

	@Override
	public ArrayList<Community> selectCmList(PageInfo pi) {
		return cDao.selectCmList(sqlSession, pi);
	}

	@Override
	public int insertCommunity(Community c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int increaseCmCount(int cmNo) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Community selectCommunity(int cmNo) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int updateCommunity(Community c) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int deleteCommunity(int cmNo) {
		// TODO Auto-generated method stub
		return 0;
	}

}
