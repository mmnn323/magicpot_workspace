package com.kh.magicpot.project.model.service;

import java.util.ArrayList;

import com.kh.magicpot.project.model.vo.Project;

public interface ProjectService {
	

	
	// 랭킹 ajax
	ArrayList<Project> rankList();
	
	// 추천 프로젝트 ajax
	
	ArrayList<Project> reList();
	
	// 메인 슬라이드 ajax
	
	ArrayList<Project> slide();
	
	

}

