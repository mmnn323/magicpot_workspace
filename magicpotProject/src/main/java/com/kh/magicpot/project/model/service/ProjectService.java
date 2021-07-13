package com.kh.magicpot.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.magicpot.member.model.vo.Member;
import com.kh.magicpot.project.model.vo.Creator;
import com.kh.magicpot.project.model.vo.ProRequire;
import com.kh.magicpot.project.model.vo.Project;

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
	// 프로젝트 상세 작가의말
	Project authorAjax(int proNo);
}

