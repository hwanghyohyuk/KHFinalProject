package com.kh.everycvs.servicecenter.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.common.model.vo.StoreProduct;
import com.kh.everycvs.servicecenter.model.service.ServiceCenterService;

@Controller
public class ServiceCenterController {
	
	@Autowired
	private ServiceCenterService serviceCenterService;

	// 고객센터 조회 : 고객센터 리스트조회
	@RequestMapping(value = "selectServiceList.do")
	public ModelAndView serviceList(ModelAndView mv) {
		ArrayList<ServiceCenter> list = (ArrayList<ServiceCenter>) serviceCenterService.serviceList();
		mv.addObject("list", list);
		System.out.println("ServiceCenterController : " + list);
		return mv;
		

	}

	// 고객센터 : 고객센터 글쓰기
	@RequestMapping(value = "insertService.do", method = RequestMethod.GET)
	public String serviceWrite(HttpServletRequest request) {
		return "servicecenter/serviceWrite";
	}

	// 고객센터:
}
