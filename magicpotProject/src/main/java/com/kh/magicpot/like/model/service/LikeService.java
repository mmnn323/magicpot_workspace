package com.kh.magicpot.like.model.service;

import java.util.ArrayList;

import com.kh.magicpot.like.model.vo.Like;

public interface LikeService {

	// 좋아요 리스트 조회
	ArrayList<Like> selectLikeList(int memNo);
	
	// 좋아요 등록
	int insertLike(Like l);
	
	// 좋아요 삭제
	int deleteLike(Like l);
}
