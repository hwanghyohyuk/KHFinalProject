package com.kh.everycvs.gifticon.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.everycvs.common.model.vo.Gifticon;

@Repository("GifticonDao")
public class GifticonDao {

	public GifticonDao() {}
	
	@Autowired
	private SqlSession sqlSession;

	
	//기프티콘 생성
	public int createGifticon(Map<String, Object> map) {
		return sqlSession.insert("gifticon.insertGifticon", map);
	}
	
	//기프티콘 조회
	public List<Gifticon> listGifticon(int user_no) {
		List<Gifticon> glist = new ArrayList<Gifticon>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("user_no", user_no);
		map.put("glist", glist);
		
		return sqlSession.selectList("gifticon.gifticonList", map);
	}
	
	//기프티콘 삭제
	public void deleteGifticon() {
		
	}
	
	
}
