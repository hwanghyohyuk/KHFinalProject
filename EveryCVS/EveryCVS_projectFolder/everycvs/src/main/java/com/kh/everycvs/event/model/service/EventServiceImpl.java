package com.kh.everycvs.event.model.service;


import java.sql.Date;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

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
	public List<Event> selectEventList() throws Exception {
		// 이벤트 조회 : 모든 공식이벤트를 조회
		return eventdao.selectEventList();
	}

	@Override
	public Event selectEventOne(int no) {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		return eventdao.selectEventOne(no);
	}
	
	@Override
	public void eventInsert(Event vo) {
		String title = vo.getTitle();
		int writer = vo.getWriter();
		String contents = vo.getContents();
		
		 	title = title.replace("<", "&lt;");
	        title = title.replace("<", "&gt;");
	        // *공백문자 처리
	        title = title.replace("  ",    "&nbsp;&nbsp;");
	      
	        // *줄바꿈 문자처리
	        contents = contents.replace("\n", "<br>");
	        vo.setTitle(title);
	        vo.setContents(contents);
	        vo.setWriter(writer);
	        eventdao.cvseventwriteview(vo);
	}

	
	@Override
	public int eventReadCount(int no) {
		return eventdao.eventReadCount(no);
	}
	
	@Override
	public int eventDelete(int no) {
		// 이벤트 삭제
		return eventdao.eventDelete(no);
	}
	
	@Override
	public ModelAndView searchEventList(HttpServletRequest request) {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}
	
	
	@Override
	public String updateEvent(HttpServletRequest request) {
		// 이벤트 수정
		return null;
	}

	
	

}
