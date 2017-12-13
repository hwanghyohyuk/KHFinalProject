package com.kh.everycvs.event.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.User;
import com.kh.everycvs.event.model.service.EventService;

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
	@RequestMapping(value="eventDetail.do", method=RequestMethod.GET)
	public ModelAndView selectEventOne(@RequestParam int no) {
		ModelAndView mv = new ModelAndView("event/eventDetail");
		Event et = eventService.selectEventOne(no);
		int ad = eventService.eventReadCount(no);
		mv.addObject("ad",ad);
		mv.addObject("et",et);
		return mv;
	}
	
	
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
		
	
	
	
	
	//--------------------------- 이벤트 관리자 리스트 수정 삭제 페이징 시작 -----------------------------------
	// 편의점 관리자 
	// 이벤트 조회 : 모든 공식이벤트를 조회
	@RequestMapping(value = "cvseventlist.do", method = RequestMethod.GET)
	 public ModelAndView eventLis() throws Exception{
		List<Event> list = eventService.selectEventList();		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/cvsmanager/eventList");
		mv.addObject("list", list);
		return mv;
		
	/*	날짜별로 바꾸는것 해야함
	 * int code = Integer.parseInt(request.getParameter("code"));
		if(code == 1) {
			// 진행 중인 이벤트 리스트 조회
		}else if (code == 2) {
			// 종료된 이벤트 리스트 조회
		}*/
	}

	
	
	
	// 글 쓰 기 ------------------------------------------
	// whriteForm 으로 이동
	@RequestMapping(value="cvseventwriteview.do", method = RequestMethod.GET)
	public String cvsEventWriteView() {
		return "admin/cvsmanager/eventWriteForm";
	}
	//게시글 저장
	@RequestMapping(value="cvseventwrite.do", method= RequestMethod.POST)
	public String cvsEventWrite(HttpServletRequest request, HttpSession session) throws Exception {

		String startDate = request.getParameter("start_date");
		String endDate = request.getParameter("end_date");
		   
		java.text.SimpleDateFormat format = new java.text.SimpleDateFormat("yyyy-MM-dd");
		  
		java.sql.Date sdate = new java.sql.Date(format.parse(startDate).getTime());
		java.sql.Date edate = new java.sql.Date(format.parse(endDate).getTime());
		
		User user= (User)session.getAttribute("user");
		Event vo = new Event();
		vo.setTitle(request.getParameter("title"));
		vo.setContents(request.getParameter("contents"));
		vo.setJoin_limit(Integer.parseInt(request.getParameter("join_limit")));
		vo.setWriter(user.getUser_no());
		vo.setStart_date(sdate);
		vo.setEnd_date(edate);
		vo.setOriginal_file_name(null);
		vo.setStored_file_name(null);
		
        eventService.eventInsert(vo);
        
         return "redirect:/cvseventlist.do";
	}
	//아직 안함
	
	
	// 이벤트 삭제
	@RequestMapping(value="eventDelete.do")
	public String deleteEvent(@RequestParam int no) {
		eventService.eventDelete(no);
		return "redirect:/eventList.do";
	}
	
	// 이벤트 수정
	@RequestMapping("cvseventmodifyview.do")
	public String cvsEventModifyView() {
		return "admin/cvsmanager/eventModifyForm";
	}

}
