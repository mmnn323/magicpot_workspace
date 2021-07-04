package com.kh.magicpot.community.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.community.model.vo.Community;
import com.kh.magicpot.community.model.vo.CommunityNotice;

public interface CommunityService {

	// 커뮤니티 공지사항 (페이징x, 첨부파일x)
	// 커뮤니티 공지사항 리스트 조회
	ArrayList<CommunityNotice> selectCmNoticeList();
	
	// 커뮤니티 공지사항 작성
	int insertCmNotice(CommunityNotice cn);
	
	// 커뮤니티 공지사항 상세조회
	int increaseCmNoticeCount(int cmNoticeNo);
	CommunityNotice selectCmNotice(int cmNoticeNo);
	
	// 커뮤니티 공지사항 수정
	int updateCmNotice(CommunityNotice cn);
	
	// 커뮤니티 공지사항 삭제
	int deleteCmNotice(int cmNoticeNo);
	
	
	// 커뮤니티 (페이징o, 첨부파일o) - 써머노트 api 적용 : 필요한 메소드 수정 예정
	// 커뮤니티 글 리스트 조회
	int selectCmListCount(int ctg);
	ArrayList<Community> selectCmList(PageInfo pi, int ctg);
	
	// 커뮤니티 검색 리스트 조회
	int selectSearchListCount(HashMap<String, Object> map);
	ArrayList<Community> selectSearchList(PageInfo pi, HashMap<String, Object> map);
	
	// 커뮤니티 글 작성
	int insertCommunity(Community c);
//	int insertCmFile(CommunityFile cf); 글 작성 시 첨부파일 관련 메소드
	
	// 커뮤니티 글 상세조회
	int increaseCmCount(int cmNo);
	Community selectCommunity(int cmNo);
//	CommunityFile selectCmFile(int cmNo); 글 상세조회 시 첨부파일 관련 메소드
	
	// 커뮤니티 글 수정
	int updateCommunity(Community c);
//	int updateCmFile(int cmNo); 글 수정 시 첨부파일 관련 메소드
	
	// 커뮤니티 글 삭제
	int deleteCommunity(int cmNo);
//  int deleteCmFile(int cmNo); 글 삭제 시 첨부파일 관련 메소드
}
