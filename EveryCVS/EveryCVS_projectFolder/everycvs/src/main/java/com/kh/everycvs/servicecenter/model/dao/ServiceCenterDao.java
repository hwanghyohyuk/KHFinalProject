package com.kh.everycvs.servicecenter.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Purchase;
import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.kh.everycvs.common.model.vo.StoreProduct;
import com.mysql.fabric.xmlrpc.base.Array;

@Repository("ServiceCenterDao")
public class ServiceCenterDao {
	
	private ServiceCenter servicecenter;

		public ServiceCenterDao(){}
		
		@Autowired
		private SqlSession sqlSession;
		
		public List<ServiceCenter> serviceList() {
			ArrayList<ServiceCenter> list = new ArrayList<ServiceCenter>();
			System.out.println("ServiceCenterDao : " + list);
			return sqlSession.selectList("serviceCenter.serviceList", list);
		}
}
