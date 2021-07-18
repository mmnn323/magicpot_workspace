package com.kh.magicpot.notice.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.notice.model.vo.Notice;

public interface NoticeService {
	
	int selectListCount();
	ArrayList<Notice> selectNotice(PageInfo pi);
	Notice selectNoticeDetail(int noNo);
	
}
