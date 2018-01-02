package com.kh.everycvs.event.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.EventJoin;
import com.kh.everycvs.common.model.vo.EventResult;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.common.util.FileUtils;
import com.kh.everycvs.event.model.service.EventService;

import net.sf.json.JSONObject;


@Controller
public class EventController {
	
	@Autowired
	private EventService eventService;
	//---------------------------사용자----------------------------------
	/*사용자 : 이벤트 메인*/
	@RequestMapping(value="test/page/eventmain.do", method=RequestMethod.GET)
	public ModelAndView eventList(ModelAndView mv) {
		mv.setViewName("event/eventlist");
		List<Event> list = eventService.eventList();
		mv.addObject("list", list);
		return mv;
	}

	// 유저 이벤트 리스트
	@RequestMapping(value="/page/eventmain.do", method=RequestMethod.GET)
	public String selectEventList() {		
		return "event/eventlist";
	}	
	
	//사용자 메인
	@RequestMapping(value="/ajax/cvsevent.do", method=RequestMethod.POST)
	@ResponseBody
	public Map<String,Object> cvsEvent(@RequestParam("brandNo")int brand_no,@RequestParam("edno")int edno,
			@RequestParam("page") int page){
		Map<String,Object> map = new HashMap<String, Object>();
		
		int currentPage = page;
        int limit = 6;
        List<Event> cvsEventList = eventService.cvsEvent(currentPage, limit, edno, brand_no);    
        int listCount = eventService.getListCount(edno, brand_no);
        int maxPage = (int) ((double) listCount / limit + 0.94);
        int startPage = (((int) ((double) currentPage / limit + 0.94)) - 1) * limit + 1;
        int endPage = startPage + limit - 1;
         if (maxPage < endPage)
                 endPage = maxPage;
         
         map.put("elist", cvsEventList);		
         map.put("currentPage", currentPage);
         map.put("listCount", listCount);
         map.put("maxPage", maxPage);
         map.put("startPage", startPage);
         map.put("endPage", endPage);
         map.put("limit", limit);
		
		return map;
	}
	
	//사용자 이벤트 결과 리스트를 보여주는 화면
	@RequestMapping(value = "eventresultlist.do", method = RequestMethod.GET)
	public ModelAndView eventResultList(@RequestParam(value="keyword",required = false, defaultValue="") String keyword, String page, HttpSession session,
			@RequestParam(value="edno")int edno) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("event/result/eventresultlist");
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		int currentPage = 1;
	    int limit = 10;
	       List<EventResult> list = eventService.resultEventList(keyword,currentPage, limit);
	                System.out.println("이벤트결과list : " + list);
	          Map<String, Object> map = new HashMap<String, Object>();
	          int listCount = eventService.getListCount(edno,keyword,user_no);
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
	          mv.addObject("ewlevent", map);
	          
	          return mv;
	          
		}
	
	//사용자 이벤트 결과 상세조회
	@RequestMapping(value="eventwin.do", method=RequestMethod.GET)
	public ModelAndView eventResultWin(@RequestParam int rno) {
		ModelAndView mv = new ModelAndView("event/result/eventWin");
		EventResult ert = eventService.selectEventResultOne(rno);
		int rad = eventService.eventResultRead(rno);
		mv.addObject("ert",ert);
		mv.addObject("rad",rad);
		return mv;
		
	}
	
	// 사용자 이벤트 조회 : 선택한 이벤트 상세조회
	@RequestMapping(value="eventDetail.do", method=RequestMethod.GET)
	public ModelAndView selectEventOne(@RequestParam int no,HttpSession session) {
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		ModelAndView mv = new ModelAndView("event/eventDetail");
		Event et = eventService.selectEventOne(no);
		int ad = eventService.eventReadCount(no);
		EventJoin eventJoin = new EventJoin(no,user_no);
		int isJoin = eventService.eventJoincheck(eventJoin);
		mv.addObject("ad",ad);
		mv.addObject("et",et);
		mv.addObject("isJoin",isJoin);
		return mv;
	
	}
	
	// 업체명 검색
	@RequestMapping(value="eventSearch.do", method=RequestMethod.GET)
	public ModelAndView searchEventList(HttpServletRequest request) {
		return null;
	}
	
	
	
	//--------------------------- 검색 및 이벤트 결과 글쓰기 해야함----------------------------------
	// 편의점 관리자 
	// 이벤트 조회 : 모든 공식이벤트를 조회 및 제목 + 내용 검색 edno가 안넘어와서 검색 에러 ...
	@RequestMapping(value = "cvseventlist.do", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> eventLis(@RequestParam("edno")int edno,
			@RequestParam("page") int page, @RequestParam(value="keyword",required = false, defaultValue="") String keyword, 
			HttpSession session){
		Map<String,Object> map = new HashMap<String, Object>();
		
		  int currentPage = page;
          int limit = 10;
          
          System.out.println("edno:"+edno);
          System.out.println("keyword"+keyword);
          
          int user_no = ((User)session.getAttribute("user")).getUser_no();
          List<Event> list = eventService.selectEventList(keyword,currentPage, limit, user_no, edno);
                System.out.println("관리자list : " + list);
         
          int listCount = eventService.getListCount(edno,keyword,user_no);
          
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
            
          return map;   
    }
	//관리자 이벤트 리스트 이동
	@RequestMapping(value = "cvseventlist.do", method = RequestMethod.GET)
	public ModelAndView eventLis(ModelAndView mv,@RequestParam("code")int code,HttpSession session){
		mv.setViewName("admin/cvsmanager/eventList");
		mv.addObject("code", code);
		System.out.println("code:"+code);
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
			
	// 글 쓰 기 ------------------------------------------
	// whriteForm 으로 이동
	@RequestMapping(value="cvseventwriteview.do", method = RequestMethod.GET)
	public String cvsEventWriteView() {
		return "admin/cvsmanager/eventWriteForm";
	}
	//게시글 저장
	@RequestMapping(value="cvseventwrite.do", method= RequestMethod.POST)
	public String cvsEventWrite(HttpSession session, HttpServletRequest request) throws Exception {
		int user_no = ((User)session.getAttribute("user")).getUser_no();
		
		
		String file_name = new FileUtils().InsertFile(session, request);
		
		String[] file = file_name.split("/");
		
		Event event = new Event();		
		event.setWriter(Integer.parseInt(request.getParameter("writer")));
		event.setTitle(request.getParameter("title"));
		event.setStart_date(java.sql.Date.valueOf(request.getParameter("start_date")));
		event.setEnd_date(java.sql.Date.valueOf(request.getParameter("end_date")));
		event.setJoin_limit(Integer.parseInt(request.getParameter("join_limit")));
		event.setContents(request.getParameter("contents"));
		event.setOriginal_file_name(file[0]);
		event.setStored_file_name(file[1]);
		
			
        eventService.eventInsert(event);
         return "redirect:/cvseventlist.do";
	}
	//글쓰기 끝 -------------------------------------------
	
	//이벤트 결과 글쓰기
	// ResultwhriteForm 으로 이동
	@RequestMapping(value="cvseventResultView.do", method = RequestMethod.GET)
	public String cvseventResultView() {
		return "admin/cvsmanager/eventResultWrite";
	}
	@RequestMapping(value="cvsevenResultWrite.do", method= RequestMethod.POST)
	public String cvsEventResultWrite(EventResult eventResult) throws Exception {
		  eventService.eventResultInsert(eventResult);
         return "redirect:/eventresultlist.do";
	}
	//--------------------------------------------------
	
	
	//이벤트 수정 페이지 이동
	@RequestMapping(value="cvseventmodifyview.do")
	public ModelAndView cvsEventModifyView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView("admin/cvsmanager/eventModifyForm");
		Event event = eventService.updateEvent(no);
		mv.addObject("event", event);
		return mv;
	
	}
	/*//이벤트 수정하기-------------------------------------------------------------------*/
	@RequestMapping(value="cvseventmodifywrite.do", method = RequestMethod.POST)
	public String cvsEventModiftwriter(HttpSession session, HttpServletRequest request) throws Exception {

		int user_no = ((User)session.getAttribute("user")).getUser_no();		
		String filename = new FileUtils().InsertFile(session, request);
		String[] fName = filename.split("/");
		String prevFileName = request.getParameter("prevfile");
			
		System.out.println("이건 수정" + fName[0] + " , " + fName[1]);
			
		Event event = new Event();		
		event.setWriter(Integer.parseInt(request.getParameter("writer")));
		event.setTitle(request.getParameter("title"));
		event.setEvent_no(Integer.parseInt(request.getParameter("event_no")));
		event.setStart_date(java.sql.Date.valueOf(request.getParameter("start_date")));
		event.setEnd_date(java.sql.Date.valueOf(request.getParameter("end_date")));
		event.setJoin_limit(Integer.parseInt(request.getParameter("join_limit")));
		event.setContents(request.getParameter("contents"));
		event.setOriginal_file_name(fName[0]);
		event.setStored_file_name(fName[1]);				
	    
		eventService.updateEventPage(event);
		
		return "redirect:/cvseventlist.do";
	}
	//수정 끝

	// 이벤트 삭제
	@RequestMapping(value="eventDelete.do")
	public String deleteEvent(@RequestParam int no) {
		eventService.eventDelete(no);
		return "redirect:/cvseventlist.do";
	}
	//삭제 끝
	
	
	//이벤트 참여하기-----------------------------------------------------------
	@RequestMapping(value="eventJoin.do", method = RequestMethod.POST)
	public ModelAndView eventJoin(EventJoin eventjoin) {

		ModelAndView mv = new ModelAndView();
		
		int checkEventJoinTable = eventService.eventJoincheck(eventjoin);
		
		if (checkEventJoinTable == 0) {
			 // 참여 처음 클릭
	         // 참여 테이블에 넣음
	         eventService.eventJoin(eventjoin);
	         
	      } else if (checkEventJoinTable == 1) {
	         // 참여 두번 클릭
	         // 참여 테이블에서 삭제
	    	  eventService.deleteJoin(eventjoin);
	      }
		mv.addObject("checkEventJoinTable",checkEventJoinTable);
		mv.setViewName("jsonView");
	     return mv;
	}
	 //이벤트 참여 인원
	   @RequestMapping(value="eventCount.do",method=RequestMethod.POST)
	   public ModelAndView eventJoinListCount(EventJoin eventjoin){
	      ModelAndView mv = new ModelAndView();
	      
	      // 테이블에서 특정 게시물 참여인원 수..
	      int eventJoinCount= eventService.eventJoinCount(eventjoin.getEvent_no());
	      int checkEventJoinTable = eventService.eventJoincheck(eventjoin);
	      
	      mv.addObject("eventJoincheck",checkEventJoinTable);
	      mv.addObject("eventJoinCount",eventJoinCount);
	      mv.setViewName("jsonView");
	      
	      return mv;
	   }
	   
	
}
