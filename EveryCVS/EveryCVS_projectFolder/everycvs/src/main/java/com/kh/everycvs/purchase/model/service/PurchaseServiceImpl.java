package com.kh.everycvs.purchase.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.purchase.model.dao.PurchaseDao;

@Service("PurchaseService")
public class PurchaseServiceImpl implements PurchaseService{

	@Autowired
	private PurchaseDao purchaseDao;
	
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

	@Override
	public String userIncreMoney(HttpServletRequest request) {
		//사용자 잔고 충전 
		return null;
	}

	@Override
	public String userDecreMoney(HttpServletRequest request) {
		//사용자 잔고 감소 : 사용자가 잔고로 결제 시 해당금액 만큼 차감, 포인트 자동 적립
		return null;
	}

	@Override
	public String userDecrePoint(HttpServletRequest request) {
		//사용자 포인트 감소 : 포인트로 결제 시 해당금액 만큼 차감
		return null;
	}

	@Override
	public ArrayList<Purchase> purchaseList(int month) {
		//구매내역 조회
		ArrayList<Purchase> list = new ArrayList<Purchase>();
		System.out.println(list);
		return (ArrayList<Purchase>) purchaseDao.purchaseList(month);
	}

	/*사이트관리자*/
	/**월간 구매 이용 횟수**/
	@Override
	public int monthlyPurchaseCount() {
		return purchaseDao.monthlyPurchaseCount();
	}

}
