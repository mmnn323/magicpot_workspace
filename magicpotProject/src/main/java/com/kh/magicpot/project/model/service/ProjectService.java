package com.kh.magicpot.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.like.model.vo.Like;
import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.PayStatus;
import com.kh.magicpot.project.model.vo.ProRequire;
import com.kh.magicpot.project.model.vo.Project;
import com.kh.magicpot.project.model.vo.ProjectReward;

public interface ProjectService {
	

	
	// 랭킹 ajax
	ArrayList<Project> rankList();
	
	// 추천 프로젝트 ajax
	ArrayList<Project> reList();
	
	// 메인 슬라이드 ajax
	ArrayList<Project> slide();
	
	// 신규 프로젝트 ajax
	ArrayList<Project> newList();
	
	// 크리에이터 추가
	int insertCreator(Creator c);
	
	// 카테고리 리스트
	ArrayList<Project> reList2(HashMap<String, Object> map);
	
	// 펀딩하기에서 검색
	ArrayList<Project> searchList(HashMap<String, Object> map);
	
	// 메뉴바에서 검색
	ArrayList<Project> searchList2(HashMap<String, Object> map);
	
	// 크리에이터 조회
	Creator selectCreator(Member m);
	
	// 프로젝트 생성
	int insertProject(HashMap<String, Integer> map);
	
	// ranNo 중복 조회용
	int selectRanNo(int ranNo);
	
	// pno으로 ranNo 조회
	int selectRanNo2(int pno);
	
	// 프로젝트 조회(fundingHome에서 ranNo이용)
	Project selectProject1(int ranNo);
	
	// 프로젝트 조회(fundingHome에서 pno이용)
	Project selectProject2(int pno);

	// 프로젝트 단계 펀딩 준비로 변경(fundingHome1에서)
	int updateProStep1(int ranNo);

	// 기본 요건 조회
	ProRequire selectRequire(int pno);
	
	// 기본 요건 추가
	int insertRequire(ProRequire proRequire);
	
	// 기본 요건 수정
	int updateRequire(ProRequire proRequire);
	
	// 프로젝트 상세 페이지
	Project selectFundingDetail(int proNo);

	//서포터
	//int selectSupporter(int proNo);

	// 프로젝트 작가의말
	Project authorAjax(int proNo);
	
	// [휘경] 좋아요 체크 여부
	int isChecked(Like l);
	
	// [휘경] 프로젝트 좋아요 수 조회
	int countLike(int proNo);
	
	// [휘경] 프로젝트 좋아요 취소
	int deleteLike(Like l);
	
	// [휘경] 프로젝트 좋아요 추가
	int insertLike(Like l);

	ArrayList<Project> selectReward(int proNo);
	
	// 기본 정보 조회
	Project selectBasic(int pno);
	
	// 기본 정보 수정
	int updateBasic(Project p);

	// 광고 심의 동의 상태 변경
	int updateProAd(int pno);

	// 스토리 작성
	int updateStory(Project p);

	// 리워드 조회
	ArrayList<ProjectReward> selectReward2(int pno);
	
	// 리워드 생성
	int insertReward(ProjectReward proReward);

	// 리워드 수정
	int updateReward(ProjectReward proReward);
	
	// 리워드 삭제
	int deleteReward(int rno);

	// 펀딩 상태 -> 요건확인
	int updateProStep2(int pno);
	

	// 펀딩 리스트 조회
	ArrayList<Project> selectProjectList(PageInfo pi);

	// 펀딩 리스트 개수 조회
	int selectListProCount();

	// 프로젝트 상세조회 기본 정보
	Project selectFunManageBasic(int pno);

	// 프로젝트 상세조회 스토리
	Project selectFunManageStroy(int pno);
	
	// 프로젝트 단계 조회
	String selectProStep(int pno);
	
	// 프로젝트 단계 변경(콘텐츠확인)
	int updateProStep3(int pno);

	// 프로젝트 단계 변경(펀딩오픈 + 승인)
	int updateProStep4(int pno);
	
	// 프로젝트 상태 변경(미승인)
	int updateProCancel(int pno);
	
	// 프로젝트 관리 검색
	ArrayList<Project> selectSearchList(PageInfo pi, HashMap<String, String> map);

	// 프로젝트 바로 오픈
	int updateOpenDateDir(int pno);

	// 프로젝트 오픈 예약
	int updateOpenDateRes(Project pro);

	// 펀딩 현황 조회
	Project selectFunStatus(int pno);

	// 주문 건수 조회
	int selectOrderCount(int pno);

	// 리뷰 수 조회
	int selectReviewCount(int pno);

	// 서포터 수 조회
	int selectSupCount(int pno);

	// payStatus 수 조회
	int selectPayStatusCount(int pno);

	// payStatus 조회
	ArrayList<PayStatus> selectPayStatusList(PageInfo pi, HashMap<String, Integer> map);

	// deliStatus 수 조회
	int selectdeliStatusCount(int pno);

	// deliStatus 조회
	ArrayList<PayStatus> selectdeliStatusList(PageInfo pi, HashMap<String, Integer> map);

	// 후원금 조회
	int selectFunPrice(int pno);

	// 배송완료금 조회
	int selectFinishPrice(int pno);

	// 환불금 조회
	int selectReturnPrice(int pno);

	// 운송장 수정
	int updateDeliverNo(PayStatus payStatus);

	// 프로젝트 검색 리스트 개수
	int selectListProSearchCount(HashMap<String, String> map);

	
}

