package com.kh.everycvs.event.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.event.model.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 이벤트 조회 : 모든 공식이벤트를 조회
	public ModelAndView selectEventList(HttpServletRequest request) {
		return null;
	}
	
	// 이벤트 조회 : 선택한 이벤트 상세조회
	public ModelAndView selectEventOne(HttpServletRequest request) {
		return null;
	}
	
	// 이벤트 검색 : 제목으로 검색
	public ModelAndView searchEventList(HttpServletRequest request) {
		return null;
	}
	
	// 이벤트 등록
	public String insertEvent(HttpServletRequest request) {
		return null;
	}
	
	// 이벤트 수정
	public String updateEvent(HttpServletRequest request) {
		return null;
	}
	
	// 이벤트 삭제
	public String deleteEvent(HttpServletRequest request) {
		return null;
	}

}
