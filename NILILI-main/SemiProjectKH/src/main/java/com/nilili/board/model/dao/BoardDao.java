package com.nilili.board.model.dao;

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
import com.nilili.board.model.vo.Like;
import com.nilili.board.model.vo.Reply;
import com.nilili.common.JDBCTemplate;
import com.nilili.common.model.vo.PageInfo;

public class BoardDao {

	private Properties prop = new Properties();

	public BoardDao() {
		String filePath = BoardDao.class.getResource("/db/sql/board-mapper.xml").getPath();
		try {
			prop.loadFromXML(new FileInputStream(filePath));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	// 게시글 조회
	public int listCount(Connection conn) {

		int count = 0;
		ResultSet rset = null;
		Statement stmt = null;

		String sql = prop.getProperty("listCount");

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			if (rset.next()) {
				count = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return count;
	}

	// 게시글 목록 조회
	public ArrayList<Board> selectList(Connection conn, PageInfo pi) {

		// 준비물
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("selectList");
		// 1페이지 : 1~10 / 5페이지 : 41~50 / 10페이지 91~100
		// 2페이지 : 11~20
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"), rset.getString("CATEGORY_NAME"),
						rset.getString("BOARD_TITLE"), rset.getString("MEMBER_ID"), rset.getInt("COUNT"),
						rset.getDate("REGI_DATE")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public ArrayList<Category> selectCategoryList(Connection conn) {
		// 데이터베이스에서 카테고리 테이블에 있는 정보 목록을
		// 조회해서 담아가기(서비스로 전달->컨트롤러에 전달)
		// 카테고리 번호,카테고리 이름 : VO (Category)
		ArrayList<Category> list = new ArrayList<>();
		Statement stmt = null;
		String sql = prop.getProperty("selectCategoryList");
		ResultSet rset = null;

		try {
			stmt = conn.createStatement();

			rset = stmt.executeQuery(sql);

			while (rset.next()) {// 접근할 행이 있다
				list.add(new Category(rset.getInt("CATEGORY_NO"), rset.getString("CATEGORY_NAME")));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}

		return list;
	}

	public int insertBoard(Connection conn, Board b) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertBoard");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, b.getBoardCategory());
			pstmt.setString(2, b.getBoardTitle());
			pstmt.setString(3, b.getBoardContent());
			pstmt.setInt(4, Integer.parseInt(b.getBoardWriter()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	// 첨부파일 등록 메소드
	public int insertAttachment(Connection conn, Attachment at) {
		int result = 1;
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
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	// 사진게시판 사진 목록 추가 메소드
	public int insertAttachmentList(Connection conn, ArrayList<Attachment> list) {

		// 실행후 받은 결과를 처리할 변수 (여러개를 처리하기 위해 1로 초기화해두기)
		int result = 1;

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertAttachmentList");

		try {

			// list에 담겨진 각 Attachment를 꺼내서 각 데이터로 추가구문 작성하기
			// 순차적으로 전부 접근하여 추출할수있도록 향상된 for문사용
			for (Attachment at : list) {
				pstmt = conn.prepareStatement(sql);

				pstmt.setString(1, at.getOriginName());
				pstmt.setString(2, at.getChangeName());
				pstmt.setString(3, at.getFilePath());
				pstmt.setInt(4, at.getFileLevel());

				// 실행후 받은 결과가 하나라도 0이 나오면 결과값을 0으로 만들기
				result *= pstmt.executeUpdate();
			}
		} catch (SQLException e) {
			// try구문에서 첫번째 처리에 실패가된다면 result가 1로 전달되는것을 방지
			result = 0;
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	// 첨부파일 조회 메소드
	public Attachment selectAttachment(Connection conn, int boardNo) {
		// SELECT 조회
		ResultSet rset = null; // 결과받을 객체 변수
		PreparedStatement pstmt = null;// 위치홀더를 이용해야하니 preparedstatement 이용
		// 첨부파일 정보 담을 객체 변수 준비 (아직 있을지 없을지 모르니 null로 초기화)
		Attachment at = null;
		String sql = prop.getProperty("selectAttachment");

		try {
			// 미완성된 SQL구문을 전달하며 PSTMT 객체 생성
			pstmt = conn.prepareStatement(sql);
			// 미완성된 부분(위치홀더) 값 채워주기
			pstmt.setInt(1, boardNo);

			// sql구문 완성했으니 실행 및 처리결과 받기
			rset = pstmt.executeQuery();
			// 전달받은 처리결과(행집합)이 있다면
			if (rset.next()) {
				// 조회된 데이터를 객체에 담아서 컨트롤러까지 전달해야함
				at = new Attachment();// 조회된 데이터가 있을때 객체 생성
				at.setFileNo(rset.getInt("FILE_NO"));
				at.setOriginName(rset.getString("ORIGIN_NAME"));
				at.setChangeName(rset.getString("CHANGE_NAME"));
				at.setFilePath(rset.getString("FILE_PATH"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return at;
	}

	public int increaseCount(int boardNo, Connection conn) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("increaseCount");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public Board selectBoard(Connection conn, int boardNo) {
		Board b = null;
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectBoard");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				b = new Board(rset.getInt("BOARD_NO"), rset.getString("CATEGORY_NAME"), rset.getString("BOARD_TITLE"),
						rset.getString("BOARD_CONTENT"), rset.getString("MEMBER_ID"), rset.getDate("REGI_DATE"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return b;
	}


	// 게시글 수정
	public int updateBoard(Connection conn, Board b) {
		// DML ( UPDATE )
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updateBoard");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, b.getBoardTitle());
			pstmt.setString(2, b.getBoardContent());
			pstmt.setString(3, b.getBoardCategory());
			pstmt.setInt(4, b.getBoardNo());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}
	

	// 첨부파일 수정
	public int updateAttachment(Connection conn, Attachment at) {
		// DML (UPDATE)
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
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}



	public int insertNewAttachment(Connection conn, Attachment at) {
		// DML ( INSERT )
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
		} finally {
			JDBCTemplate.close(pstmt);
		}

		System.out.println(result);
		return result;

	}

	public int deleteBoard(Connection conn, int bno) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("deleteBoard");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public int insertReply(Connection conn, Reply r) {
		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("insertReply");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, r.getReplyContent());
			pstmt.setInt(2, r.getRefBno());
			pstmt.setInt(3, Integer.parseInt(r.getReplyWriter()));

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public ArrayList<Reply> selectReplyList(Connection conn, int bno) {
		ResultSet rset = null;
		ArrayList<Reply> rlist = new ArrayList<>();
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectReplyList");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				rlist.add(new Reply(rset.getInt("REPLY_NO"), rset.getString("CONTENT"), rset.getString("MEMBER_ID"),
						rset.getString("FORMATTED_DATE")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return rlist;
	}

	// 사진게시글(첨부파일목록) 상세조회 메소드
	public ArrayList<Attachment> selectAttachmentList(Connection conn, int boardNo) {
		ArrayList<Attachment> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("selectAttachment");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, boardNo);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Attachment(rset.getInt("FILE_NO"), rset.getString("ORIGIN_NAME"),
						rset.getString("CHANGE_NAME"), rset.getString("FILE_PATH")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	
	
	public ArrayList<Board> searchTitleList(Connection conn, PageInfo pi, String searchText) {
		//준비물
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		System.out.println(searchText);
		
		String sql = prop.getProperty("titleList");
		//1페이지 : 1~10 / 5페이지 : 41~50  / 10페이지 91~100
		//2페이지 : 11~20
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchText);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
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

	public ArrayList<Board> searchIdList(Connection conn, PageInfo pi, String searchText) {
		//준비물
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("idList");
		//1페이지 : 1~10 / 5페이지 : 41~50  / 10페이지 91~100
		//2페이지 : 11~20
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		System.out.println(searchText);
		System.out.println(startRow);
		System.out.println(endRow);
		
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchText);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
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

	public ArrayList<Board> searchCategoryList(Connection conn, PageInfo pi, String searchText) {
		//준비물
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		
		String sql = prop.getProperty("categoryList");
		//1페이지 : 1~10 / 5페이지 : 41~50  / 10페이지 91~100
		//2페이지 : 11~20
		int startRow = (pi.getCurrentPage()-1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, searchText);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO")
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

	public int checkLike(Connection conn, int bno, int memberNo) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("checkLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setInt(2, memberNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt("COUNT");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public int updateLike(Connection conn, int bno, int memberNo) {
		
		int num = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("updateLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setInt(2, memberNo);
			
			num = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return num;
	}

	public int deleteLike(Connection conn, int bno, int memberNo) {
		
		int num = 0;
		
		PreparedStatement pstmt = null;
		
		
		String sql = prop.getProperty("deleteLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setInt(2, memberNo);
			
			num = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		
		return num;
	}

	public int countLike(Connection conn, int bno) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		int result = 0;
		
		String sql = prop.getProperty("countLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				result = rset.getInt("COUNT");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		return result;
	}

	public Like searchLike(Connection conn, int boardNo) {
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		Like l = null;
		
		String sql = prop.getProperty("searchLike");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, boardNo);
			
			rset = pstmt.executeQuery();
			
			while(rset.next()) {
					l = new Like(rset.getInt("BOARD_NO")
									  ,rset.getInt("MEMBER_NO"));
				}
				
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		
		
		
		return l;
	}

	public ArrayList<Board> hotList(Connection conn, PageInfo pi) {
		// 준비물
		ArrayList<Board> list = new ArrayList<>();
		ResultSet rset = null;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("hotList");
		// 1페이지 : 1~10 / 5페이지 : 41~50 / 10페이지 91~100
		// 2페이지 : 11~20
		int startRow = (pi.getCurrentPage() - 1) * pi.getBoardLimit() + 1;
		int endRow = pi.getCurrentPage() * pi.getBoardLimit();

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);

			rset = pstmt.executeQuery();

			while (rset.next()) {
				list.add(new Board(rset.getInt("BOARD_NO"), rset.getString("CATEGORY_NAME"),
						rset.getString("BOARD_TITLE"), rset.getString("MEMBER_ID"), rset.getInt("COUNT"),
						rset.getDate("REGI_DATE")));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return list;
	}

	public int likeMemCheck(Connection conn, int bno, int memberNo) {
		
		int result = 0; 
		
		PreparedStatement pstmt = null;
		
		ResultSet rset = null;
		
		String sql = prop.getProperty("likeMemCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bno);
			pstmt.setInt(2, memberNo);
			
			rset = pstmt.executeQuery();
			
			if (rset.next()) {
				result = rset.getInt("MEMBER_NO");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		
		System.out.println(result);
		
		return result;
	}
	

}
