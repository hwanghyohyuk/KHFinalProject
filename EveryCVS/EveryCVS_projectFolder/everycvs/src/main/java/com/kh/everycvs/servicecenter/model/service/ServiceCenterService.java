package com.kh.everycvs.servicecenter.model.service;

import java.util.List;
import com.kh.everycvs.common.model.vo.ServiceCenter;

public interface ServiceCenterService {

	// 조회수
	int serviceReadCount(int sno);

	// 고객센터 조회 : 모든 공식고객센터를 조회 + 검색
	public List<ServiceCenter> serviceList(int currentPage, int limit, String keyword);

	// 고객센터 조회 : 선택한 고객센터 상세조회
	public ServiceCenter selectServiceOne(int sno);

	// 고객센터 등록
	public void serviceInsert(ServiceCenter servicecenter);

	// 고객센터 수정페이지 이동
	ServiceCenter serviceUpdateView(int no);

	// 고객센터 수정
	public int serviceUpdate(ServiceCenter servicecenter);

	// 고객센터 삭제
	int serviceDelete(int sno);

	// 고객센터 내가쓴글
	List<ServiceCenter> serviceMyWrite(int writer);

	int getListCount(String keyword);

}
