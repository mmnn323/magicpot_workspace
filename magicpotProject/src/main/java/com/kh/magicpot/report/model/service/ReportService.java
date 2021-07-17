package com.kh.magicpot.report.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.report.model.vo.Blacklist;
import com.kh.magicpot.report.model.vo.Report;

public interface ReportService {
	
	// 블랙리스트 페이징 처리
	int selectListCount();

	// 관리자 블랙리스트 조회
	ArrayList<Blacklist> adminBlacklist(PageInfo pi);
	
	// 블랙리스트 모달 조회
	ArrayList<Report> modalBlacklist(int blacklistNo);
	
	// 관리자 신고 리스트 페이징 처리
	int selectReListCount();
	
	// 관리자 신고 리스트 조회
	ArrayList<Report> adminReportList(PageInfo pi);

	// 관리자 신고 디테일
	ArrayList<Report> reportDetail();



}
