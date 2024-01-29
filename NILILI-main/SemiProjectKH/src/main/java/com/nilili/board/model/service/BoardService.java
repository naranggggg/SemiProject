package com.nilili.board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.nilili.board.model.dao.BoardDao;
import com.nilili.board.model.vo.Attachment;
import com.nilili.board.model.vo.Board;
import com.nilili.board.model.vo.Category;
import com.nilili.board.model.vo.Like;
import com.nilili.board.model.vo.Reply;
import com.nilili.common.JDBCTemplate;
import com.nilili.common.model.vo.PageInfo;

public class BoardService {

	//게시글 조회
	public int listCount() {
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new BoardDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
	
		return count;
	}
	
	//게시글 목록 조회
	
	public ArrayList<Board> selectList(PageInfo pi){
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Board> list = new BoardDao().selectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list; 
	}

	public ArrayList<Category> selectCategoryList() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> list = new BoardDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		
		
		return list;
	}
	
	
	//게시글 등록 메소드
	public int insertBoard(Board b, ArrayList<Attachment> list) {
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 정보 등록부터 하기 (첨부파일은 해당 게시글 번호를 갖고 추가되어야하기 때문에)
		int result = new BoardDao().insertBoard(conn,b);
		
		//첨부파일이 있다면 등록하기 
		int result2 = new BoardDao().insertAttachmentList(conn, list);
		//int result2 = 0;  //만약 첨부파일이 없다면 아래 조건식을 보드처리로만 확인해야하니 1로 초기화
		
		
		//둘중 하나라도 실패하면 rollback 둘다 성공해야 commit 
		if(result*result2>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		return result*result2;
	}
		
		

		public ArrayList<Attachment> selectAttachmentList(int boardNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Attachment> AttachmentList = new BoardDao().selectAttachmentList(conn, boardNo);
			
			JDBCTemplate.close(conn);
			
			
			return AttachmentList;
		}
		

		public int increaseCount(int boardNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BoardDao().increaseCount(boardNo,conn);
			
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			
			return result; //결과행수 돌려주기
		}

		public Board selectBoard(int boardNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			Board b = new BoardDao().selectBoard(conn,boardNo);
			
			//조회구문이니 트랜잭션 처리 필요없음
			
			JDBCTemplate.close(conn); //자원반납 
			
			return b;
		}


		
		//게시글 수정
		public int updateBoard(Board b, ArrayList<Attachment> list) {
			Connection conn = JDBCTemplate.getConnection();
			
			//게시글 정보 수정 
			int result = new BoardDao().updateBoard(conn,b);
			
			//첨부파일이 있으면 처리 후 값 담길 변수 준비 
			//첨부파일이 없으면 게시글 처리만 하기위해 1로 초기화 
			int result2 = 1;
			
			//첨부파일이 있다면 수정 또는 추가 작업 수행 
			if(!list.isEmpty()) {//비어있는지 확인
				//기존 첨부파일이 있다면 (update) - fileNo가 있는지 확인
				for(Attachment at : list) {
					if(at.getFileNo() != 0) {
						result2 = new BoardDao().updateAttachment(conn,at);
					}else {//기존에 첨부파일이 없었다면 - insert
						//기존에 첨부파일 추가 메소드에서는 sql구문이 
						//refBno(참조게시글번호) 부분이 currval(현재시퀀스번호)로 들어가있어서 사용할 수 없다. 
						//controller에서 가져온 boardNo를 넣어서 추가하여야한다.
						
						result2 = new BoardDao().insertNewAttachment(conn,at);
						
						System.out.println(result2);
					}
				}
			}
			
			//게시글 수정과 첨부파일 수정 또는 추가 작업중 하나라도 잘못되었다면 
			//되돌리기 작업을 수행하여야한다. 
			
			if(result*result2>0) { //둘중하나라도 0이면 0일테니 성공여부 확인가능 
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			
			return result*result2;
		}
		

		public int deleteBoard(int bno) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BoardDao().deleteBoard(conn,bno);
			
			//dml 트랜잭션
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return result;
		}

		public int insertReply(Reply r) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BoardDao().insertReply(conn,r);
			
			//DML (처리된 행수) - 트랜잭션처리 
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			
			return result;
		}

		public ArrayList<Reply> selectReplyList(int bno) {

			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Reply> rlist = new BoardDao().selectReplyList(conn,bno);
			
			JDBCTemplate.close(conn);
			
			return rlist;
		}
		
		public ArrayList<Board> searchTitleList(PageInfo pi, String searchText) {
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Board> list = new BoardDao().searchTitleList(conn,pi,searchText);
			
			JDBCTemplate.close(conn);
			
			return list; 
		}

		public ArrayList<Board> searchIdList(PageInfo pi, String searchText) {
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Board> list = new BoardDao().searchIdList(conn,pi,searchText);
			
			JDBCTemplate.close(conn);
			
			return list; 
		}

		public ArrayList<Board> searchCategoryList(PageInfo pi, String searchText) {
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Board> list = new BoardDao().searchCategoryList(conn,pi,searchText);
			
			JDBCTemplate.close(conn);
			
			return list; 
		}

		public int checkLike(int bno, int memberNo) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BoardDao().checkLike(conn,bno,memberNo);
			
			JDBCTemplate.close(conn);
			
			return result;
		}

		public int updateLike(int bno, int memberNo) {
			Connection conn = JDBCTemplate.getConnection();

			int num = new BoardDao().updateLike(conn,bno,memberNo);
		
			if(num>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return num;
		}

		public int deleteLike(int bno, int memberNo) {
			Connection conn = JDBCTemplate.getConnection();

			int num = new BoardDao().deleteLike(conn,bno,memberNo);
			
			if(num>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
			
			return num;
		}

		public int countLike(int bno) {
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BoardDao().countLike(conn, bno);
			
			JDBCTemplate.close(conn);
			
			return result;
		}

		public Like searchLike(int boardNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			Like l = new BoardDao().searchLike(conn, boardNo);
			
			JDBCTemplate.close(conn);

			return l;
		}

		public ArrayList<Board> hotList(PageInfo pi) {
			Connection conn = JDBCTemplate.getConnection();
			
			ArrayList<Board> list = new BoardDao().hotList(conn,pi);
			
			JDBCTemplate.close(conn);
			 
			return list; 
		}

		public int likeMemCheck(int bno, int memberNo) {
			
			Connection conn = JDBCTemplate.getConnection();
			
			int result = new BoardDao().likeMemCheck(conn,bno,memberNo);
			
			JDBCTemplate.close(conn);
			
			return result;
		}




}
