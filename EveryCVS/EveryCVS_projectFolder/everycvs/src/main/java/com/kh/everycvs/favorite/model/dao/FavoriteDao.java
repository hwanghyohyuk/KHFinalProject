package com.kh.everycvs.favorite.model.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

@Repository("FavoriteDao")
public class FavoriteDao {

	public FavoriteDao() {}
	
	//관심상품 목록조회
	public List favoriteList() {
		return null;
	}
	
	//관심상품 추가
	public int favoriteInsert() {
		return 0;
	}
	
	//관심상품 삭제
	public int favoriteDelete() {
		return 0;
	}
}
