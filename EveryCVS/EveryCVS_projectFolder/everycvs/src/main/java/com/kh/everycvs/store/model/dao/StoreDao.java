package com.kh.everycvs.store.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.NaverMap;
import com.kh.everycvs.common.model.vo.Store;

@Repository("storeDao")
public class StoreDao {

	@Autowired
	private SqlSession sqlSession;

	/* 사용자 */
	/** 지도에 표시할 데이터리스트 **/
	public ArrayList<Store> cvsMapList(NaverMap location) {
		List<Store> list=null;
		if(location.getBrand_no()==0){
			list = sqlSession.selectList("store.allCvsMapList", location);
		}else{
			list = sqlSession.selectList("store.cvsMapList", location);
		}
		return new ArrayList<Store>(list);
	}

	public Store nearestStore(Map<String, Object> params) {
		if((int)params.get("brand_no")==0){
			return sqlSession.selectOne("store.allNearestStore", params);
		}else{
			return sqlSession.selectOne("store.nearestStore", params);
		}
		
	}
	
	/**지점 방문횟수증가 update**/
	public void increamentJoinCount(String store_no) {
		sqlSession.update("store.increamentJoinCount", store_no);
	}
	
	/* 편의점 관리자 */

	/** 방문자 수 top5 지점 
	 * @param brand_no */
	public List joinCountTop5(int brand_no) {
		return sqlSession.selectList("store.joinCountTop5", brand_no);
	}
	
	/** 판매량 top5 지점
	 * @param brand_no */
	public List saleQuantityTop5(int brand_no) {
		return sqlSession.selectList("store.saleQuantityTop5", brand_no);
	}
	
	/** 지점 조회 : 모든 지점을 조회
	 * @param brand_no */
	public List selectStoreList(int brand_no) {
		return sqlSession.selectList("store.storeList", brand_no);
	}
	
	/** 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
	*	필터링 : 지점번호/지점명/시도명/구군명/법정동명
	* @param store */
	public List searchStoreList(Store store) {
		List list = null;
		
		if(store.getStore_no() != null)
			list = sqlSession.selectList("store.storeSearch1", store);
		else if(store.getStore_name() != null)
			list = sqlSession.selectList("store.storeSearch2", store);
		else if(store.getLoc_l_name() != null)
			list = sqlSession.selectList("store.storeSearch3", store);
		else if(store.getLoc_m_name() != null)
			list = sqlSession.selectList("store.storeSearch4", store);
		else if(store.getLoc_s_name() != null)
			list = sqlSession.selectList("store.storeSearch5", store);
		
		return list;
	}
	
	/** 지점 삭제
	 * @param store */
	public void DeleteStore(Store store) {
		sqlSession.delete("store.deleteStore1", store);
		sqlSession.delete("store.deleteStore2", store);
		sqlSession.delete("store.deleteStore3", store);
	}

	/* 지점 조회 */
	public Store selectStore(String store_no) {
		return sqlSession.selectOne("store.selectStore", store_no);
	}
	
	/** 금일 방문자수 **/
	public int joinCustomers(String store_no) {
		return sqlSession.selectOne("store.storeJoinCustomers",store_no);
	}
	
	public int joinCustomers(int brand_no) {
		return sqlSession.selectOne("store.cvsJoinCustomers",brand_no);
	}
	
		/* 사이트 관리자 */
	/** 편의점별 방문자 수 통계 **/
	public int joinCustomers() {
		return sqlSession.selectOne("store.joinCustomers");
	}

	public List<HashMap<String, Object>> visitcvsChart() {
		List<HashMap<String, Object>> result = sqlSession.selectList("store.visitcvsChart");
		System.out.println(result);
		return result;
	}

	public Store storeInfo(String store_no) {
		return sqlSession.selectOne("store.storeInfo",store_no);
	}



}
