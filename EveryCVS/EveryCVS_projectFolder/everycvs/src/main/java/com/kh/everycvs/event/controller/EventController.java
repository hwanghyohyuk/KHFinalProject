package com.kh.everycvs.event.controller;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.event.model.service.EventService;

@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 이벤트 조회 : 모든 공식이벤트를 조회
	@RequestMapping(value="eventAll.do", method=RequestMethod.GET)
	public String selectEventList(HttpServletRequest request) {
		return "event/eventlist";
	}
	
	
	// 이벤트 조회 : 선택한 이벤트 상세조회
	@RequestMapping(value="eventDetail.do", method=RequestMethod.GET)
	public ModelAndView selectEventOne(HttpServletRequest request) {
		return null;
	}
	
	// 업체명 검색
	@RequestMapping(value="eventSearch.do", method=RequestMethod.GET)
	public ModelAndView searchEventList(HttpServletRequest request) {
		return null;
	}
	
	
	
	
	
	
	
	
	/*글작성 시작 -----------------------------------------------------*/
	//글쓰기 페이지 이동
	 @RequestMapping(value ="eventInsert.do", method = RequestMethod.GET)
     public String eventInsert() {
        return "event/eventWhirtForm";
     }
	 
	// 글쓰기 페이지 저장
	@RequestMapping(value="eventInsert.do", method=RequestMethod.POST)
	public String insertEvent(Event eventvo) {
		  System.out.println(eventvo);
          int result = eventService.eventInsert(eventvo);
          //1이상 result 값이면 리스트로이동 
             return "redirect:/eventAll.do";
          
	}
	/*글작성 끝 --------------------------------------------------------*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 이벤트 수정
	@RequestMapping(value="eventUpdate.do", method=RequestMethod.GET)
	public String updateEvent(HttpServletRequest request) {
		return null;
	}
	
	// 이벤트 삭제
	@RequestMapping(value="eventDelete.do", method=RequestMethod.GET)
	public String deleteEvent(HttpServletRequest request) {
		return null;
	}

}
