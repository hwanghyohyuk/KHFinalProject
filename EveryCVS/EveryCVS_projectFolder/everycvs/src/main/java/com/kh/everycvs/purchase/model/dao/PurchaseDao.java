package com.kh.everycvs.purchase.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	
	//사용자 잔고 감소
	public int userDecreMoney(Map<String, Object> map) {
		return sqlSession.update("purchase.userDecreMoney", map);
	}
	
	//사용자 포인트 감소
	public int userDecrePoint(Map<String, Object> map) {
		return sqlSession.update("purchase.userDecrePoint", map);
	}
	
	//사용자 잔고 구매시 포인트 증가
	public int userIncrePoint(Map<String, Object> map) {
		return sqlSession.update("purchase.userIncrePoint",map);
	}
	
	//사용자 구매내역 조회
	public ArrayList<Purchase> purchaseList(int user_no, String month) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_no", user_no);
		map.put("month", month);
		List<Purchase> list = sqlSession.selectList("purchase.purchaseList", map);
		return new ArrayList<Purchase>(list);
	}
	
	/*사이트관리자*/
	/**월간 구매 이용 횟수**/
	public int monthlyPurchaseCount() {
		return 0;
	}

	
}
