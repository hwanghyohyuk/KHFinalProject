package com.kh.everycvs.servicecenter.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.servicecenter.model.service.ServiceCenterService;

@Controller
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;

	// 고객센터 조회 : 고객센터 리스트조회
	@RequestMapping(value = "/page/servicemain.do")
	public String servicemain() {
		return "redirect:/page/selectServiceList.do";
	}

	// 고객센터 조회 : 고객센터 리스트조회 + 검색
	@RequestMapping(value = "/page/selectServiceList.do")
	public ModelAndView serviceList(ModelAndView mv, @RequestParam(value="page",required=true,defaultValue="1")int page,
			@RequestParam(value="keyword",required=false,defaultValue="") String keyword) {
		mv.setViewName("servicecenter/servicelist");
		int currentPage = page;
		int limit = 10;
		List<ServiceCenter> list = serviceCenterService.serviceList(currentPage,limit,keyword);
		int listCount = serviceCenterService.getListCount(keyword);
		int maxPage = (int) ((double) listCount / limit + 0.9);
		int startPage = (((int) ((double) currentPage / limit + 0.9)) - 1) * limit + 1;
		int endPage = startPage + limit - 1;
		if (maxPage < endPage)
			endPage = maxPage;
		
		if(list.size()>0){
			mv.addObject("list", list);
		}else{
			mv.addObject("result", 0);
		}
		
		mv.addObject("currentPage", currentPage);
		mv.addObject("listCount", listCount);
		mv.addObject("maxPage", maxPage);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("limit", limit);
		mv.addObject("keyword", keyword);
		
		System.out.println("ServiceCenterController : " + mv);
		return mv;
	}

	// 고객센터 : 고객센터 글쓰기 페이지 이동
	@RequestMapping(value = "/page/writeService.do", method = RequestMethod.GET)
	public String serviceWriteView(HttpServletRequest request) {
		return "servicecenter/serviceWrite";

	}

	// 고객센터 : 글 등록
	@RequestMapping(value = "/page/serviceInsert.do", method = RequestMethod.POST)
	public String serviceInsert(ServiceCenter servicecenter) throws Exception {

		serviceCenterService.serviceInsert(servicecenter);
		System.out.println("ServiceController : " + servicecenter);

		return "redirect:/page/selectServiceList.do";
	}

	// 고객센터 : 상세보기
	@RequestMapping(value = "/page/detailService.do", method = RequestMethod.GET)
	public ModelAndView serviceDetail(ModelAndView mv, @RequestParam("sno") int sno) {
		serviceCenterService.serviceReadCount(sno);
		ServiceCenter servicecenter = serviceCenterService.selectServiceOne(sno);
		mv.addObject("servicecenter", servicecenter);
		System.out.println("Controller : " + servicecenter);
		mv.setViewName("servicecenter/serviceDetailView");
		return mv;
	}

	// 고객센터 : 고객센터 내가쓴글
	@RequestMapping(value = "/page/serviceMyWrite.do")
	public ModelAndView serviceMyWrite(@RequestParam("writer") int writer) {
		ModelAndView mv = new ModelAndView("servicecenter/servicelist");
		List<ServiceCenter> list = serviceCenterService.serviceMyWrite(writer);
		if(list.size()>0){
			mv.addObject("list", list);
		}else{
			mv.addObject("result", 0);
			mv.addObject("keyword", "");
		}
		return mv;
	}

	// 고객센터 : 고객센터 글쓰기
	@RequestMapping(value = "/page/insertService.do", method = RequestMethod.POST)
	public String serviceWrite(HttpServletRequest request) {
		return "servicecenter/serviceWrite";
	}

	// 고객센터: 삭제
	@RequestMapping(value = "/page/deleteService.do")
	public String deleteService(@RequestParam int sno) {

		serviceCenterService.serviceDelete(sno);
		return "redirect:/page/selectServiceList.do";
	}

	// 고객센터: 수정페이지 이동
	@RequestMapping(value = "/page/serviceModifyPage.do")
	public ModelAndView serviceModifyView(@RequestParam int no) {
		ModelAndView mv = new ModelAndView("servicecenter/serviceModifyView");
		ServiceCenter servicecenter = serviceCenterService.serviceUpdateView(no);
		mv.addObject("servicecenter", servicecenter);
		return mv;
	}

	// 고객센터 : 수정
	@RequestMapping(value = "/page/serviceUpdate.do", method = RequestMethod.POST)
	public String serviceUpdate(ServiceCenter servicecenter) {
		int resultUpdate = serviceCenterService.serviceUpdate(servicecenter);

		System.out.println("updateController : " + servicecenter);
		return "redirect:/page/selectServiceList.do";
	}

	/************************************************************************************************************************/
	/* 사이트관리자 고객센터 관리 페이지 */
	@RequestMapping("/admin/manageSrvc.do")
	public ModelAndView manageService(@RequestParam(value = "p", required = false, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword) {
		ModelAndView mv = new ModelAndView("admin/sitemanager/servicemanage");
		return mv;
	}

}
