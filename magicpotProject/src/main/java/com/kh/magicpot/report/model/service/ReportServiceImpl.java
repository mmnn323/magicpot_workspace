package com.kh.magicpot.report.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.report.model.dao.ReportDao;
import com.kh.magicpot.report.model.vo.Blacklist;
import com.kh.magicpot.report.model.vo.Report;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ReportDao rDao;

	// 블랙리스트 페이징 처리
	@Override
	public int selectListCount() {
		return rDao.selectListCount(sqlSession);
	}
	
	// 관리자 블랙리스트 조회
	@Override
	public ArrayList<Blacklist> adminBlacklist(PageInfo pi) {
		return rDao.adminBlacklist(sqlSession, pi);
	}
	
	// 관리자 신고 리스트 페이징 처리
	@Override
	public int selectReListCount() {
		return rDao.selectReListCount(sqlSession);
	}

	// 관리자 신고 리스트 조회
	@Override
	public ArrayList<Report> adminReportList(PageInfo pi) {
		return rDao.adminReportList(sqlSession, pi);
	}
	
	
	
}
