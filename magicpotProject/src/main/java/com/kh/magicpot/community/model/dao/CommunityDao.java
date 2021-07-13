package com.kh.magicpot.community.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityComment;
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
	 * 커뮤니티 공지사항 작성
	 * @param sqlSession
	 * @param cn
	 * @return
	 */
	public int insertCmNotice(SqlSessionTemplate sqlSession, CommunityNotice cn) {
		return sqlSession.insert("communityMapper.insertCmNotice", cn);
	}
	
	/**
	 * 커뮤니티 공지사항 조회수 증가
	 * @param sqlSession
	 * @param cmNoticeNo
	 * @return
	 */
	public int increaseCmNoticeCount(SqlSessionTemplate sqlSession, int cmNoticeNo) {
		return sqlSession.update("communityMapper.increaseCmNoticeCount", cmNoticeNo);
	}
	
	/**
	 * 커뮤니티 공지사항 상세조회
	 * @param sqlSession
	 * @param cmNoticeNo
	 * @return
	 */
	public CommunityNotice selectCmNotice(SqlSessionTemplate sqlSession, int cmNoticeNo) {
		return sqlSession.selectOne("communityMapper.selectCmNotice", cmNoticeNo);
	}
	
	/**
	 * 커뮤니티 공지사항 수정
	 * @param sqlSession
	 * @param cn
	 * @return
	 */
	public int updateCmNotice(SqlSessionTemplate sqlSession, CommunityNotice cn) {
		return sqlSession.update("communityMapper.updateCmNotice", cn);
	}
	
	/**
	 * 커뮤니티 공지사항 삭제
	 * @param sqlSession
	 * @param cmNoticeNo
	 * @return
	 */
	public int deleteCmNotice(SqlSessionTemplate sqlSession, int cmNoticeNo) {
		return sqlSession.update("communityMapper.deleteCmNotice", cmNoticeNo);
	}
	
	/**
	 * 커뮤니티 글 수(카테고리별)
	 * @param sqlSession
	 * @param ctg
	 * @return
	 */
	public int selectCmListCount(SqlSessionTemplate sqlSession, int ctg ) {
		return sqlSession.selectOne("communityMapper.selectCmListCount", ctg);
	}
	
	/**
	 * 커뮤니티 글 리스트 조회
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Community> selectCmList(SqlSessionTemplate sqlSession, PageInfo pi, int ctg){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("communityMapper.selectCmList", ctg, rowBounds);
	}
	
	/**
	 * 검색 : 검색된 커뮤니티 리스트 총 수
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, Object> map) {
		return sqlSession.selectOne("communityMapper.selectSearchListCount", map);
	}
	
	/**
	 * 검색 : 검색된 커뮤니티 리스트 조회
	 * @param sqlSession
	 * @param pi
	 * @param map
	 * @return
	 */
	public ArrayList<Community> selectSearchList(SqlSessionTemplate sqlSession, PageInfo pi, HashMap<String, Object> map){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("communityMapper.selectSearchList", map, rowBounds);
	}
	
	/**
	 * 커뮤니티 등록
	 * @param sqlSession
	 * @param cm
	 * @return
	 */
	public int insertCommunity(SqlSessionTemplate sqlSession, Community cm) {
		return sqlSession.insert("communityMapper.insertCommunity", cm);
	}
	
	/**
	 * 커뮤니티 게시글 상세조회_1 : 조회수 증가
	 * @param sqlSession
	 * @param cmNo
	 * @return
	 */
	public int increaseCmCount(SqlSessionTemplate sqlSession, int cmNo) {
		return sqlSession.update("communityMapper.increaseCmCount", cmNo);
	}
	
	/**
	 * 커뮤니티 게시글 상세조회_2 : 게시글 상세조회
	 * @param sqlSession
	 * @param cmNo
	 * @return
	 */
	public Community selectCommunity(SqlSessionTemplate sqlSession, int cmNo) {
		return sqlSession.selectOne("communityMapper.selectCommunity", cmNo);
	}
	
	/**
	 * 커뮤니티 게시글 업데이트
	 * @param sqlSession
	 * @param cm
	 * @return
	 */
	public int updateCommunity(SqlSessionTemplate sqlSession, Community cm) {
		return sqlSession.update("communityMapper.updateCommunity", cm);
	}
	
	/**
	 * 커뮤니티 게시글 삭제
	 * @param sqlSession
	 * @param cmNo
	 * @return
	 */
	public int deleteCommunity(SqlSessionTemplate sqlSession, int cmNo) {
		return sqlSession.update("communityMapper.deleteCommunity", cmNo);
	}
	
	/**
	 * 커뮤니티 댓글 리스트 조회
	 * @param sqlSession
	 * @param cmNo
	 * @return
	 */
	public ArrayList<CommunityComment> selectCmCommentList(SqlSessionTemplate sqlSession, int cmNo){
		return (ArrayList)sqlSession.selectList("communityMapper.selectCmCommentList", cmNo);
	}
	
	/**
	 * 커뮤니티 댓글 등록
	 * @param sqlSession
	 * @param r
	 * @return
	 */
	public int insertComment(SqlSessionTemplate sqlSession, CommunityComment r) {
		return sqlSession.insert("communityMapper.insertComment", r);
	}
	
	/**
	 * 커뮤니티 댓글 삭제_1 : 참조된 댓글인지 확인
	 * @param sqlSession
	 * @param cmNommentNo
	 * @return
	 */
	public int checkReComment(SqlSessionTemplate sqlSession, int cmCommentNo) {
		return sqlSession.selectOne("communityMapper.checkReComment", cmCommentNo);
	}
	
	/**
	 * 커뮤니티 댓글 삭제_2_1 : 참조된 댓글인 경우 내용 update
	 * @param sqlSession
	 * @param cmCommnetNo
	 * @return
	 */
	public int deleteRefComment(SqlSessionTemplate sqlSession, int cmCommnetNo) {
		return sqlSession.update("communityMapper.deleteRefComment", cmCommnetNo);
	}
	
	/**
	 * 커뮤니티 댓글 삭제_2_2 : 참조된 댓글이 없는 경우 상태 update
	 * @param sqlSession
	 * @param cmCommentNo
	 * @return
	 */
	public int deleteComment(SqlSessionTemplate sqlSession, int cmCommentNo) {
		return sqlSession.update("communityMapper.deleteComment", cmCommentNo);
	}
	
	/**
	 * 커뮤니티 댓글 수정
	 * @param sqlSession
	 * @param r
	 * @return
	 */
	public int updateComment(SqlSessionTemplate sqlSession, CommunityComment r) {
		return sqlSession.update("communityMapper.updateComment", r);
	}

}
