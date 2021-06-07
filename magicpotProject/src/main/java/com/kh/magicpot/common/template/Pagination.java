package com.kh.magicpot.common.template;

import com.kh.magicpot.common.model.vo.PageInfo;

public class Pagination {
	
	public static PageInfo getPageInfo(int listCount, int currentPage, int pageLimit, int boardLimit) {
		
		// * 마지막 페이지 수 (총 페이지 수)
		int maxPage = (int)Math.ceil((double)listCount / boardLimit);
		
		// * 페이징바의 시작 수
		int startPage = (currentPage - 1) / pageLimit * pageLimit + 1;
		
		// * 페이징바의 끝 수
		int endPage;
		if((endPage = startPage + pageLimit - 1) > maxPage) {
			endPage = maxPage;
		}
		
		// PageInfo 객체에 담아서 리턴
		return new PageInfo(listCount, currentPage, pageLimit, boardLimit, startPage, endPage, maxPage);
	}
	
}
