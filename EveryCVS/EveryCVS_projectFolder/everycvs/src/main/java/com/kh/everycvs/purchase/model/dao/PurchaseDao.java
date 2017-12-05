package com.kh.everycvs.purchase.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Purchase;

@Repository("PurchaseDao")
public class PurchaseDao {
	
	public PurchaseDao(){}
	@Autowired
	private SqlSession sqlSession;

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
	
	//사용자 잔고 충전
	public int userIncreMoney() {
		return 0;
	}
	
	//사용자 잔고 감소
	public int userDecreMoney() {
		return 0;
	}
	
	//사용자 포인트 감소
	public int userDecrePoint() {
		return 0;
	}
	
	//사용자 구매내역 조회
	public List<Purchase> purchaseList() {
		List<Purchase> list = new ArrayList<Purchase>();
		System.out.println(list);
		return sqlSession.selectList("purchase.purchaseList", list);
	}
	
	/*사이트관리자*/
	/**월간 구매 이용 횟수**/
	public int monthlyPurchaseCount() {
		return 0;
	}
}
