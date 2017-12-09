package com.kh.everycvs.discount.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.DcProduct;

@Repository("DiscountDao")
public class DiscountDao {
	
	public DiscountDao() {}
	
	// 할인상품 조회
	public List dcProductList() {
		return null;
	}
	
	// 할인상품 등록
	public int dcProductInsert() {
		return 0;
	}

	// 할인상품 수정
	public int dcProductUpdate() {
		return 0;
	}

	// 할인상품 삭제
	public int dcProductDelete() {
		return 0;
	}

}
