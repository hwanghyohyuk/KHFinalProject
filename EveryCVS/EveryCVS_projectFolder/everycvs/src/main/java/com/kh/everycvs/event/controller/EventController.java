package com.kh.everycvs.event.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.event.model.service.EventService;

import net.sf.json.JSONObject;


@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	
	// 이벤트 리스트 이건 유저 뷰인데 다시작업해야함
	/*@RequestMapping(value="eventList.do", method=RequestMethod.GET)
	public ModelAndView selectEventList(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("event/eventlist");
		ArrayList<Event> list = eventService.selectEventList();
		mv.addObject("list", list);
		return mv;
	}*/

	
	
	// 이벤트 조회 : 선택한 이벤트 상세조회 이것또한 마찬가지
	/*@RequestMapping(value="eventDetail.do", method=RequestMethod.GET)
	public ModelAndView selectEventOne(@RequestParam int no) {
		ModelAndView mv = new ModelAndView("event/eventDetail");
		Event et = eventService.selectEventOne(no);
		int ad = eventService.eventReadCount(no);
		mv.addObject("ad",ad);
		mv.addObject("et",et);
		return mv;
	}*/
	
	
	// 업체명 검색
	@RequestMapping(value="eventSearch.do", method=RequestMethod.GET)
	public ModelAndView searchEventList(HttpServletRequest request) {
		return null;
	}
	
	
	/* 이거는 나중에 관리자꺼로 바꾸자 사용자 없어 보는게*/
	/*글작성 시작 -----------------------------------------------------*/
	//글쓰기 페이지 이동
	/* @RequestMapping(value ="eventInsert.do", method = RequestMethod.GET)
     public String eventInsert() {
        return "event/eventWhirtForm";
     }*/
	 
	// 글쓰기 페이지 저장
/*	@RequestMapping(value="eventInsert.do", method=RequestMethod.POST)
	public String insertEvent(Event eventvo) {
		  System.out.println(eventvo);
          int result = eventService.eventInsert(eventvo);
                 return "redirect:/eventList.do";
	}*/
	/*글작성 끝 --------------------------------------------------------*/
		
	
	
	
	
	//--------------------------- 이벤트 관리자 리스트 페이징 시작 -----------------------------------
	// 편의점 관리자 
	// 이벤트 조회 : 모든 공식이벤트를 조회
	@RequestMapping(value = "cvseventlist.do", method = RequestMethod.GET)
	public ModelAndView eventLis(@RequestParam(value="keyword",required = false, defaultValue="") String keyword, String page){
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/cvsmanager/eventList");
		  int currentPage = 1;
          int limit = 10;
          List<Event> list = eventService.selectEventList(keyword,currentPage, limit);
                System.out.println("list : " + list);
          Map<String, Object> map = new HashMap<String, Object>();
          int listCount = eventService.getListCount(keyword);
          int maxPage = (int) ((double) listCount / limit + 0.9);
          int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
          int endPage = startPage + limit - 1;
           if (maxPage < endPage)
                   endPage = maxPage;
           
           	map.put("currentPage", currentPage);
            map.put("listCount", listCount);
            map.put("maxPage", maxPage);
            map.put("startPage", startPage);
            map.put("endPage", endPage);
            map.put("limit", limit);
            map.put("list", list);
          mv.addObject("event", map);      
          return mv;
			
	/*	날짜별로 바꾸는것 해야함
	 * int code = Integer.parseInt(request.getParameter("code"));
		if(code == 1) {
			// 진행 중인 이벤트 리스트 조회
		}else if (code == 2) {
			// 종료된 이벤트 리스트 조회
		}*/
	}
	@RequestMapping(value="pageload.do")
	@ResponseBody
    public ModelAndView pageload(ModelAndView mv, @RequestParam("page") int page, HttpServletRequest request,@RequestParam(value="keyword",required = false, defaultValue="") String keyword) {
		 int currentPage = page;
         int limit = 10;
         List<Event> list = eventService.selectEventList(keyword, currentPage, limit);
         
         Map<String, Object> map = new HashMap<String, Object>();
         int listCount = eventService.getListCount(keyword);
         int maxPage = (int) ((double) listCount / limit + 0.9);
         int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
         int endPage = startPage + limit - 1;
          if (maxPage < endPage) {
                  endPage = maxPage;
          }
          
          map.put("currentPage", currentPage);
          map.put("listCount", listCount);
          map.put("maxPage", maxPage);
          map.put("startPage", startPage);
          map.put("endPage", endPage);
          map.put("limit", limit);
            
          JSONArray jar = new JSONArray();
            
          for(Event ev : list)
            {
               JSONObject jev = new JSONObject();
               jev.put("event_no", ev.getEvent_no());
               jev.put("title", ev.getTitle());
               jev.put("start_date",ev.getStart_date().toString());
               jev.put("end_date", ev.getEnd_date().toString());
               jev.put("readcount", ev.getReadcount());
               jar.add(jev);
            }
            
           map.put("list", jar);
           mv.addAllObjects(map);
           mv.setViewName("jsonView");
         
         return mv;
		
	}
	
	//관리자 디테일
	@RequestMapping(value = "cvsEventDetail.do")
	@ResponseBody
	 public Event cvsEventDetail(@RequestParam("eno") int eno) throws Exception{
		eventService.eventReadCount(eno);
		Event event = eventService.cvsEventDetail(eno);	
		return event;
	}
		
	/*	날짜별로 바꾸는것 해야함
	 * int code = Integer.parseInt(request.getParameter("code"));
		if(code == 1) {
			// 진행 중인 이벤트 리스트 조회
		}else if (code == 2) {
			// 종료된 이벤트 리스트 조회
		}*/
	
	
	
	// 글 쓰 기 ------------------------------------------
	// whriteForm 으로 이동
	@RequestMapping(value="cvseventwriteview.do", method = RequestMethod.GET)
	public String cvsEventWriteView() {
		return "admin/cvsmanager/eventWriteForm";
	}
	//게시글 저장
	@RequestMapping(value="cvseventwrite.do", method= RequestMethod.POST)
	public String cvsEventWrite(Event event) throws Exception {
        eventService.eventInsert(event);
         return "redirect:/cvseventlist.do";
	}
	//글쓰기 끝 -------------------------------------------
	
	/*이제 수정*/
	//이벤트 수정 페이지 이동
	@RequestMapping(value="cvseventmodifyview.do")
	public ModelAndView cvsEventModifyView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView("admin/cvsmanager/eventModifyForm");
		Event event = eventService.updateEvent(no);
		mv.addObject("event", event);
		return mv;
	
	}
	//이벤트 수정하기
	@RequestMapping(value="cvseventmodifywrite.do", method = RequestMethod.POST)
	public String cvsEventModiftwriter(Event event) {
		System.out.println(event);
	
		int resultUpdate = eventService.updateEventPage(event);
		String result = null;
	
		return "redirect:/cvseventlist.do";
		
	}

	// 이벤트 삭제
	@RequestMapping(value="eventDelete.do")
	public String deleteEvent(@RequestParam int no) {
		eventService.eventDelete(no);
		return "redirect:/cvseventlist.do";
	}
	

}
