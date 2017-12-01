package com.kh.everycvs.product.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Product;

@Repository("ProductDao")
public class ProductDao {

	public List selectProductList() {
		// 상품 조회 : 모든 상품을 조회
		return null;
	}

	
	public Product selectProductOne() {
		// 상품 조회 : 선택한 상품 상세조회
		return null;
	}

	
	public List searchProductList() {
		// 상품 검색 : 입력한 키워드와 필터링으로 상품을 검색
		// 필터링 : 상품명/상품코드
		return null;
	}

	
	public int insertProduct() {
		// 상품 등록
		return 0;
	}

	
	public int updateProduct() {
		// 상품 수정
		return 0;
	}

	
	public int deleteProduct() {
		// 상품 삭제 : 편의점 상품 삭제할 때 지점 상품도 연쇄 삭제
		return 0;
	}
}
