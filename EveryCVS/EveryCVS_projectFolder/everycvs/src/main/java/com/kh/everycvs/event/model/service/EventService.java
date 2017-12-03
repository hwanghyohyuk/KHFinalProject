package com.kh.everycvs.event.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

public interface EventService {
	
	// 이벤트 조회 : 모든 공식이벤트를 조회
	public ModelAndView selectEventList(HttpServletRequest request);
	
	// 이벤트 조회 : 선택한 이벤트 상세조회
	public ModelAndView selectEventOne(HttpServletRequest request);
	
	// 이벤트 검색 : 제목으로 검색
	public ModelAndView searchEventList(HttpServletRequest request);
	
	// 이벤트 등록
	public String insertEvent(HttpServletRequest request);
	
	// 이벤트 수정
	public String updateEvent(HttpServletRequest request);
	
	// 이벤트 삭제
	public String deleteEvent(HttpServletRequest request);
	
	//이벤트 참여 여부
	public String participateEvent(HttpServletRequest request);

	// 이벤트 당첨자 리스트 출력
	public ModelAndView winEvent(HttpServletRequest request);
	
}
