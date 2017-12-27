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

	/** 상품 판매량 **/
	public int saleQuantity(String store_no) {
		return sqlSession.selectOne("sale.saleQuantity",store_no);
	}
	
	/** 금일 등록된 상품수 **/
	public int registProducts(String store_no) {
		return sqlSession.selectOne("sale.registProducts",store_no);
	}
	
	/** 금일 방문자수 **/
	public int joinCustomers(String store_no) {
		return sqlSession.selectOne("sale.joinCustomers",store_no);
	}
	
	/** 금일 판매 수익**/	
	public int saleBenefit(String store_no) {
		return sqlSession.selectOne("sale.saleBenefit",store_no);
	}	
	
	/** 지점 상품 종류별 판매량 **/
	public Map kindStoreSale(String store_no) {
		// TODO Auto-generated method stub
		return null;
	}

	/** 판매수익 차트 **/
	public Map saleBenefitChart(String store_no) {
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
