package com.nilili.board.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.board.model.service.BoardService;
import com.nilili.board.model.vo.Board;
import com.nilili.common.model.vo.PageInfo;

/**
 * Servlet implementation class HotBoard
 */
@WebServlet("/hot.bo")
public class HotBoard extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HotBoard() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//페이징 처리
				int listCount;
				int currentPage;
				int pageLimit;
				int boardLimit;
				int maxPage;
				int startPage;
				int endPage;
				
				listCount = new BoardService().listCount();
				
				currentPage = Integer.parseInt(request.getParameter("currentPage"));
				
				pageLimit = 5;
				boardLimit = 10;
				
				maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
				endPage = startPage + pageLimit - 1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(listCount, currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
				
				ArrayList<Board> list = new BoardService().hotList(pi);
				
				
				request.setAttribute("list", list);
				
				request.setAttribute("pi", pi);
				
				// boardListView페이지로 요청 포워딩
				request.getRequestDispatcher("views/board/hotBoard.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
