package com.kh.everycvs.store.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Store;

@Repository("StoreDao")
public class StoreDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	/*사용자*/
	/**지도에 표시할 데이터리스트**/
	public Map cvsMapList() {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	/* 편의점 관리자 */
	/** 방문자 수 top5 지점 
	 * @param brand_no **/
	public Map joinCountTop5(int brand_no) {
		// TODO Auto-generated method stub
		return null;
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
		sqlSession.delete("store.deleteStore", store);
	}
	
	
	/* 사이트 관리자 */
	/** 편의점별 방문자 수 통계 **/
	public Map cvsJoinCount() {
		// TODO Auto-generated method stub
		return null;
	}
	/**지점 방문횟수증가 update**/
	public void increamentJoinCount(String store_no) {
				
	}

}
