package com.kh.everycvs.favorite.model.service;

import java.util.List;
import com.kh.everycvs.common.model.vo.Favorite;

public interface FavoriteService {

	public List<Favorite> favoriteList(int user_no, int category, String keyword);
		
	public Favorite favoriteSelectOne(Favorite favorite);
	
	public void favoriteInsert(Favorite favorite);
	
	public void favoriteDelete(Favorite favorite);

	public List<Favorite> userFavoriteList(int user_no, String storeNo);
	
}
