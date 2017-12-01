package com.kh.everycvs.store.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface StoreService {
	
	// 지점 조회 : 모든 지점을 조회
	public ModelAndView selectStoreList(HttpServletRequest request);
	
	// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	// 필터링 : 지점명/주소
	public ModelAndView searchStoreList(HttpServletRequest request);
	
	// 지점 삭제
	public String DeleteStore(HttpServletRequest request);

}
