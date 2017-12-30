package com.kh.everycvs.sale.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface SaleService {
	/* 효혁 */
	/* 지점관리자 */
	/** 상품 판매량 **/
	int saleQuantity(String store_no);

	/** 금일 판매 수익 **/
	int saleBenefit(String store_no);

	/** 지점 판매량 그래프 **/
	public List<HashMap<String, Object>> salesGraph(String store_no);

	/* 지윤 */
	/* 편의점관리자 */
	/** 편의점 상품 종류별 판매량 **/
	List<Map<String, Object>> kindCvsSale(int brand_no);

	/* 효혁 */
	/** 상품 판매량 **/
	int saleQuantity(int brand_no);

	/** 금일 판매 수익 **/
	int saleBenefit(int brand_no);

	/** 편의점 판매량 그래프 **/
	public List<HashMap<String, Object>> salesGraph(int brand_no);

}
