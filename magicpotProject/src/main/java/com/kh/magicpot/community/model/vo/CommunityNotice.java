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
public class CommunityNotice { // 커뮤니티 공지사항 vo클래스

	private int cmNoticeNo;			// 커뮤니티 공지사항 번호
	private String cmNoticeTitle;	// 커뮤니티 공지사항 제목
	private String cmNoticeContent;	// 커뮤니티 공지사항 내용
	private String enrollDate;		// 커뮤니티 공지사항 등록일
	private String modifyDate;		// 커뮤니티 공지사항 수정일
	private int count;				// 커뮤니티 공지사항 조회수
	private String status;			// 커뮤니티 공지사항 활성화 여부(Y/N)
}
