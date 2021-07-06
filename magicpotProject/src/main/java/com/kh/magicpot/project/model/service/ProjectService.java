package com.kh.magicpot.project.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.magicpot.project.model.vo.Creator;
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
	int insertCre(Creator c);
	
	// 카테고리 리스트
	ArrayList<Project> reList2(HashMap<String, Object> map);
	
	// 펀딩하기에서 검색
	ArrayList<Project> searchList(HashMap<String, Object> map);
	
	// 메뉴바에서 검색
	ArrayList<Project> searchList2(HashMap<String, Object> map);
}

