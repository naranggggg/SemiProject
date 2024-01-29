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

import com.nilili.board.model.vo.Attachment;
import com.nilili.board.model.vo.Category;
import com.nilili.common.model.vo.MyFileRenamePolicy;
import com.nilili.member.vo.Member;
import com.nilili.notice.model.service.NoticeService;
import com.nilili.notice.model.vo.Notice;
import com.oreilly.servlet.MultipartRequest;

/**
 * Servlet implementation class NoticeInsertController
 */
@WebServlet("/insert.no")
public class NoticeInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//카테고리 정보 조회해와서 위임할때 넘겨주기
				//메소드명 : selectCategoryList / VO : Category 
				ArrayList<Category> list = new NoticeService().selectCategoryList();
						
						
				//request에 담아서 전달 
				request.setAttribute("cList",list);
				
				
				request.getRequestDispatcher("views/notice/noticeEnrollForm.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//넘어온 데이터 타입이 multipart인지 확인하기 
		HttpSession session = request.getSession();
		
		if(ServletFileUpload.isMultipartContent(request)) {
			
			int maxSize = 10 * 1024 * 1024;
			
			String savePath = request.getSession().getServletContext().getRealPath("/resources/uploadFiles/");
			
			MultipartRequest multiRequest = new MultipartRequest(request, savePath, maxSize, "UTF-8",new MyFileRenamePolicy());
			
			String category = multiRequest.getParameter("tripselect");
			String title = multiRequest.getParameter("title");
			String content = multiRequest.getParameter("content");
			String boardWriter = String.valueOf(((Member)session.getAttribute("loginMember")).getMemberNO());
			
			
			
			Notice n = new Notice();
			n.setBoardContent(content);
			n.setBoardTitle(title);
			n.setBoardWriter(boardWriter);
			n.setBoardCategory(category);
			
			Attachment at = null; //첨부파일이 있다면 담아줄 예정
			
			//multiRequest.getOriginalFileName() 
			// : 원본파일명을 반환하는 메소드 / 없다면 null을 반환한다. 
			if(multiRequest.getOriginalFileName("uploadFile") != null) {
				//원본파일명이 있다면 첨부파일정보 담아주기
				
				at = new Attachment();
				//원본파일명 담기
				at.setOriginName(multiRequest.getOriginalFileName("uploadFile"));
				//변경한 파일명 담기 (서버에 등록된 파일명)
				at.setChangeName(multiRequest.getFilesystemName("uploadFile"));
				//경로 담기
				at.setFilePath("/resources/uploadFiles/");
				
			}
			
			//3.서비스 요청 (게시글정보와 첨부파일 정보 전달)
			int result = new NoticeService().insertBoard(n,at);
			
			if(result>0) { //성공
				session.setAttribute("alertMsg", "공지사항 등록 성공");
				response.sendRedirect(request.getContextPath()+"/list.no?currentPage=1");
			}else {//실패
				//게시글 등록에 실패했다면 서버에 업로드된 파일을 지워야한다.
				
				if(at!=null) {//첨부파일이 있다면 삭제 작업 
					//삭제하고자하는 파일경로로 파일객체 생성하여 delete메소드 수행
					new File(savePath+at.getChangeName()).delete();
				}
				
				session.setAttribute("alertMsg", "게시글 등록 실패");
				
				response.sendRedirect(request.getContextPath()+"/list.no?currentPage=1");
			}
			
		}
	}

}
