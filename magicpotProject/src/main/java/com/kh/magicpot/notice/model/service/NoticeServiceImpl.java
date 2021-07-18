package com.kh.magicpot.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.notice.model.dao.NoticeDao;
import com.kh.magicpot.notice.model.vo.Notice;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private NoticeDao nDao;

	@Override
	public ArrayList<Notice> selectNotice(PageInfo pi) {
		return nDao.selectNotice(sqlSession, pi);
	}

	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	@Override
	public Notice selectNoticeDetail(int noNo) {
		return nDao.selectNoticeDetail(sqlSession, noNo);
	}

	@Override
	public int insertNotice(Notice n) {
		return nDao.insertNotice(sqlSession, n);
	}

	
}
