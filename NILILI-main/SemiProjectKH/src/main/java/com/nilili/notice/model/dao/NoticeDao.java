package com.nilili.notice.model.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import com.nilili.board.model.vo.Attachment;
import com.nilili.board.model.vo.Board;
import com.nilili.board.model.vo.Category;
import com.nilili.common.JDBCTemplate;
import com.nilili.common.model.vo.PageInfo;
import com.nilili.notice.model.vo.Notice;


public class NoticeDao {
	
		private Properties prop = new Properties();
		
		public NoticeDao() {
			String filePath = NoticeDao.class.getResource("/db/sql/notice-mapper.xml").getPath();
			try {
				prop.loadFromXML(new FileInputStream(filePath));
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		
		}

		public int listCount(Connection conn) {
			int count = 0;
			ResultSet rset = null;
			Statement stmt = null;
			
			String sql = prop.getProperty("listCount");
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				if(rset.next()) {
					count = rset.getInt("COUNT");
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			
			return count;
		}

		public ArrayList<Notice> selectList(Connection conn, PageInfo pi) {
			//준비물
			ArrayList<Notice> list = new ArrayList<>();
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			
			String sql = prop.getProperty("selectList");
			//1페이지 : 1~10 / 5페이지 : 41~50  / 10페이지 91~100
			//2페이지 : 11~20
			int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
			int endRow = pi.getCurrentPage() * pi.getBoardLimit();
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, startRow);
				pstmt.setInt(2, endRow);
				
				rset = pstmt.executeQuery();
				
				while(rset.next()) {
					list.add(new Notice(rset.getInt("BOARD_NO")
									  ,rset.getString("CATEGORY_NAME")
									  ,rset.getString("BOARD_TITLE")
									  ,rset.getString("MEMBER_ID")
									  ,rset.getInt("COUNT")
									  ,rset.getDate("REGI_DATE")));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			
			return list;
		}

		public int increaseCount(int noticeNo, Connection conn) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("increaseCount");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setInt(1, noticeNo);
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public Notice selectBoard(Connection conn, int noticeNo) {
			Notice n = null;
			ResultSet rset = null;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("selectBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, noticeNo);
				
				rset = pstmt.executeQuery();
				
				if(rset.next()) {
					n = new Notice(rset.getInt("BOARD_NO")
							     ,rset.getString("CATEGORY_NAME")
							     ,rset.getString("BOARD_TITLE")
							     ,rset.getString("BOARD_CONTENT")
							     ,rset.getString("MEMBER_ID")
							     ,rset.getDate("REGI_DATE"));
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return n;
		}

		public Attachment selectAttachment(Connection conn, int noticeNo) {
			//SELECT 조회
			ResultSet rset = null; //결과받을 객체 변수 
			PreparedStatement pstmt = null;//위치홀더를 이용해야하니 preparedstatement 이용
			//첨부파일 정보 담을 객체 변수 준비 (아직 있을지 없을지 모르니 null로 초기화)
			Attachment at = null;
			String sql = prop.getProperty("selectAttachment");
			
			
			try {
				//미완성된 SQL구문을 전달하며 PSTMT 객체 생성
				pstmt = conn.prepareStatement(sql);
				//미완성된 부분(위치홀더) 값 채워주기
				pstmt.setInt(1,noticeNo);
				
				//sql구문 완성했으니 실행 및 처리결과 받기 
				rset = pstmt.executeQuery();
				//전달받은 처리결과(행집합)이 있다면 
				if(rset.next()) {
					//조회된 데이터를 객체에 담아서 컨트롤러까지 전달해야함 
					at = new Attachment();//조회된 데이터가 있을때 객체 생성
					at.setFileNo(rset.getInt("FILE_NO"));
					at.setOriginName(rset.getString("ORIGIN_NAME"));
					at.setChangeName(rset.getString("CHANGE_NAME"));
					at.setFilePath(rset.getString("FILE_PATH"));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(pstmt);
			}
			return at;
		}

		public ArrayList<Category> selectCategoryList(Connection conn) {
			//데이터베이스에서 카테고리 테이블에 있는 정보 목록을 
			//조회해서 담아가기(서비스로 전달->컨트롤러에 전달) 
			//카테고리 번호,카테고리 이름 : VO (Category) 
			ArrayList<Category> list = new ArrayList<>();
			Statement stmt = null;
			String sql = prop.getProperty("selectCategoryList");
			ResultSet rset = null;
			
			try {
				stmt = conn.createStatement();
				
				rset = stmt.executeQuery(sql);
				
				while(rset.next()) {//접근할 행이 있다
					list.add(new Category(rset.getInt("CATEGORY_NO")
							 ,rset.getString("CATEGORY_NAME")));
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(rset);
				JDBCTemplate.close(stmt);
			}
			
			return list;
		}

		public int insertBoard(Connection conn, Notice n) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, n.getBoardCategory());
				pstmt.setString(2, n.getBoardTitle());
				pstmt.setString(3, n.getBoardContent());
				pstmt.setInt(4, Integer.parseInt(n.getBoardWriter()));
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public int insertAttachment(Connection conn, Attachment at) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertAttachment");
			
			try {
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				
				result = pstmt.executeUpdate();
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public int updateBoard(Connection conn, Notice n) {
			//DML ( UPDATE ) 
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, n.getBoardTitle());
				pstmt.setString(2, n.getBoardContent());
				pstmt.setString(3, n.getBoardCategory());
				pstmt.setInt(4, n.getBoardNo());
				
				result = pstmt.executeUpdate();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public int insertNewAttachment(Connection conn, Attachment at) {
			//DML ( INSERT )
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("insertNewAttachment");
			
			try {
				pstmt = conn.prepareStatement(sql);
			
				pstmt.setInt(1, at.getRefBno());
				pstmt.setString(2, at.getOriginName());
				pstmt.setString(3, at.getChangeName());
				pstmt.setString(4, at.getFilePath());
			
				result = pstmt.executeUpdate();
			
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public int updateAttachment(Connection conn, Attachment at) {
			//DML (UPDATE)
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("updateAttachment");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileNo());
				
				result = pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}finally {
				JDBCTemplate.close(pstmt);
			}
			
			return result;
		}

		public int deleteBoard(Connection conn, int nno) {
			int result = 0;
			PreparedStatement pstmt = null;
			String sql = prop.getProperty("deleteBoard");
			
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, nno);
				
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
