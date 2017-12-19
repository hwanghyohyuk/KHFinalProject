package com.kh.everycvs.favorite.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Favorite;

public interface FavoriteService {

	public List favoriteList(int user_no);
	
	public ModelAndView favoriteInsert(HttpServletRequest request);
	
	public void favoriteDelete(Favorite favorite);
}
