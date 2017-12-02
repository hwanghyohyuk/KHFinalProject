package com.kh.everycvs.gifticon.model.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;

public interface GifticonService {

	//상품 결제 시 보관함에 기프티곤 생성
	public ModelAndView createGifticon(HttpServletRequest request);
		
	//기프티콘 목록 조회 : 기프티콘 보관함에 결제한 기프티콘 목록을 보여줌
	public ModelAndView listGifticon(HttpServletRequest request, HttpServletResponse response);
	
	//기프티콘 삭제 : 기프티콘 사용 후 리스트에서 삭제
	public String deleteGifticon(HttpServletRequest request, HttpServletResponse response);
}
