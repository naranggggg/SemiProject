package com.nilili.notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import com.nilili.board.model.dao.BoardDao;
import com.nilili.board.model.vo.Attachment;
import com.nilili.board.model.vo.Board;
import com.nilili.board.model.vo.Category;
import com.nilili.common.JDBCTemplate;
import com.nilili.common.model.vo.PageInfo;
import com.nilili.notice.model.dao.NoticeDao;
import com.nilili.notice.model.vo.Notice;

public class NoticeService {

	public int listCount() {
		
		Connection conn = JDBCTemplate.getConnection();
		
		int count = new NoticeDao().listCount(conn);
		
		JDBCTemplate.close(conn);
		
	
		return count;
	}
	
	public ArrayList<Notice> selectList(PageInfo pi) {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Notice> list = new NoticeDao().selectList(conn,pi);
		
		JDBCTemplate.close(conn);
		
		return list; 
	}

	public int increaseCount(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().increaseCount(noticeNo,conn);
		
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		
		return result; //결과행수 돌려주기
	}

	public Notice selectNotice(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Notice n = new NoticeDao().selectBoard(conn,noticeNo);
		
		//조회구문이니 트랜잭션 처리 필요없음
		
		JDBCTemplate.close(conn); //자원반납 
		
		return n;
	}

	public Attachment selectAttachment(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		
		Attachment at = new NoticeDao().selectAttachment(conn,noticeNo);
		
		//조회구문이니 트랜잭션 처리는 필요하지 않다.
		//자원반납 처리만 할것
		JDBCTemplate.close(conn);
		
		return at; //조회해온 첨부파일 정보 
	}

	public ArrayList<Category> selectCategoryList() {
		Connection conn = JDBCTemplate.getConnection();
		
		ArrayList<Category> list = new NoticeDao().selectCategoryList(conn);
		
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertBoard(Notice n, Attachment at) {
Connection conn = JDBCTemplate.getConnection();
		
		//게시글 정보 등록부터 하기 (첨부파일은 해당 게시글 번호를 갖고 추가되어야하기 때문에)
		int result = new NoticeDao().insertBoard(conn,n);
		
		//첨부파일이 있다면 등록하기 
		int result2 = 1;  //만약 첨부파일이 없다면 아래 조건식을 보드처리로만 확인해야하니 1로 초기화
		
		if(at!=null) {
			result2 = new NoticeDao().insertAttachment(conn,at);//요청시 0으로 되면 조건식 판별 
		}
		
		if(result*result2>0) { //성공시 (두 dml다 0이아닌경우 )
			
			JDBCTemplate.commit(conn);
		}else { //둘중하나라도 0으로 돌아오면 실패 (되돌리기)
			JDBCTemplate.rollback(conn);
		}
		
		return result*result2; //처리결과 리턴
	}

	public int updateBoard(Notice n, Attachment at) {
		Connection conn = JDBCTemplate.getConnection();
		
		//게시글 정보 수정 
		int result = new NoticeDao().updateBoard(conn,n);
		
		//첨부파일이 있으면 처리 후 값 담길 변수 준비 
		//첨부파일이 없으면 게시글 처리만 하기위해 1로 초기화 
		int result2 = 1;
		
		//첨부파일이 있다면 수정 또는 추가 작업 수행 
		if(at!=null) {
			//기존 첨부파일이 있다면 (update) - fileNo가 있는지 확인
			if(at.getFileNo() != 0) {
				result2 = new NoticeDao().updateAttachment(conn,at);
			}else {//기존에 첨부파일이 없었다면 - insert
				//기존에 첨부파일 추가 메소드에서는 sql구문이 
				//refBno(참조게시글번호) 부분이 currval(현재시퀀스번호)로 들어가있어서 사용할 수 없다. 
				//controller에서 가져온 boardNo를 넣어서 추가하여야한다.
				
				result2 = new NoticeDao().insertNewAttachment(conn,at);
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

	public int deleteBoard(int nno) {
		Connection conn = JDBCTemplate.getConnection();
		
		int result = new NoticeDao().deleteBoard(conn,nno);
		
		//dml 트랜잭션
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return result;
	}


}
