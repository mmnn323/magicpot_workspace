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
public class CommunityFile {

	private int cmFileNo;		// 커뮤니티 첨부파일 번호
	private int cmNo;			// 커뮤니티 글 번호
	private String orgFileName; // 커뮤니티 첨부파일 원본명
	private String mdfFileName; // 커뮤니티 첨부파일 수정명
	private String filePath;	// 커뮤니티 첨부파일 경로
}
