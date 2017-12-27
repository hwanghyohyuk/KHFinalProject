package com.kh.everycvs.sale.model.service;

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
	
	/** 금일 등록된 상품수 **/
	@Override
	public int registProducts(String store_no) {
		return saleDao.registProducts(store_no);
	}
	
	/** 금일 방문자수 **/
	@Override
	public int joinCustomers(String store_no) {
		return saleDao.joinCustomers(store_no);
	}
	
	/** 금일 판매 수익**/	
	@Override
	public int saleBenefit(String store_no) {
		return saleDao.saleBenefit(store_no);
	}
	
	
	/** 지점 상품 종류별 판매량 **/
	@Override
	public Map kindStoreSale(String store_no) {
		return saleDao.kindStoreSale(store_no);
	}

	/** 판매수익 차트 **/
	@Override
	public Map saleBenefitChart(String store_no) {
		return saleDao.saleBenefitChart(store_no);
	}

	/** 시간대 별 판매량 **/
	@Override
	public Map timeSale(String store_no) {
		return saleDao.timeSale(store_no);
	}

	/** 판매내역 **/
	@Override
	public Map saleRecode(String store_no) {
		return saleDao.saleRecode(store_no);
	}

	/* 편의점관리자 */
	/** 편의점 상품 종류별 판매량 **/
	@Override
	public List<Map<String, Object>> kindCvsSale(int brand_no) {
		return saleDao.kindCvsSale(brand_no);
	}

	/** 판매량 Top5 지점 **/
	@Override
	public Map saleTop5Store(int brand_no) {
		return saleDao.saleTop5Store(brand_no);
	}



}
