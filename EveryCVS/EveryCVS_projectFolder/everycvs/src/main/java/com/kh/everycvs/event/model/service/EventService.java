package com.kh.everycvs.event.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.Product;

public interface EventService {
	/*사용자 : 이벤트 메인*/
	List<Event> eventList();
	/*사용자 : 메인화면 이벤트 top3*/
	List<Product> eventTop3();
	
	//게시글 갯수 조회
	int getListCount(String keyword);

	// 이벤트 조회 : 모든 공식이벤트를 조회
	public List<Event> selectEventList(String keyword, int currentPage, int limit);
	
	
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
	
	//관리자 상세 조회
	public Event cvsEventDetail(int eno);
	
	
	// 이벤트 수정하기로 이동
	Event updateEvent(int no);
	
	//이벤트 수정하기
	public int updateEventPage(Event event);


	




	


	
	

	
}
