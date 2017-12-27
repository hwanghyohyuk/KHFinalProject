package com.kh.everycvs.purchase.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Purchase;

public interface PurchaseService {
	
	// 판매내역 조회 : 해당 지점의 사용자의 구매내역을 전체 조회
	public ModelAndView selectPurchaseList(HttpServletRequest request);
	
	// 판매내역 조회 : 해당 지점의 사용자 구매내역을 상세조회
	public ModelAndView selectPurchaseOne(HttpServletRequest request);
	
	// 잔고 금액 증가 : 사용자가 상품을 구매 시 결제되는 금액만큼 증가
	public int increaseMoney(Map<String, Object> map);

	// 잔고 금액 감소 : 사용자가 상품을 구매 시 사용한 포인트만큼 감소
	public String decreaseMoney(HttpServletRequest request);
	
	//사용자 잔고 금액 증가: 사용자가 잔고 충전 시 잔고 증가
	public String userIncreMoney(HttpServletRequest request);
	
	//사용자 잔고 금액 감소 : 사용자가 상품을 잔고로 결제 시 차감, 포인트 자동적립
	public int userDecreMoney(Map<String, Object> map);
	
	//포인트 감소 : 포인트로 결제할 시 포인트 차감
	public int userDecrePoint(Map<String, Object> map);
	
	//포인트 증가 : 잔고로 구매시 포인트 증가
	public int userIncrePoint(Map<String, Object> map);
	
	//거래내역 조회 : 3개월, 1개월, 1주일 단위로 조회(해당 리스트 목록조회)
	public ArrayList<Purchase> purchaseList(int user_no, String month);
	
	/*사이트관리자*/
	/**월간 구매 이용 횟수**/
	int monthlyPurchaseCount();

	public int userInsertPurchaseList(Map<String, Object> map);

	public ArrayList<Purchase> top3List();
	
}
