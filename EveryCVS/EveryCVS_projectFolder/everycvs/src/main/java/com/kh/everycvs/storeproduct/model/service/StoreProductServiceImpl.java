package com.kh.everycvs.storeproduct.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.storeproduct.model.dao.StoreProductDao;

@Service("StoreProductService")
public class StoreProductServiceImpl implements StoreProductService{

	@Autowired
	private StoreProductDao storeProductDao;
	
	@Override
	public ModelAndView selectStoreProductList(HttpServletRequest request) {
		// 지점 상품 조회
		return null;
	}

	@Override
	public ModelAndView selectStoreProductOne(HttpServletRequest request) {
		// 지점 상품 조회 : 선택한 상품을 상세조회
		return null;
	}

	@Override
	public ModelAndView searchStoreProductList(HttpServletRequest request) {
		// 지점 상품 검색 : 입력한 키워드와 필터링으로 지점상품을 검색
		// 필터링 : 상품명/상품코드
		return null;
	}

	@Override
	public String updateStoreProduct(HttpServletRequest request) {
		// 지점 상품 수정 : 변경사항(제조일/수량/이벤트)
		return null;
	}

	@Override
	public String deleteStoreProduct(HttpServletRequest request) {
		// 지점 상품 삭제
		return null;
	}
	
	@Override
	public String insertStoreProduct(HttpServletRequest request) {
		// 지점 상품 추가 : 해당 상호 편의점의 전체 상품 목록에서 수량이 1이상인 상품들을 지점상품에 추가
		return null;
	}

}
