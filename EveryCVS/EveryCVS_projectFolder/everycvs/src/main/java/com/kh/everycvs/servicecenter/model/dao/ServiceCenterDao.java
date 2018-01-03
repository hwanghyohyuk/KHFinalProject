package com.kh.everycvs.servicecenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.ServiceCenter;

@Repository("ServiceCenterDao")
public class ServiceCenterDao {

	private ServiceCenter servicecenter;

	public ServiceCenterDao() {
	}

	@Autowired
	private SqlSession sqlSession;

	// 조회수 증가
	public int serviceReadCount(int sno) {
		return sqlSession.update("serviceCenter.serviceReadCount", sno);
	}
	//고객센터 : 전체조회
	public List<ServiceCenter> serviceList() {
		ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		System.out.println("ServiceCenterDao : " + list);
		return sqlSession.selectList("serviceCenter.serviceList", list);
	}
	//고객센터 : 검색
	public List<ServiceCenter> serviceSearch(String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "%" + keyword + "%");
		System.out.println("searchDao : " + map);
		return sqlSession.selectList("serviceCenter.serviceSearch", map);
	}

	// 고객센터 상세보기
	public ServiceCenter selectServiceOne(int sno) {		
		System.out.println("Dao : " + sno);
		return sqlSession.selectOne("serviceCenter.serviceDetail", sno);
	}
	
	// 고객센터 삭제
	public int serviceDelete(int sno) {
	
		return sqlSession.delete("serviceCenter.serviceDelete", sno);
	}

	public void serviceWrite(ServiceCenter servicecenter) {

		int result = sqlSession.insert("serviceCenter.serviceInsert", servicecenter);
		System.out.println("ServiceDao : " + servicecenter);
	}
	//고객센터 : 수정페이지
	public ServiceCenter serviceUpdateView(int no) {
		ServiceCenter servicecenter = sqlSession.selectOne("serviceCenter.serviceUpdateView", no);
		return servicecenter;
	}
	//고객센터 : 수정
	public int serviceUpdate(ServiceCenter servicecenter) {

		int result = sqlSession.update("serviceCenter.serviceUpdate", servicecenter);
		System.out.println("updateDao : " + servicecenter);
		return result;
	}

	//고객센터 : 내가쓴글
	public List<ServiceCenter> serviceMyWrite(int writer) {
		System.out.println("MyWriteDao : " + writer);
		List<ServiceCenter> servicecenter = sqlSession.selectList("serviceCenter.serviceMyWrite", writer);
		return servicecenter;
	}

}
