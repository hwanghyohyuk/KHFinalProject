package com.kh.everycvs.store.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.everycvs.common.model.vo.NaverMap;
import com.kh.everycvs.common.model.vo.Store;
import com.kh.everycvs.store.model.dao.StoreDao;

@Service("storeService")
public class StoreServiceImpl implements StoreService {

	@Autowired
	private StoreDao storeDao;

	@Override
	public Store selectStore(String sno) {
		return storeDao.selectStore(sno);
	}	

	/*사용자*/
	/**지도에 표시할 데이터리스트**/
	@Override
	public ArrayList<Store> cvsMapList(NaverMap location) {
		return storeDao.cvsMapList(location);
	}

	@Override
	public Store nearestStore(Map<String, Object> params) {
		return storeDao.nearestStore(params);
	}

	
	/**지점 방문횟수증가**/
	@Override
	public void increamentJoinCount(String store_no) {
		storeDao.increamentJoinCount(store_no);
	}
	
	/*지점관리자*/
	/** 금일 방문자수 **/
	@Override
	public int joinCustomers(String store_no) {
		return storeDao.joinCustomers(store_no);
	}
	
	/* 편의점 관리자 */
	
	@Override
	public List joinCountTop5(int brand_no) {
		return storeDao.joinCountTop5(brand_no);
	}

	@Override
	public List saleQuantityTop5(int brand_no) {
		return storeDao.saleQuantityTop5(brand_no);
	}
	
	/** 지점 조회 : 모든 지점을 조회
	 * 	@param brand_no */
	@Override
	public List selectStoreList(int brand_no) {
		return storeDao.selectStoreList(brand_no);
	}

	/** 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	 * @param store */
	@Override
	public List searchStoreList(Store store) {
		return storeDao.searchStoreList(store);
	}

	/** 지점 삭제
	 * @param store */
	@Override
	public void DeleteStore(Store store) {
		storeDao.DeleteStore(store);
	}

	@Override
	public int joinCustomers(int brand_no) {
		return storeDao.joinCustomers(brand_no);
	}

	@Override
	public int joinCustomers() {
		// TODO Auto-generated method stub
		return storeDao.joinCustomers();
	}

	@Override
	public List<HashMap<String, Object>> visitcvsChart() {
		return storeDao.visitcvsChart();
	}

}
