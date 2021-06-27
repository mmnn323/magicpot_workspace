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
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private CommunityDao cDao;

	@Override
	public ArrayList<CommunityNotice> selectCmNoticeList() {
		return cDao.selectCmNoticeList(sqlSession);
	}

	@Override
	public int insertCmNotice(CommunityNotice cn) {
		// TODO Auto-generated method stub
		return 0;
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
