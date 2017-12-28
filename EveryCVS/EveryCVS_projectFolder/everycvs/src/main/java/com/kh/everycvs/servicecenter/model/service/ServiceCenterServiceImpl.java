package com.kh.everycvs.servicecenter.model.service;

import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.servicecenter.model.dao.ServiceCenterDao;

@Service("ServiceCenterService")
public class ServiceCenterServiceImpl implements ServiceCenterService {

	@Autowired
	private ServiceCenterDao servicecenterDao;

	@Override
	public int serviceReadCount(int sno) {
		// 조회수 증가
		return servicecenterDao.serviceReadCount(sno);
	}

	@Override
	public ArrayList<ServiceCenter> serviceList() {
		// 고객센터 게시글 조회
		ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		System.out.println("ServiceCenterServiceImpl : " + list);
		return (ArrayList<ServiceCenter>) servicecenterDao.serviceList();
	}

	@Override
	public ServiceCenter selectServiceOne(int sno) {
		// 고객센터 상세조회
		System.out.println("Service : " + sno);
		return servicecenterDao.selectServiceOne(sno);

	}

	@Override
	public List<ServiceCenter> serviceSearch(String keyword) {
		// 고객센터 검색 : 제목으로 검색
		/*
		 * ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		 * System.out.println("ServiceCenterServiceImpl : " + list);
		 */
		System.out.println("searchService : " + keyword);
		return (ArrayList<ServiceCenter>) servicecenterDao.serviceSearch(keyword);
	}

	// 고객센터 등록
	@Override
	public void serviceInsert(ServiceCenter servicecenter) {
		servicecenterDao.serviceWrite(servicecenter);
		System.out.println("ServiceCenterServiceImpl : " + servicecenter);

	}

	@Override
	public int serviceDelete(int sno) {
		// 고객센터 삭제
		return servicecenterDao.serviceDelete(sno);

	}

	@Override
	public ServiceCenter serviceUpdateView(int no) {
		// 고객센터 수정하기로 이동
		return servicecenterDao.serviceUpdateView(no);
	}

	@Override
	public int serviceUpdate(ServiceCenter servicecenter) {
		// 고객센터 수정
		System.out.println("updateService : " + servicecenter);
		return servicecenterDao.serviceUpdate(servicecenter);
	}

	@Override
	public ServiceCenter serviceMyWrite(int writer) {
		// 고객센터 내가쓴글

		System.out.println("MyWriteService: " + writer);
		return servicecenterDao.serviceMyWrite(writer);
	}

}
