package com.kh.everycvs.event.model.dao;

import java.util.ArrayList;
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
	
	public List<Event> selectEventList() throws Exception{
		return sqlSession.selectList("event.cvseventlist");
	
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
	
	public int updateEvent() {
		// 이벤트 수정
		return 0;
	}

	public Event cvsEventDetail(int eno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("event.cvsEventDetail", eno);
	}
	
	
}
