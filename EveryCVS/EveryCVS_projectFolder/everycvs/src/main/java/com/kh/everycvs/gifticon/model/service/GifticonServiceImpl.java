package com.kh.everycvs.gifticon.model.service;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Gifticon;
import com.kh.everycvs.gifticon.model.dao.GifticonDao;

@Service("GifticonService")
public class GifticonServiceImpl implements GifticonService{

	@Autowired
	private GifticonDao gifticonDao;
	
	@Override
	public ModelAndView createGifticon(HttpServletRequest request) {
		//기프티콘 생성
		return null;
	}

	@Override
	public ArrayList<Gifticon> listGifticon() {
		//기프티콘 조회
		return (ArrayList<Gifticon>) gifticonDao.listGifticon();
	}

	@Override
	public String deleteGifticon(HttpServletRequest request, HttpServletResponse response) {
		//기프티콘 삭제
		return null;
	}

}
