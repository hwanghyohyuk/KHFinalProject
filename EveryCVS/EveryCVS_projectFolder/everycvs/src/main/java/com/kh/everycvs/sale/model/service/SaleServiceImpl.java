package com.kh.everycvs.sale.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everycvs.sale.model.dao.SaleDao;

@Service("saleService")
public class SaleServiceImpl implements SaleService {

	@Autowired
	private SaleDao saleDao;

	/* 지점관리자 */

	/** 상품 판매량 **/
	@Override
	public int saleQuantity(String store_no) {
		return saleDao.saleQuantity(store_no);
	}

	/** 금일 판매 수익 **/
	@Override
	public int saleBenefit(String store_no) {
		return saleDao.saleBenefit(store_no);
	}

	/** 편의점 상품 종류별 판매량 **/
	@Override
	public List<Map<String, Object>> kindCvsSale(int brand_no) {
		return saleDao.kindCvsSale(brand_no);
	}


	@Override
	public List<HashMap<String, Object>> salesGraph(String store_no) {
		return saleDao.salesGraph(store_no);
	}
	/* 편의점관리자 */

	/** 상품 판매량 **/
	@Override
	public int saleQuantity(int brand_no) {
		return saleDao.saleQuantity(brand_no);
	}

	/** 금일 판매 수익 **/
	@Override
	public int saleBenefit(int brand_no) {
		return saleDao.saleBenefit(brand_no);
	}

	@Override
	public List<HashMap<String, Object>> salesGraph(int brand_no) {
		return saleDao.salesGraph(brand_no);
	}

}
