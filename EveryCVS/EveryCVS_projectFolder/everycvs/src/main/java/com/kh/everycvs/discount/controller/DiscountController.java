package com.kh.everycvs.discount.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.discount.model.service.DiscountService;

@Controller
public class DiscountController {

	@Autowired
	private DiscountService discountService;
	
	public ModelAndView dcProductList(HttpServletRequest request) {
		return null;
	}
	
	// 할인상품 등록
	public String dcProductInsert(HttpServletRequest request) {
		return null;
	}
	
	// 할인상품 수정
	public String dcProductUpdate(HttpServletRequest request) {
		return null;
	}
	
	// 할인상품 삭제
	public String dcProductDelete(HttpServletRequest request) {
		return null;
	}
}
