package com.kh.everycvs.store.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.store.model.dao.StoreDao;

@Service("StoreService")
public class StoreServiceImpl implements StoreService {
	
	@Autowired
	private StoreDao storeDao;

	@Override
	public ModelAndView selectStoreList(HttpServletRequest request) {
		// 지점 조회 : 모든 지점을 조회
		return null;
	}

	@Override
	public ModelAndView searchStoreList(HttpServletRequest request) {
		// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
		// 필터링 : 지점명/주소
		return null;
	}

	@Override
	public String DeleteStore(HttpServletRequest request) {
		// 지점 삭제
		return null;
	}
	
	

}
