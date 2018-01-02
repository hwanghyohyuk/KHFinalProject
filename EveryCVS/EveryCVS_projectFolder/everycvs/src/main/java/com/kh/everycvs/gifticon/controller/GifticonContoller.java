package com.kh.everycvs.gifticon.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Gifticon;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.gifticon.model.service.GifticonService;


@Controller
public class GifticonContoller {

	@Autowired
	private GifticonService gifticonService;
	
	//상품 결제 시 보관함에 기프티곤 생성
	@RequestMapping(value = "createGifticon.do")
	public ModelAndView createGifticon(ModelAndView mv) {
		return mv;
	}
	
	//기프티콘 삭제 : 기프티콘 사용 후 리스트에서 삭제
	/*@RequestMapping(value="deleteGifticon.do")
	public ModelAndView deleteGifticon(Gifticon gifticon, ModelAndView mv) {
	
	}*/
	
	//기프티콘 페이지로 이동
	@RequestMapping(value = "gifticonPage.do")
	public ModelAndView gifticonPage(ModelAndView mv, HttpSession session){
		//기프티콘 목록조회
		User user = (User) session.getAttribute("user");
		ArrayList<Gifticon> glist = gifticonService.listGifticon(user.getUser_no());
		
		mv.addObject("glist", glist);
		
		mv.setViewName("user/mypage/gifticonPage");
		return mv;
		}
	
	
}
