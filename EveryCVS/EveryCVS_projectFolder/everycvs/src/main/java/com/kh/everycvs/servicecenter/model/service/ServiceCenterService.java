package com.kh.everycvs.servicecenter.model.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.ServiceCenter;

public interface ServiceCenterService {

	// 고객센터 조회 : 모든 공식고객센터를 조회
	public ArrayList<ServiceCenter> serviceList();
		
		// 고객센터 조회 : 선택한 고객센터 상세조회
		public ModelAndView selectServiceOne(HttpServletRequest request);
		
		// 고객센터 검색 : 제목으로 검색
		public ModelAndView searchServiceList(HttpServletRequest request);
		
		// 고객센터 등록
		public String insertService(HttpServletRequest request);
		
		// 고객센터 수정
		public String updateService(HttpServletRequest request);
		
		// 고객센터 삭제
		public String deleteService(HttpServletRequest request);
}
