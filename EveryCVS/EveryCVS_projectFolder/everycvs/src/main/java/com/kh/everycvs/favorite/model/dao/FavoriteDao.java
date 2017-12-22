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
	public List favoriteList(int user_no) {
		return sqlSession.selectList("favorite.favoriteList", user_no);
	}
	
	//관심상품 검색
	public List favoriteSearch(Favorite favorite){
		List list = null;
		if(favorite.getBrand_name() != null)
			list = sqlSession.selectList("favorite.favoriteSearch1", favorite);
		else if(favorite.getStore_name() != null)
			list = sqlSession.selectList("favorite.favoriteSearch2", favorite);
		else if(favorite.getProduct_name() != null)
			list = sqlSession.selectList("favorite.favoriteSearch3", favorite);
		return list;
	}
	
	//관심상품 1개 조회
	public Favorite favoriteSelectOne(Favorite favorite){
		Favorite fav = sqlSession.selectOne("favorite.favoriteSelectOne", favorite);
		return fav;
	}
	
	//관심상품 추가
	public void favoriteInsert(Favorite favorite) {
		int result = sqlSession.insert("favorite.favoriteInsert", favorite);
		System.out.println(result);
	}
	
	//관심상품 삭제
	public void favoriteDelete(Favorite favorite) {
		sqlSession.delete("favorite.favoriteDelete", favorite);
	}
}
