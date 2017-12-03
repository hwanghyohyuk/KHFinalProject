package com.kh.everycvs.sale.model.dao;

import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("saleDao")
public class SaleDao {

	/* 지점관리자 */
	/* AJAX */
	/** 지점 상품 종류별 판매량 **/
	public Map kindStoreSale(String store_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 판매수익 차트 **/
	public Map saleBenefit(String store_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 시간대 별 판매량 **/
	public Map timeSale(String store_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 판매내역 **/
	public Map saleRecode(String store_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/* 편의점관리자 */
	/** 편의점 상품 종류별 판매량 **/
	public Map kindCvsSale(int brand_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 판매량 Top5 지점 **/
	public Map saleTop5Store(int brand_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
