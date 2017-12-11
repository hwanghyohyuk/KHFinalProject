package com.kh.everycvs.servicecenter.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.ServiceCenter;
import com.mysql.fabric.xmlrpc.base.Array;

@Repository("ServiceCenterDao")
public class ServiceCenterDao {
	private ServiceCenter servicecenter;
	private SqlSession sqlsession;
		public ServiceCenterDao(){}
		
		public List selectServiceList(){
			
		
			return null;
		}
}
