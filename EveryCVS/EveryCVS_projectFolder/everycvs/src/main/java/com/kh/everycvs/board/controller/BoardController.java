package com.kh.everycvs.board.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.board.model.service.BoardService;

@Controller
public class BoardController {
	Logger log = Logger.getLogger(this.getClass());
	
	@Autowired
	private BoardService boardService;

	//자유게시판 : 목록
	
	//자유게시판 : 상세보기
	
	//자유게시판 : 글쓰기
	
	//자유게시판 : 글수정
	
	//자유게시판 : 글삭제
	
	//자유게시판 : 검색
	
	/*사이트관리자 커뮤니티 관리 페이지*/
	@RequestMapping("/admin/manageCmnt.do")
	public ModelAndView manageService(@RequestParam(value = "p", required = false, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword){
		ModelAndView mv = new ModelAndView("admin/sitemanager/communitymanage");
		
		return mv;
	}
}
