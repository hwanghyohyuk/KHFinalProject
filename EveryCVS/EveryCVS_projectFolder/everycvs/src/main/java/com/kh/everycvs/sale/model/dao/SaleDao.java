package com.kh.everycvs.sale.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository("saleDao")
public class SaleDao {
	
	@Autowired
	private SqlSession sqlSession;

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
	public List<Map<String, Object>> kindCvsSale(int brand_no) {
		return sqlSession.selectList("sale.selectSaleProductKind", brand_no);
	}

	/** 판매량 Top5 지점 **/
	public Map saleTop5Store(int brand_no) {
		// TODO Auto-generated method stub
		return null;
	}

}
