package com.kh.everycvs.purchase.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service("PurchaseService")
public class PurchaseServiceImpl implements PurchaseService{

	@Override
	public ModelAndView selectPurchaseList(HttpServletRequest request) {
		// 판매내역 조회 : 해당 지점의 사용자의 구매내역을 전체 조회
		return null;
	}

	@Override
	public ModelAndView selectPurchaseOne(HttpServletRequest request) {
		// 판매내역 조회 : 해당 지점의 사용자 구매내역을 상세조회
		return null;
	}

	@Override
	public String increaseMoney(HttpServletRequest request) {
		// 잔고 금액 증가 : 사용자가 상품을 구매 시 결제되는 금액만큼 증가
		return null;
	}

	@Override
	public String decreaseMoney(HttpServletRequest request) {
		// 잔고 금액 감소 : 사용자가 상품을 구매 시 사용한 포인트만큼 감소
		return null;
	}

}
