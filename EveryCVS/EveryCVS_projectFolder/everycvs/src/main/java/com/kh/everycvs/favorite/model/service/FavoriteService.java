package com.kh.everycvs.favorite.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Favorite;

public interface FavoriteService {

	public ArrayList<Favorite> favoriteList();
	
	public ModelAndView favoriteInsert(HttpServletRequest request);
	
	public void favoriteDelete();
}
