package com.kh.everycvs.favorite.model.service;

import java.util.ArrayList;

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
	public ArrayList<Favorite> favoriteList() {
		//관심상품목록 조회
		ArrayList<Favorite> flist = new ArrayList<Favorite>();
		System.out.println(flist);
		return (ArrayList<Favorite>) favoriteDao.favoriteList();
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
