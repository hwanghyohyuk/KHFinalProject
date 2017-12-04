package com.kh.everycvs.product.model.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.product.model.dao.ProductDao;

@Service("ProductService")
public class ProductServiceImpl implements ProductService{

	@Autowired
	private ProductDao productDao;
	
	@Override
	public ModelAndView selectProductList(HttpServletRequest request) {
		// 상품 조회 : 모든 상품을 조회
		return null;
	}

	@Override
	public ModelAndView selectProductOne(HttpServletRequest request) {
		// 상품 조회 : 선택한 상품 상세조회
		return null;
	}

	@Override
	public ModelAndView searchProductList(HttpServletRequest request) {
		// 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
		// 필터링 : 상품명/상품코드
		return null;
	}

	@Override
	public String insertProduct(HttpServletRequest request) {
		// 상품 등록
		return null;
	}

	@Override
	public String updateProduct(HttpServletRequest request) {
		// 상품 수정
		return null;
	}

	@Override
	public String deleteProduct(HttpServletRequest request) {
		// 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
		return null;
	}

	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	@Override
	public Map popularProductTop5() {
		return productDao.popularProductTop5();
	}

	/*지점관리자*/
	/**주간 인기상품 top 5**/
	@Override
	public Map popularStoreProductTop5(String store_no) {
		return productDao.popularStoreProductTop5(store_no);
	}

	
	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	@Override
	public Map popularCvsProductTop5(int brand_no) {
		return productDao.popularCvsProductTop5(brand_no);
	}
	
}
