package com.kh.everycvs.event.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.event.model.dao.EventDao;

@Service("EventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eventdao;

	@Override
	public String selectEventList(HttpServletRequest request) {
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
	public int eventInsert(Event eventvo){
		return eventdao.eventInsert(eventvo);
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
