package com.kh.everycvs.servicecenter.model.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.servicecenter.model.dao.ServiceCenterDao;
import com.kh.everycvs.storeproduct.model.dao.StoreProductDao;

@Service("ServiceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService{
	
	@Autowired
	private ServiceCenterDao servicecenterDao;
	
	@Override
	public ArrayList<ServiceCenter> serviceList() {
		//고객센터 게시글 조회
		ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		System.out.println("ServiceCenterServiceImpl : " + list);
		return (ArrayList<ServiceCenter>) servicecenterDao.serviceList();
	}

	@Override
	public ModelAndView selectServiceOne(HttpServletRequest request) {
		// 고객센터 조회 : 선택한 고객센터 상세조회
		return null;
	}

	@Override
	public List<ServiceCenter> serviceSearch(String keyword) {
		// 고객센터 검색 : 제목으로 검색
		/*ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		System.out.println("ServiceCenterServiceImpl : " + list);*/
		return (ArrayList<ServiceCenter>) servicecenterDao.serviceSearch(keyword);
	}
	
	// 고객센터 등록
	@Override
	public void serviceInsert(ServiceCenter vo) {
		servicecenterDao.serviceWrite(vo);
		System.out.println("ServiceCenterServiceImpl : " + vo);
		
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
