package com.kh.everycvs.discount.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everycvs.discount.model.dao.DiscountDao;

@Service("DiscountService")
public class DiscountServiceImpl implements DiscountService{

	@Autowired
	private DiscountDao discountDao;
	
	@Override
	public String dcProductInsert(HttpServletRequest request) {
		// 할인상품 등록
		return null;
	}

	@Override
	public String dcProductUpdate(HttpServletRequest request) {
		// 할인상품 수정
		return null;
	}

	@Override
	public String dcProductDelete(HttpServletRequest request) {
		// 할인상품 삭제
		return null;
	}

}
