package com.kh.everycvs.product.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
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
}
