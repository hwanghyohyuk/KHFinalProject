package com.kh.everycvs.store.model.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

@Repository("StoreDao")
public class StoreDao {
	
	public StoreDao(){}
	
	public List selectStoreList() {
		// 지점 조회 : 모든 지점을 조회
		return null;
	}
	
	public List searchStoreList() {
		// 지점 검색 : 입력한 키워드와 필터링으로 지점을 검색
		// 필터링 : 지점명/주소
		return null;
	}
	
	public int DeleteStore() {
		// 지점 삭제
		return 0;
	}
	
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
