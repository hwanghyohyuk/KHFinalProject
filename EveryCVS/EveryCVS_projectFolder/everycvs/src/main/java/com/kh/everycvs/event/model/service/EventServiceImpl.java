package com.kh.everycvs.event.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service("EventService")
public class EventServiceImpl implements EventService{

	@Override
	public ModelAndView selectEventList(HttpServletRequest request) {
		// 이벤트 조회 : 모든 공식이벤트를 조회
		return null;
	}

	@Override
	public ModelAndView selectEventOne(HttpServletRequest request) {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		return null;
	}

	@Override
	public ModelAndView searchEventList(HttpServletRequest request) {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}

	@Override
	public String insertEvent(HttpServletRequest request) {
		// 이벤트 등록
		return null;
	}

	@Override
	public String updateEvent(HttpServletRequest request) {
		// 이벤트 수정
		return null;
	}

	@Override
	public String deleteEvent(HttpServletRequest request) {
		// 이벤트 삭제
		return null;
	}

}
