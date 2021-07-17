package com.kh.magicpot.report.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.report.model.vo.Blacklist;
import com.kh.magicpot.report.model.vo.Report;

@Repository
public class ReportDao {

	// 블랙리스트 페이징 처리
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectListCount");
	}
	
	// 관리자 블랙리스트 조회
	public ArrayList<Blacklist> adminBlacklist(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.adminBlacklist", null, rowBounds);
	}
	
	// 블랙리스트 모달 조회
	public ArrayList<Report> modalBlacklist (SqlSessionTemplate sqlSession, int blacklistNo){
		return (ArrayList)sqlSession.selectList("reportMapper.modalBlacklist", blacklistNo);
	}
	
	// 관리자 신고 리스트 페이징 처리
	public int selectReListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.selectReListCount");
	}

	// 관리자 신고 리스트 조회
	public ArrayList<Report> adminReportList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("reportMapper.adminReportList", null, rowBounds);
	}

	// 관리자 신고 디테일
	public ArrayList<Report> reportDetail(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("reportMapper.adminReportList", null);
	}



}
