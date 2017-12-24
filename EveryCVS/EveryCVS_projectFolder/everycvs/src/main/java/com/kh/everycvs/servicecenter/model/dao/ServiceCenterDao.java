package com.kh.everycvs.servicecenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Event;
import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.common.model.vo.StoreProduct;
import com.mysql.fabric.xmlrpc.base.Array;

@Repository("ServiceCenterDao")
public class ServiceCenterDao {

	public ServiceCenterDao() {	}

	@Autowired
	private SqlSession sqlSession;

	// 조회수 증가
	public int serviceReadCount(int sno) {
		return sqlSession.update("serviceCenter.serviceReadCount", sno);
	}

	public List<ServiceCenter> serviceList() {
		ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		System.out.println("ServiceCenterDao : " + list);
		return sqlSession.selectList("serviceCenter.serviceList", list);
	}

	public List<ServiceCenter> serviceSearch(String keyword) {
		// ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", "%" + keyword + "%");
		System.out.println("searchDao : " + map);
		return sqlSession.selectList("serviceCenter.serviceSearch", map);
	}

	/*
	 * public List<ServiceCenter> serviceInsert() { ArrayList<ServiceCenter>
	 * list = new ArrayList<ServiceCenter>();
	 * System.out.println("ServiceCenterDao : " + list); return
	 * sqlSession.selectList("serviceCenter.serviceList", list); }
	 */

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

	public ServiceCenter serviceUpdateView(int no) {
		ServiceCenter servicecenter = sqlSession.selectOne("serviceCenter.serviceUpdateView", no);
		return servicecenter;
	}

	public int serviceUpdate(ServiceCenter servicecenter) {
		int result = sqlSession.update("serviceCenter.serviceUpdate", servicecenter);
		System.out.println("updateDao : " + servicecenter);
		return result;
	}

	public ServiceCenter serviceMyWrite(int writer) {
		System.out.println("MyWriteDao : " + writer);
		ServiceCenter result = sqlSession.selectOne("serviceCenter.serviceMyWrite", writer);
		return result;
	}

}
