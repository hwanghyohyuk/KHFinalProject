package com.kh.everycvs.purchase.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("PurchaseDao")
public class PurchaseDao {
	
	public PurchaseDao(){}

	// 판매내역 조회 : 해당 지점의 사용자의 구매내역을 전체 조회
	public List selectPurchaseList(){
		return null;
	}
	
	// 판매내역 조회 : 해당 지점의 사용자 구매내역을 상세조회
	public List selectPurchaseOne(){
		return null;
	}
	
	// 잔고 금액 증가 : 사용자가 상품을 구매 시 결제되는 금액만큼 증가
	public int increaseMoney(){
		return 0;
	}
	
	// 잔고 금액 감소 : 사용자가 상품을 구매 시 사용한 포인트만큼 감소
	public int decreaseMoney(){
		return 0;
	}
}
