package com.kh.everycvs.product.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.product.model.service.ProductService;

@Controller
public class ProductController {
	
	@Autowired
	private ProductService productService;

	// 상품 조회 : 모든 상품을 조회
	public ModelAndView selectProductList(HttpServletRequest request) {
		return null;
	}
	
	// 상품 조회 : 선택한 상품 상세조회
	public ModelAndView selectProductOne(HttpServletRequest request) {
		return null;
	}
	
	// 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
	// 필터링 : 상품명/상품코드
	public ModelAndView searchProductList(HttpServletRequest request) {
		return null;
	}
	
	// 상품 등록
	public String insertProduct(HttpServletRequest request) {
		return null;
	}
	
	// 상품 수정
	public String updateProduct(HttpServletRequest request) {
		return null;
	}
	
	// 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
	public String deleteProduct(HttpServletRequest request) {
		return null;
	}

	/*사용자*/
	/**실시간 인기상품(전체) top 5**/
	public ModelAndView popularProductTop5(ModelAndView modelAndView){
		Map map = productService.popularProductTop5();
		return modelAndView;
	}
	
	/*지점관리자*/
	/**주간 인기상품 top 5**/
	public ModelAndView popularStoreProductTop5(ModelAndView modelAndView){
		String store_no="";
		Map map = productService.popularStoreProductTop5(store_no);
		return modelAndView;
	}
	
	/*편의점관리자*/
	/**주간 인기상품 top 5**/
	public ModelAndView popularCvsProductTop5(ModelAndView modelAndView){
		int brand_no = 0;
		Map map = productService.popularCvsProductTop5(brand_no);
		return modelAndView;
	}
	
	/** 상품 조회 : 모든 상품을 조회 */
	@RequestMapping("cvsproductlist.do")
	public String cvsProductList() {
		return "admin/cvsmanager/productList";
	}
	
	/** 상품 등록 */
	@RequestMapping("cvsproductwriteview.do")
	public String cvsProductWriteView() {
		return "admin/cvsmanager/productWriteForm";
	}
	
	/** 상품 수정 */
	@RequestMapping("cvsproductmodifyview.do")
	public String cvsProductModifyView() {
		return "admin/cvsmanager/productModifyForm";
	}
	
}
