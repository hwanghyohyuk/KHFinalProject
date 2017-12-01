package com.kh.everycvs.store.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("StoreDao")
public class StoreDao {
	
	public StoreDao(){}
	
	public List selectStoreList() {
		// 지점 조회 : 모든 지점을 조회
		return null;
	}
	
	public List searchStoreList() {
		// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
		// 필터링 : 지점명/주소
		return null;
	}
	
	public int DeleteStore() {
		// 지점 삭제
		return 0;
	}

}
