package com.nilili.notice.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.nilili.board.model.service.BoardService;
import com.nilili.board.model.vo.Attachment;
import com.nilili.board.model.vo.Board;
import com.nilili.board.model.vo.Category;
import com.nilili.common.model.vo.MyFileRenamePolicy;
import com.nilili.notice.model.service.NoticeService;
import com.nilili.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeUpdateController
 */
@WebServlet("/update.no")
public class NoticeUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int nno = Integer.parseInt(request.getParameter("nno"));
		
		NoticeService ns = new NoticeService();
		//수정페이지에 띄워줄 데이터 조회해오기
		Notice n = ns.selectNotice(nno);
		
		//카테고리 목록
		ArrayList<Category> list = ns.selectCategoryList();
		//첨부파일 정보 
		Attachment at = ns.selectAttachment(nno);
		
		
		request.setAttribute("n", n);
		request.setAttribute("cList", list);
		request.setAttribute("at", at);
		
		request.getRequestDispatcher("views/notice/noticeUpdateForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		//multipart/form-data로 전송되었는지 확인
		//multipart/form-data로 전달되었다면 
		//기존 request객체에서 값을 추출할 수 없기때문에 
		//MultipartRequest 객체로 변환 후 값을 추출해야한다
		//이때 MultipartRequest 객체를 생성하는 구문이 업로드 처리를 하는구문이기때문에
		//해당 파일에 대한 설정을 해줘야함
		if(ServletFileUpload.isMultipartContent(request)) {
			//전송 파일 용량 제한
			int maxSize = 10 * 1024 * 1024;
			
			//업로드된 파일 저장 위치 (물리적 경로 찾기)
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			
			//MultipartRequest객체 만들기 (객체가 생성되며 넘어온 파일이 있다면 서버에 파일 업로드가 된다) 
			MultipartRequest multiRequest 
					= new MultipartRequest(request, savePath,maxSize,"UTF-8",new MyFileRenamePolicy());
			
			//변환된 multiRequest객체로 데이터 추출하기
			int boardNo = Integer.parseInt(multiRequest.getParameter("boardNo"));
			String category = multiRequest.getParameter("tripselect");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
					
			Notice n = new Notice();
			n.setBoardNo(boardNo);
			n.setBoardContent(content);
			n.setBoardTitle(title);
			n.setBoardCategory(category);
			
			//만약 새로운 첨부파일이 전달되었다면 
			Attachment at = null;
			
			//기존첨부파일이 있을때 새로운 첨부파일이 들어온경우 (기존 첨부파일 삭제해주기)
			boolean flag = false;
			
			//새로 전달된 파일명이 있을때
			if(multiRequest.getOriginalFileName("reUploadFile") != null) {
				at = new Attachment(); //객체 생성
				//전달된 파일명 
				at.setOriginName(multiRequest.getOriginalFileName("reUploadFile"));
				//서버에 업로드된 파일명
				at.setChangeName(multiRequest.getFilesystemName("reUploadFile"));
				//저장 경로 넣기
				at.setFilePath("/resources/uploadFiles/");
				
				//만약 기존에도 파일이 있었다면 파일번호와 파일명을 전달받기 
				if(multiRequest.getParameter("originFileNo") != null) {
					//새로 첨부된 파일이 있고 기존 파일도 있다면 
					//파일정보가 등록된 데이터에서 변경작업을 한다 update
					//파일번호(식별자)를 이용하여 기존데이터에서 변경하기.(덮어쓰기)
					at.setFileNo(Integer.parseInt(multiRequest.getParameter("originFileNo")));
					
					//기존 첨부파일 삭제 플래그
					flag = true;
					
				}else {//새로 전달된 파일은 있지만 기존에는 파일이 없었을때 
					//데이터베이스에 Attachment정보를 추가해야한다.
					//참조 게시글 번호를 세팅 
					at.setRefBno(boardNo);
				}
				
			}
			
			
			//서비스로 요청보내기 
			//b,at 
			//새로운 첨부파일이 없는경우 b,at(null) - b : update 
			//새로운 첨부파일이 있고 기존에 첨부파일이 있는경우 b,at(fileNo) : b : update -at: update
			//새로운 첨부파일이 있고 기존에 첨부파일이 없는경우 b,at(refBno) : b : update -at: insert
			
			int result = new NoticeService().updateBoard(n,at);
			HttpSession session = request.getSession();
			//성공시에 상세페이지로 성공메세지와 함께
			if(result>0) {
				
				//기존에 있었던 파일이 지워져야한다면 
				if(flag) {
					//기존 파일 삭제 해주기 (저장경로 + 원본파일명)-원본파일명은 view에서 넘겨줌
					new File(savePath+multiRequest.getParameter("originFileName")).delete();
				}
				
				session.setAttribute("alertMsg", "공지사항 수정");
				response.sendRedirect(request.getContextPath()+"/list.no?currentPage=1");
			}else {
				session.setAttribute("alertMsg", "공지사항 수정 실패");
				response.sendRedirect(request.getContextPath()+"/detail.no?nno="+boardNo);
			}
	}

	}

}
