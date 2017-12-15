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

import com.kh.everycvs.event.model.dao.EventDao;

@Service("eventService")
public class EventServiceImpl implements EventService{
	
	@Autowired
	private EventDao eventDao;
	
	@Override
	public int getListCount(String keyword) {
		// 게시글  조회
		return eventDao.listCount(keyword);
	}
	
	@Override
	public List<Event> selectEventList(String keyword,int currentPage, int limit){
	      int startRow = (currentPage - 1) * limit + 1;
	      int endRow = startRow + limit - 1;        
	      return eventDao.selectEventList(keyword,startRow,endRow);
	}

	@Override
	public Event selectEventOne(int no) {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		return eventDao.selectEventOne(no);
	}
	
	@Override
	public void eventInsert(Event vo) {
	        eventDao.cvseventwriteview(vo);
	}

	
	@Override
	public int eventReadCount(int no) {
		return eventDao.eventReadCount(no);
	}
	
	@Override
	public int eventDelete(int no) {
		// 이벤트 삭제
		return eventDao.eventDelete(no);
	}
	
	@Override
	public ModelAndView searchEventList(HttpServletRequest request) {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}
	
	@Override
	public Event cvsEventDetail(int eno) {
		// 관리자 디테일
		return eventDao.cvsEventDetail(eno);
	}

	@Override
	public Event updateEvent(int no) {
		// 수정하기로 이동
		return eventDao.updateEvent(no);
	}

	@Override
	public int updateEventPage(Event event) {
		// 수정하기 
		return eventDao.updateEventPage(event);
	}

	

}
