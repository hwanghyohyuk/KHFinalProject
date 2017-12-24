package com.kh.everycvs.favorite.model.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.favorite.model.dao.FavoriteDao;

@Service("FavoriteServiceImpl")
public class FavoriteServiceImpl implements FavoriteService {

	@Autowired
	private FavoriteDao favoriteDao;

	@Override
	public List<Favorite> favoriteList(int user_no, int category, String keyword) {
		return favoriteDao.favoriteList(user_no,category,keyword);
	}

	@Override
	public Favorite favoriteSelectOne(Favorite favorite) {
		// 관심상품 1개 조회
		return favoriteDao.favoriteSelectOne(favorite);
	}

	@Override
	public void favoriteInsert(Favorite favorite) {
		// 관심상품 추가
		favoriteDao.favoriteInsert(favorite);
	}

	@Override
	public void favoriteDelete(Favorite favorite) {
		// 관심상품 삭제
		favoriteDao.favoriteDelete(favorite);
	}

}
