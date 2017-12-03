package com.kh.everycvs.favorite.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface FavoriteService {

	public ModelAndView favoriteList(HttpServletRequest request);
	
	public ModelAndView favoriteInsert(HttpServletRequest request);
	
	public void favoriteDelete();
}
