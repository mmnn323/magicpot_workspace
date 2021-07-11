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
public class CommunityComment { // 커뮤니티 댓글 vo클래스

	private int cmCommentNo;		// 커뮤니티 댓글 번호
	private int memNo;				// 댓글 작성자 회원번호
	private int cmNo;				// 커뮤니티 글 번호
	private String memId;			// 댓글 작성자 아이디
	private int cmCommentRef;		// 참조 댓글 번호(이댓글이 어떤댓글에 딸린건지 (만일 원글일 경우는 0))
	private int cmCommentDepth;		// 댓글 깊이(이 댓글의 깊이 (원글 1, 대댓글 2, 대대댓글3, ...)
	private String cmCommentContent;// 댓글 내용
	private String enrollDate;		// 댓글 작성일
	private String modifyDate;		// 댓글 수정일
	private String status;			// 댓글활성화여부(Y/N)
	
	private String cmWriter;		// 커뮤니티 글 작성자 아이디
}
