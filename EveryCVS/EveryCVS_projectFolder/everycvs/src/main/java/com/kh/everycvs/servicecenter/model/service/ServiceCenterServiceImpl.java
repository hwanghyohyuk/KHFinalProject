package com.kh.everycvs.servicecenter.model.service;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

@Service("ServiceCenter")
public class ServiceCenterServiceImpl implements ServiceCenterService{
	@Override
	public ModelAndView selectServiceList(HttpServletRequest request) {
		// 고객센터 조회 : 모든 공식고객센터를 조회
		return null;
	}

	@Override
	public ModelAndView selectServiceOne(HttpServletRequest request) {
		// 고객센터 조회 : 선택한 고객센터 상세조회
		return null;
	}

	@Override
	public ModelAndView searchServiceList(HttpServletRequest request) {
		// 고객센터 검색 : 제목으로 검색
		return null;
	}

	@Override
	public String insertService(HttpServletRequest request) {
		// 고객센터 등록
		return null;
	}

	@Override
	public String updateService(HttpServletRequest request) {
		// 고객센터 수정
		return null;
	}

	@Override
	public String deleteService(HttpServletRequest request) {
		// 고객센터 삭제
		return null;
	}

	
}
