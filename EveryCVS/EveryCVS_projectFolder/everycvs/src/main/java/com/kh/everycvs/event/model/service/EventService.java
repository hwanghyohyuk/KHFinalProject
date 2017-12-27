package com.kh.everycvs.event.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.EventJoin;
import com.kh.everycvs.common.model.vo.EventResult;

public interface EventService {
	/*사용자 : 이벤트 메인*/
	List<Event> eventList();
	/*사용자 : 메인화면 이벤트 top3*/
	List<Event> eventTop3();
	
	//관리자 게시글 갯수 조회
	int getListCount(String keyword, int user_no);

	// 관리자 이벤트 조회 : 모든 공식이벤트를 조회 및 검색
	public List<Event> selectEventList(String keyword, int currentPage, int limit, int user_no);
	
	//관리자 상세 조회
	public Event cvsEventDetail(int eno);
	
	//관리자 이벤트 글작성
	public void eventInsert(Event vo);
	
	// 관리자 이벤트 수정하기로 이동
	Event updateEvent(int no);
	
	//관리자 이벤트 수정하기
	public int updateEventPage(Event event);
		
	// 이벤트 조회수 증가
	int eventReadCount(int no);
	
	// 사용자 이벤트 조회 : 선택한 이벤트 상세조회
	Event selectEventOne(int no);
	
	// 관리자 이벤트 삭제
	int eventDelete(int no);
	
	
	// 이벤트 검색 : 제목으로 검색
	public ModelAndView searchEventList(HttpServletRequest request);

	
	//사용자 이벤트 결과 리스트 
	List<EventResult> resultEventList(String keyword, int currentPage, int limit);
	//사용자 이벤트 디테일
	EventResult selectEventResultOne(int rno);
	//사용자 게시글 조회수 증가
	int eventResultRead(int rno);
	
	
	//이벤트 참여
	ArrayList<EventJoin> selectEventJoinList();
	EventJoin selectEventJoin(EventJoin eventjoin); 
	int eventJoinCount(int event_no);
	
	int eventJoincheck(EventJoin eventjoin);
	void eventJoin(EventJoin eventjoin);
	
	void deleteJoin(EventJoin eventjoin);
	//아직 못끝냄
	
	
	void eventResultInsert(EventResult eventResult);
	
	//편의점 별 사용자 이벤트
	List<Event> cvsEvent(int currentpage, int limit, int brand_no);
	//편의점별 리스트 카운트
	int getListCount(int brand_no, int user_no);
	
	//----------------------------

	//진행중인 이벤트 종료된 이벤트 따져보기
	List<Event> selectEndEventList(int currentPage, int limit, int edno);
	//진행중,종료된 이벤트 리스트 가져오기
	int getedListCount(int edno);
	
	
	
	
	
	

	
	
	
	
	
	
}
