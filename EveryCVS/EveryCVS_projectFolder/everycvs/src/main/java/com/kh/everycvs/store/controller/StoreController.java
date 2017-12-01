package com.kh.everycvs.store.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.store.model.service.StoreService;

@Controller
public class StoreController {
	
	@Autowired
	private StoreService storeService;
	
	// 지점 조회 : 모든 지점을 조회
	public ModelAndView selectStoreList(HttpServletRequest request) {
		return null;
	}
	
	// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	// 필터링 : 지점명/주소
	public ModelAndView searchStoreList(HttpServletRequest request) {
		return null;
	}
	
	// 지점 삭제
	public String DeleteStore(HttpServletRequest request) {
		return null;
	}

}
