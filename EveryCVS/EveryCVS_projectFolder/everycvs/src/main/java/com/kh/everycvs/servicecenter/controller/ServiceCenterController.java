package com.kh.everycvs.servicecenter.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kh.everycvs.common.model.vo.ServiceCenter;

@Controller
public class ServiceCenterController {
	@Autowired
	private ServiceCenter servicecenter;
	
	// 고객센터 조회 : 고객센터 리스트조회
	@RequestMapping(value="selectServiceList.do", method=RequestMethod.GET)
	public String ServicelList(HttpServletRequest request){
		return "servicecenter/servicelist";
		
	}
	
	// 고객센터  : 고객센터 글쓰기
		@RequestMapping(value="insertService.do", method=RequestMethod.GET)
		public String serviceWrite(HttpServletRequest request){
			return "servicecenter/serviceWrite";
		}
		
	//고객센터: 
}
