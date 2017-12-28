package com.kh.everycvs.event.model.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.EventJoin;
import com.kh.everycvs.common.model.vo.EventResult;
import com.kh.everycvs.event.model.dao.EventDao;

@Service("eventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eventDao;
	
	/*사용자 : 이벤트 목록*/
	@Override
	public List<Event> eventList() {
			return eventDao.eventList();
	}

	/*사용자 : 메인화면 이벤트 top3*/
	@Override
	public List<Event> eventTop3() {
		return eventDao.eventTop3();
	}

	@Override
	public int getListCount(String keyword, int user_no) {
		// 관리자 게시글  조회
		return eventDao.listCount(keyword, user_no);
	}
	
	@Override
	public List<Event> selectEventList(String keyword,int currentPage, int limit, int user_no){
		//관리자 페이징 및 검색
	    int startRow = (currentPage - 1) * limit + 1;
	    int endRow = startRow + limit - 1;        
	    return eventDao.selectEventList(keyword,startRow,endRow,user_no);
	}

	@Override
	public Event selectEventOne(int no) {
		// 관리자 이벤트 조회 : 선택한 이벤트 상세조회
		return eventDao.selectEventOne(no);
	}
	
	@Override
	public void eventInsert(Event vo) {
		//관리자 글 작성 폼으로 이동
	        eventDao.cvseventwriteview(vo);
	}
	
	@Override
	public int eventReadCount(int no) {
		//조회수 증가
		return eventDao.eventReadCount(no);
	}
	
	@Override
	public int eventDelete(int no) {
		// 이벤트 삭제
		return eventDao.eventDelete(no);
	}
	
	@Override
	public Event cvsEventDetail(int eno) {
		// 관리자 디테일
		return eventDao.cvsEventDetail(eno);
	}
	@Override
	public Event updateEvent(int no) {
		// 관리자 수정하기로 이동
		return eventDao.updateEvent(no);
	}
	@Override
	public int updateEventPage(Event event) {
		// 수정하기 
		
		return eventDao.updateEventPage(event);
	}

	@Override
	public ModelAndView searchEventList(HttpServletRequest request) {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}

	@Override
	public List<EventResult> resultEventList(String keyword, int currentPage, int limit) {
		//관리자 페이징 및 검색
	    int startRow = (currentPage - 1) * limit + 1;
	    int endRow = startRow + limit - 1;        
	    return eventDao.resultEventList(keyword, startRow, endRow);
	}

	
	@Override
	public EventResult selectEventResultOne(int rno) {
		//사용자  이벤트 결과 디테일
		return eventDao.eventResultDetail(rno);
	}

	@Override
	public int eventResultRead(int rno) {
		// 이벤트 결과 조회수 증가
		return eventDao.eventResultReadCount(rno);
	}
	
	
	
	//이벤트 참여 하기 시작
	
	//이벤트 참여 테이블 갯수 조회
	@Override
	public ArrayList<EventJoin> selectEventJoinList() {
		
		ArrayList<EventJoin> list = eventDao.selectEventJoinList();
		return list;
	}
	//객체를 반환
	@Override
	public EventJoin selectEventJoin(EventJoin eventjoin) {
		// TODO Auto-generated method stub
		return eventDao.selectEventJoin(eventjoin);
	}
	
	//이벤트 참여 테이블에 있는지 확인
	@Override
	public int eventJoincheck(EventJoin eventjoin) {
		return eventDao.eventJoincheck(eventjoin);
	}
	//참여인원 카운트
	@Override
	public int eventJoinCount(int event_no) {
		// TODO Auto-generated method stub
		return eventDao.eventJoinCount(event_no);
	}
	
	
	@Override
	public void eventJoin(EventJoin eventjoin) {
		// TODO Auto-generated method stub
		System.out.println("sevice"+eventjoin);
		eventDao.insertEventJoin(eventjoin);
		
	}
	
	@Override
	public void deleteJoin(EventJoin eventjoin) {
		// TODO Auto-generated method stub
		eventDao.deleteEventJoin(eventjoin);
	}
	

	@Override
	public void eventResultInsert(EventResult eventResult) {
		 eventDao.cvseventResultView(eventResult);
	}

	
	//유저 이벤트 검색하기
	@Override
	public List<Event> cvsEvent(int currentpage, int limit, int edno, int brand_no) {
		int startRow = (currentpage - 1) * limit + 1;
	    int endRow = startRow + limit - 1;        
	    return eventDao.cvsEvent(startRow,endRow,edno,brand_no);
	}
	//유저 이벤트 검색해서 갯수 가져오기
	@Override
	public int getListCount(int edno, int brand_no) {
		return eventDao.cvsGetListCount(edno,brand_no);
	}
	//---------------------------------------------------------


	

	
	


	

}
