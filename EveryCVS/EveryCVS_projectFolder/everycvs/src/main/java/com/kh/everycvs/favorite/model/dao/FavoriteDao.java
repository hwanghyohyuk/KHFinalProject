package com.kh.everycvs.favorite.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Favorite;

@Repository("FavoriteDao")
public class FavoriteDao {
	public FavoriteDao() {}

	@Autowired
	private SqlSession sqlSession;
	
	//관심상품 목록조회
	public List<Favorite> favoriteList() {
		ArrayList<Favorite> flist = new ArrayList<Favorite>();
		return sqlSession.selectList("favorite.favoriteList", flist);
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
