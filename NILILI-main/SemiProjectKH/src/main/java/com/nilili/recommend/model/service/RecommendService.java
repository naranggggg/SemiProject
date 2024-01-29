package com.nilili.recommend.model.service;

import java.sql.Connection;

import javax.servlet.http.HttpSession;

import com.nilili.common.JDBCTemplate;
import com.nilili.member.vo.Member;
import com.nilili.recommend.model.dao.RecommendDao;
import com.nilili.recommend.model.vo.Recommend;

public class RecommendService {

	//DB의 place 값을 결과화면으로 보내는 메소드
	public Recommend resultRecommend(int point) {
		//JS에서 포인트를 받아와 DB의 결과값을 JS로 다시 보내기
		
		Connection conn = JDBCTemplate.getConnection();
		
		Recommend r = new RecommendDao().resultRecommend(conn, point);
		
		
		JDBCTemplate.close(conn);
		
		return r;
	}

	//회원 번호에 따라 taste 값을 가장 초기에 insert 
	/*
	 * public int updateTaste(Recommend r) {
	 * 
	 * Connection conn = JDBCTemplate.getConnection();
	 * 
	 * int result = new RecommendDao().updateTaste(conn, r);
	 * 
	 * if (result > 0) { JDBCTemplate.commit(conn); } else {
	 * JDBCTemplate.rollback(conn); }
	 * 
	 * JDBCTemplate.close(conn);
	 * 
	 * return result;
	 * 
	 * }
	 */
	
	//회원 번호에 따라 taste 값을 update
	public int updateTaste(Recommend r) {
		
		Connection conn = JDBCTemplate.getConnection();
		

		int result = new RecommendDao().updateTaste(conn, r);
		
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		
		return result;
		

		
	}

	//구독 회원에게 추천해준 장소를 SUB_RECOMMEND 테이블의 plNo컬럼에 update해주기
	
	public int updatePlNo(Recommend r) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new RecommendDao().updatePlNo(conn, r);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		System.out.println("service : " + result);
		return result;

	  }
	 
	

}
