package com.kh.everycvs.board.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

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
}
