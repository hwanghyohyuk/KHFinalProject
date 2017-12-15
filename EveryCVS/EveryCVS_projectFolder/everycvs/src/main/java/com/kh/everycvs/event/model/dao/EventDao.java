package com.kh.everycvs.event.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Event;



@Repository("eventDao")
public class EventDao {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	public EventDao(){}
	
	/*백업
	 * public List<Event> selectEventList(String keyword, int currentPage, int limit){
		if(keyword.equals("")) {
			return sqlSession.selectList("event.cvseventlist");
		}else{
			Map<String, Object> map = new HashMap<String, Object>();
			map.put("mainkeyword", "%"+keyword+"%");
			map.put("subkeyword", "%"+keyword+"%");
			return sqlSession.selectList("event.cvseventsearch",map);
		}
	}*/
	public List<Event> selectEventList(HashMap<String, Object> parameters) {
		  List<Event> list = sqlSession.selectList("event.cvseventlist", parameters);
	      return list;
	}

	public Event selectEventOne(int no) {
		// 이벤트 조회 : 선택한 이벤트 상세조회
		Event event = sqlSession.selectOne("event.eventDetail",no);
		return event;
	}
	
	public int eventReadCount(int no) {
		return sqlSession.update("event.eventReadCount",no);
	}
	
	public int eventDelete(int no) {
		//이벤트 삭제
		return sqlSession.delete("event.eventDelete", no);
	}

	public List searchEventList() {
		// 이벤트 검색 : 제목으로 검색
		return null;
	}
	
	//글쓰기
	public void cvseventwriteview(Event vo) {
		  int result = sqlSession.insert("event.cvseventwrite", vo); 
	}

	public Event cvsEventDetail(int eno) {
		// 이벤트 상세보기
		return sqlSession.selectOne("event.cvsEventDetail", eno);
	}

	
	//수정하기 페이지로 이동
	public Event updateEvent(int no) {
		Event event = sqlSession.selectOne("event.cvseventmodifyview", no);
		return event;
	}
	//수정하기 완료
	public int updateEventPage(Event event) {
		int result = sqlSession.update("event.cvseventmodifywrite", event);
		System.out.println(result);
		return result;
	}

	public int listCount() {
		return sqlSession.selectOne("event.getListCount");
	}

	

	
	
}
