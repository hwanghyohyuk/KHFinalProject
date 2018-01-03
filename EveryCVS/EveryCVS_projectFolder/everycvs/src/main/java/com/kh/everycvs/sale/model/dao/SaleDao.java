package com.kh.everycvs.sale.model.dao;

import java.util.HashMap;
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

	/** 상품 판매량 **/
	public int saleQuantity(String store_no) {
		return sqlSession.selectOne("sale.storeSaleQuantity", store_no);
	}

	/** 금일 판매 수익 **/
	public int saleBenefit(String store_no) {
		return sqlSession.selectOne("sale.storeSaleBenefit", store_no);
	}

	public List<HashMap<String, Object>> salesGraph(String store_no) {
		return sqlSession.selectList("sale.storeSalesGraph", store_no);
	}

	/* 편의점관리자 */
	/** 편의점 상품 종류별 판매량 **/
	public List<Map<String, Object>> kindCvsSale(int brand_no) {
		return sqlSession.selectList("sale.selectSaleProductKind", brand_no);
	}

	public int saleQuantity(int brand_no) {
		return sqlSession.selectOne("sale.cvsSaleQuantity", brand_no);
	}

	public int saleBenefit(int brand_no) {
		return sqlSession.selectOne("sale.cvsSaleBenefit", brand_no);
	}

	public List<HashMap<String, Object>> salesGraph(int brand_no) {
		return sqlSession.selectList("sale.cvsSalesGraph", brand_no);
	}

}
