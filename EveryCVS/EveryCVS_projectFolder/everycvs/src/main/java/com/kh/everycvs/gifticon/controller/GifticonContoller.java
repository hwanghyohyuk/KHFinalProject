package com.kh.everycvs.gifticon.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.gifticon.model.service.GifticonService;

@Controller
public class GifticonContoller {

	@Autowired
	private GifticonService giftconService;
	
	//상품 결제 시 보관함에 기프티곤 생성
	public ModelAndView createGifticon(HttpServletRequest request) {
		return null;
	}
	
	//기프티콘 목록 조회 : 기프티콘 보관함에 결제한 기프티콘 목록을 보여줌
	public ModelAndView listGifticon(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}
	
	//기프티콘 삭제 : 기프티콘 사용 후 리스트에서 삭제
	public String deleteGifticon(HttpServletRequest request, HttpServletResponse response) {
		return null;
	}
	
	//기프티콘 페이지로 이동
	@RequestMapping(value = "gifticonPage.do")
	public ModelAndView gifticonPage(ModelAndView mv){
		mv = new ModelAndView("user/mypage/gifticonPage");
		return mv;
		}
	
	
}
