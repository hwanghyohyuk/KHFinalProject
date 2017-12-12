package com.kh.everycvs.product.model.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Product;

public interface ProductService {
	
	/** 상품 조회 : 모든 상품 조회 */
	public List selectProductList(int brand_no);
	
	// 상품 조회 : 선택한 상품 상세조회
	public ModelAndView selectProductOne(HttpServletRequest request);
	
	/** 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	 * 필터링 : 상품명/제조사 */
	public List searchProductList(Product product);
	
	// 상품 등록
	public String insertProduct(HttpServletRequest request);
	
	// 상품 수정
	public String updateProduct(HttpServletRequest request);
	
	/** 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
	 * @param product */
	public void deleteProduct(Product product);
	
	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	public Map popularProductTop5();
	
	/*지점관리자*/
	/**주간 인기상품 top 5**/	
	public Map popularStoreProductTop5(String store_no);
	
	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	public Map popularCvsProductTop5(int brand_no);
	
}
