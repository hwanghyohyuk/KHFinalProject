package com.kh.everycvs.favorite.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Favorite;
import com.kh.everycvs.favorite.model.dao.FavoriteDao;

@Service("FavoriteServiceImpl")
public class FavoriteServiceImpl implements FavoriteService{

	@Autowired
	private FavoriteDao favoriteDao;
	
	@Override
	public List favoriteList(int user_no) {
		//관심상품목록 조회
		return favoriteDao.favoriteList(user_no);
	}

	@Override
	public ModelAndView favoriteInsert(HttpServletRequest request) {
		//관심상품 추가
		return null;
	}

	@Override
	public void favoriteDelete() {
		//관심상품 삭제
		
	}

}
