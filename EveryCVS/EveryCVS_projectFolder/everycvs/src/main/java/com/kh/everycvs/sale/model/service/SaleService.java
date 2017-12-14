package com.kh.everycvs.sale.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

public interface SaleService {
	/* 지점관리자 */
	/* AJAX */
	/** 지점 상품 종류별 판매량 **/
	Map kindStoreSale(String store_no);

	/** 판매수익 차트 **/
	Map saleBenefit(String store_no);

	/** 시간대 별 판매량 **/
	Map timeSale(String store_no);

	/** 시간대 별 판매량 **/
	Map saleRecode(String store_no);

	/* 편의점관리자 */
	/** 편의점 상품 종류별 판매량 **/
	List kindCvsSale(int brand_no);

	/** 판매량 Top5 지점 **/
	Map saleTop5Store(int brand_no);

}
