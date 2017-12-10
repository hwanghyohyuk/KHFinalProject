package com.kh.everycvs.event.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;

public interface EventService {
	
	// 이벤트 조회 : 모든 공식이벤트를 조회
	public String selectEventList(HttpServletRequest request);
	
	// 이벤트 조회 : 선택한 이벤트 상세조회
	public ModelAndView selectEventOne(HttpServletRequest request);
	
	// 이벤트 검색 : 제목으로 검색
	public ModelAndView searchEventList(HttpServletRequest request);
	
	// 이벤트 등록
	int eventInsert(Event eventvo);
	
	// 이벤트 수정
	public String updateEvent(HttpServletRequest request);
	
	// 이벤트 삭제
	public String deleteEvent(HttpServletRequest request);
	
}
