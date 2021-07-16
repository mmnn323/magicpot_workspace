package com.kh.magicpot.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.community.model.dao.CommunityDao;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityComment;
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

	/**
	 * 커뮤니티 공지사항 조회수 증가
	 */
	@Override
	public int increaseCmNoticeCount(int cmNoticeNo) {
		return cDao.increaseCmNoticeCount(sqlSession, cmNoticeNo);
	}

	/**
	 * 커뮤니티 공지사항 상세조회
	 */
	@Override
	public CommunityNotice selectCmNotice(int cmNoticeNo) {
		return cDao.selectCmNotice(sqlSession, cmNoticeNo);
	}

	/**
	 * 커뮤니티 공지사항 수정
	 */
	@Override
	public int updateCmNotice(CommunityNotice cn) {
		return cDao.updateCmNotice(sqlSession, cn);
	}

	/**
	 * 커뮤니티 공지사항 삭제
	 */
	@Override
	public int deleteCmNotice(int cmNoticeNo) {
		return cDao.deleteCmNotice(sqlSession, cmNoticeNo);
	}

	/**
	 * 커뮤니티 리스트 총 수(카테고리별)
	 */
	@Override
	public int selectCmListCount(int ctg) {
		return cDao.selectCmListCount(sqlSession, ctg);
	}

	/**
	 * 커뮤니티 리스트 (카테고리별)
	 * @param pi
	 * @return
	 */
	@Override
	public ArrayList<Community> selectCmList(PageInfo pi, int ctg) {
		return cDao.selectCmList(sqlSession, pi, ctg);
	}
	
	/**
	 * 검색_1 : 검색된 커뮤니티 리스트 총 수
	 */
	@Override
	public int selectSearchListCount(HashMap<String, Object> map) {
		return cDao.selectSearchListCount(sqlSession, map);
	}

	/**
	 * 검색_2 : 검색된 커뮤니티 리스트 조회
	 */
	@Override
	public ArrayList<Community> selectSearchList(PageInfo pi, HashMap<String, Object> map) {
		return cDao.selectSearchList(sqlSession, pi, map);
	}

	@Override
	public int insertCommunity(Community cm) {
		return cDao.insertCommunity(sqlSession, cm);
	}
	
	/**
	 * 커뮤니티 게시글 상세조회_1 : 조회수 증가
	 */
	@Override
	public int increaseCmCount(int cmNo) {
		return cDao.increaseCmCount(sqlSession, cmNo);
	}

	/**
	 * 커뮤니티 게시글 상세조회_2 : 게시글 상세조회
	 */
	@Override
	public Community selectCommunity(int cmNo) {
		return cDao.selectCommunity(sqlSession, cmNo);
	}

	/**
	 * 커뮤니티 게시글 수정
	 */
	@Override
	public int updateCommunity(Community cm) {
		return cDao.updateCommunity(sqlSession, cm);
	}

	/**
	 * 커뮤니티 게시글 삭제
	 */
	@Override
	public int deleteCommunity(int cmNo) {
		return cDao.deleteCommunity(sqlSession, cmNo);
	}

	/**
	 * 커뮤니티 댓글 리스트 조회
	 */
	@Override
	public ArrayList<CommunityComment> selectCmCommentList(int cmNo) {
		return cDao.selectCmCommentList(sqlSession, cmNo);
	}

	/**
	 * 커뮤니티 댓글 등록
	 */
	@Override
	public int insertComment(CommunityComment r) {
		return cDao.insertComment(sqlSession, r);
	}
	
	/**
	 * 커뮤니티 댓글 삭제_1 : 참조된 댓글인지 확인
	 */
	@Override
	public int checkReComment(int cmCommentNo) {
		return cDao.checkReComment(sqlSession, cmCommentNo);
	}
	
	/**
	 * 커뮤니티 댓글 삭제_2_1 : 참조된 댓글인 경우 내용 update
	 */
	@Override
	public int deleteRefComment(int cmCommentNo) {
		return cDao.deleteRefComment(sqlSession, cmCommentNo);
	}

	/**
	 * 커뮤니티 댓글 삭제_2_2 : 참조된 댓글이 없는 경우 상태 update
	 */
	@Override
	public int deleteComment(int cmCommentNo) {
		return cDao.deleteComment(sqlSession, cmCommentNo);
	}

	/**
	 * 커뮤니티 댓글 수정
	 */
	@Override
	public int updateComment(CommunityComment r) {
		return cDao.updateComment(sqlSession, r);
	}



}
