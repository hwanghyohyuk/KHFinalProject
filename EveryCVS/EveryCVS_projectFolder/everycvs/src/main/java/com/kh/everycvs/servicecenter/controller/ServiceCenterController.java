package com.kh.everycvs.servicecenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.servicecenter.model.service.ServiceCenterService;

@Controller
public class ServiceCenterController {

	@Autowired
	private ServiceCenterService serviceCenterService;

	// 고객센터 조회 : 고객센터 리스트조회
		@RequestMapping(value = "/page/servicemain.do")
		public ModelAndView servicemain(ModelAndView mv, HttpServletRequest request) {
			mv.setViewName("servicecenter/servicelist");
			ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceList();
			mv.addObject("list", list);
			return mv;
		}
	
	// 고객센터 조회 : 고객센터 리스트조회
	@RequestMapping(value = "selectServiceList.do")
	public ModelAndView serviceList(ModelAndView mv, HttpServletRequest request) {
		mv.setViewName("servicecenter/servicelist");
		ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceList();
		mv.addObject("list", list);
		System.out.println("ServiceCenterController : " + list);
		return mv;
	}

	// 고객센터: 고객센터 검색
	@RequestMapping(value = "serviceSearch.do")
	public ModelAndView serviceSearch(ModelAndView mv, @RequestParam("keyword") String keyword,
			HttpServletRequest request) {

		ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceSearch(keyword);
		mv.addObject("list", list);

		System.out.println("ServiceCenterController : " + list);
		System.out.println("keyword : " + "%" + keyword + "%");
		mv.setViewName("servicecenter/servicelist");
		return mv;
	}

	// 고객센터 : 고객센터 글쓰기
	@RequestMapping(value = "insertService.do", method = RequestMethod.GET)
	public String serviceWrite(HttpServletRequest request) {
		return "servicecenter/serviceWrite";
	}

	// 고객센터:

	/* 사이트관리자 고객센터 관리 페이지 */
	@RequestMapping("/admin/manageSrvc.do")
	public ModelAndView manageService(@RequestParam(value = "p", required = false, defaultValue = "1") String page,
			@RequestParam(value = "kwd", required = false, defaultValue = "") String keyword) {
		ModelAndView mv = new ModelAndView("admin/sitemanager/servicemanage");

		return mv;
	}
}
