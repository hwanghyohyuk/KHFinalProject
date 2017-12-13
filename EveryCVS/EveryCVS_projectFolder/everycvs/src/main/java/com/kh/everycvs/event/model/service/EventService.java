package com.kh.everycvs.event.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;

public interface EventService {
	
	// 이벤트 조회 : 모든 공식이벤트를 조회
	public List<Event>selectEventList() throws Exception;
	
	//이벤트 글작성
	public void eventInsert(Event vo);
	
	
	// 이벤트 조회수 증가
	int eventReadCount(int no);
	
	// 이벤트 조회 : 선택한 이벤트 상세조회
	Event selectEventOne(int no);
	
	// 이벤트 삭제
	int eventDelete(int no);
	
	
	//-------------------------- 절취선 ---------------//
	
	
	
	
	
	
	// 이벤트 검색 : 제목으로 검색
	public ModelAndView searchEventList(HttpServletRequest request);
	

	
	// 이벤트 수정
	public String updateEvent(HttpServletRequest request);

	


	
	

	
}
