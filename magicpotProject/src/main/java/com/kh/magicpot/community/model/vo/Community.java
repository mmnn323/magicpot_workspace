package com.kh.magicpot.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter @Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class Community { // 커뮤니티 vo클래스
	
	private int cmNo;	// 커뮤니티 글 번호
	private int memNo;			// 작성자 회원번호	
	private String memId;		// 작성자 아이디
	private int cmCategory;		// 커뮤니티 카테고리(1 자유수다 / 2 정보나눔 / 3 용기내)
	private String cmTitle;		// 커뮤니티 글 제목
	private String cmContent;	// 커뮤니티 글 내용
	private String cmImage;		// 커뮤니티 대표 이미지 경로
	private String enrollDate;	// 커뮤니티 글 등록일
	private String modifyDate;	// 커뮤니티 글 수정일
	private int count;			// 커뮤니티 조회수
	private String status;		// 커뮤니티 활성화 여부(Y/N)

}
