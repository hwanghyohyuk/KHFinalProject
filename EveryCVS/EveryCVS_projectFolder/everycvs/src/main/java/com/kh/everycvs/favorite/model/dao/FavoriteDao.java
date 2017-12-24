package com.kh.everycvs.favorite.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
	public List favoriteList(int user_no, int category, String keyword) {
		Map<String,Object> map = new HashMap<String,Object>();
		map.put("user_no", user_no);
		map.put("category", category);
		map.put("keyword", "%"+keyword+"%");
		return sqlSession.selectList("favorite.favoriteList", map);
	}
	
	//관심상품 1개 조회
	public Favorite favoriteSelectOne(Favorite favorite){
		return sqlSession.selectOne("favorite.favoriteSelectOne", favorite);
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
