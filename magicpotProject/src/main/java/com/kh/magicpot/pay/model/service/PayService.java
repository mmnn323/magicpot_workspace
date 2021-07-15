package com.kh.magicpot.pay.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.pay.model.vo.DetailPay;
import com.kh.magicpot.pay.model.vo.Pay;

public interface PayService {

	//결제리스트 
	int selectListCount();
	ArrayList<Pay> selectList(PageInfo pi);

	//상세
	DetailPay selectDetailPay(int memNo);
	
	//결제 취소 시 수정


	
	
	
}
