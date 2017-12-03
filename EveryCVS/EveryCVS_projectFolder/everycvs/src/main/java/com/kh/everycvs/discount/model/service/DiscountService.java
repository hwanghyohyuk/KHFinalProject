package com.kh.everycvs.discount.model.service;

import javax.servlet.http.HttpServletRequest;

public interface DiscountService {
	
	// 할인상품 등록
	public String dcProductInsert(HttpServletRequest request);

	// 할인상품 수정
	public String dcProductUpdate(HttpServletRequest request);

	// 할인상품 삭제
	public String dcProductDelete(HttpServletRequest request);
}
