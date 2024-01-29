package com.nilili.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nilili.board.model.service.BoardService;

/**
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/delete.bo")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//삭제할 글번호 추출
		
				int bno = Integer.parseInt(request.getParameter("bno"));
				
				//글번호로 삭제요청 보내기 
				int result = new BoardService().deleteBoard(bno);
				
				//세션 
				HttpSession session = request.getSession();
				
				if(result>0) {//성공적으로 삭제 완료 
					session.setAttribute("alertMsg", "게시글 삭제성공.");
					response.sendRedirect(request.getContextPath()+"/list.bo?currentPage=1"); //목록페이지 보내주기 
				}else { //실패
					session.setAttribute("alertMsg", "삭제 실패");
					response.sendRedirect(request.getContextPath()+"/detail.bo?bno="+bno);//상세페이지 보내주기
				}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
