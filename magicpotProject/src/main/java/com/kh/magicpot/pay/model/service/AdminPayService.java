package com.kh.magicpot.pay.model.service;

import java.util.ArrayList;

import com.kh.magicpot.common.model.vo.PageInfo;
import com.kh.magicpot.pay.model.vo.AdminPay;

public interface AdminPayService {

	//결제리스트 
	int selectListCount();
	ArrayList<AdminPay> selectList(PageInfo pi);

	//상세
	AdminPay PaySelect(int memNo);
	
	//결제 취소 시 수정
	int updateAdminPay(AdminPay a);

	
	
	
}
