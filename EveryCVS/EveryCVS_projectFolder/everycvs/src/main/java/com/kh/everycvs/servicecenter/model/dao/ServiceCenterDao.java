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

	public List<ServiceCenter> serviceList(int startRow, int endRow, String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("startRow",startRow);
		map.put("endRow",endRow);
		if(!keyword.equals("")){
			map.put("keyword","%"+keyword+"%");
			map.put("isKeyword",1);
		}
		return sqlSession.selectList("serviceCenter.serviceList", map);
	}

	public ServiceCenter selectServiceOne(int sno) {
		// 고객센터 상세보기
		System.out.println("Dao : " + sno);
		return sqlSession.selectOne("serviceCenter.serviceDetail", sno);
	}

	public int serviceDelete(int sno) {
		// 고객센터 삭제
		return sqlSession.delete("serviceCenter.serviceDelete", sno);
	}

	public void serviceWrite(ServiceCenter servicecenter) {
		int result = sqlSession.insert("serviceCenter.serviceInsert", servicecenter);
		System.out.println("ServiceDao : " + servicecenter);
	}

	public ServiceCenter serviceUpdateView(int no) {
		ServiceCenter servicecenter = sqlSession.selectOne("serviceCenter.serviceUpdateView", no);
		return servicecenter;
	}

	public int serviceUpdate(ServiceCenter servicecenter) {
		int result = sqlSession.update("serviceCenter.serviceUpdate", servicecenter);
		System.out.println("updateDao : " + servicecenter);
		return result;
	}

	public List<ServiceCenter> serviceMyWrite(int writer) {
		System.out.println("MyWriteDao : " + writer);
		List<ServiceCenter> servicecenter = sqlSession.selectList("serviceCenter.serviceMyWrite", writer);
		return servicecenter;

	}

	public int getListCount(String keyword) {
		Map<String, Object> map = new HashMap<String, Object>();
		if(!keyword.equals("")){
			map.put("isKeyword", 1);
			map.put("keyword", "%"+keyword+"%");
		}		
		return sqlSession.selectOne("serviceCenter.getListCount", map);
	}

}
