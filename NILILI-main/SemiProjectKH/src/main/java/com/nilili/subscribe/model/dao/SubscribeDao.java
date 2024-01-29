package com.nilili.subscribe.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.nilili.common.JDBCTemplate;
import com.nilili.member.dao.MemberDao;
import com.nilili.subscribe.model.vo.Subscribe;

public class SubscribeDao {
	
	private Properties prop = new Properties();

	// 기본생성자가 생성되는 시점(메소드호출시점)에 파일 읽어오기
	public SubscribeDao() {
		 
		String filePath = MemberDao.class.getResource("/db/sql/subscribe-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int SubscribeInsert(Connection conn, String memberNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("SubscribeInsert");
		int result = 0;
		
		try {
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberNo);
			
			result = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}
	public int subscribeDelete(Connection conn, int memberNo) {
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("subscribeDelete");
			int result = 0;
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, memberNo);
				
				result = pstmt.executeUpdate();
			
			
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		
		return result;
		
	}

	public Subscribe updateSubscribe(Connection conn, int memberNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateSubscribe");
		ResultSet rset = null;
		Subscribe sub = null;

		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setInt(1, memberNo);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()) {
				
				sub = new Subscribe(rset.getInt("SUB_NO"), rset.getInt("MEMBER_NO"), rset.getInt("TASTE_1"),
						rset.getInt("TASTE_2"), rset.getInt("TASTE_3"), rset.getString("DESCRIPTION"),
						rset.getDate("REGI_DATE"), rset.getDate("MODI_DATE"), rset.getString("USE_YN"),
						rset.getDate("EXPIRATION_DATE"));
				
				
			}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		
		return sub;
		
		
	}
	//리코맨드 멤버 엮음
	public int updateRecommend(Connection conn, int memberNo) {
			PreparedStatement pstmt = null;
			int result = 0;
			String sql = prop.getProperty("updateRecommend");
			
			try {
				pstmt= conn.prepareStatement(sql);
				pstmt.setInt(1, memberNo);
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
		return result;
		
		
		
	}

	
	

}
