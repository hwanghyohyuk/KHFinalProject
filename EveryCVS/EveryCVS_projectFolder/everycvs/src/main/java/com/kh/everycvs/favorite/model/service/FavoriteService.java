package com.kh.everycvs.favorite.model.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface FavoriteService {

	public List favoriteList(int user_no);
	
	public ModelAndView favoriteInsert(HttpServletRequest request);
	
	public void favoriteDelete();
}
