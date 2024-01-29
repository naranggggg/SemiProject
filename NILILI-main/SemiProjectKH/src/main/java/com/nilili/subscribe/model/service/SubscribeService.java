package com.nilili.subscribe.model.service;

import java.sql.Connection;

import com.nilili.common.JDBCTemplate;
import com.nilili.subscribe.model.dao.SubscribeDao;
import com.nilili.subscribe.model.vo.Subscribe;

public class SubscribeService {

	public int SubscribeInsert(String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		 
		int result=new SubscribeDao().SubscribeInsert(conn,memberNo);

		if(result>0) {
			
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}

	public Subscribe updateSubscribe(int memberNo) { 
		//구독에 변경이 있을시에 사용 하는 메소드 
		Connection conn = JDBCTemplate.getConnection();
		
	Subscribe sub =	new SubscribeDao().updateSubscribe(conn, memberNo);
		
	JDBCTemplate.close(conn);
	
	
	return sub;	
	}

	public int updateRecommend(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		
	int result =	new SubscribeDao().updateRecommend(conn,memberNo);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		return result;
		
	}
	
	
	

}
