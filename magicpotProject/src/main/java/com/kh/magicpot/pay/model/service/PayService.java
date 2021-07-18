package com.kh.magicpot.pay.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;

import com.kh.magicpot.common.model.vo.PageInfo;

import com.kh.magicpot.pay.model.vo.DetailPay;
import com.kh.magicpot.pay.model.vo.FundingDetail;
import com.kh.magicpot.pay.model.vo.FundingList;
import com.kh.magicpot.pay.model.vo.Pay;

public interface PayService {

	//결제리스트 
	int selectListCount();
	ArrayList<Pay> selectList(PageInfo pi);

	//상세
	DetailPay selectDetailPay(int memNo);
	 
	
	//결제페이지
	int ProjectReward(int rno);
	ArrayList<FundingList> orderList(int rno);
	
	
	//마이페이지 주문목록
	ArrayList<FundingDetail> selectDetail(int mno);
	
	
}
