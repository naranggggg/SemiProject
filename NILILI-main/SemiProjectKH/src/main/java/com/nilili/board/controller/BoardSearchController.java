package com.nilili.board.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nilili.board.model.service.BoardService;
import com.nilili.board.model.vo.Board;
import com.nilili.common.model.vo.PageInfo;

/**
 * Servlet implementation class BoardSearchController
 */
@WebServlet("/search.bo")
public class BoardSearchController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardSearchController() {
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
				
				currentPage = 1;
				
				pageLimit = 5;
				boardLimit = 10;
				
				maxPage = (int)Math.ceil((double)listCount/boardLimit);
			
				startPage = (currentPage - 1) / pageLimit * pageLimit + 1 ;
				endPage = startPage + pageLimit - 1;
				
				if(maxPage < endPage) {
					endPage = maxPage;
				}
				
				PageInfo pi = new PageInfo(listCount, currentPage,pageLimit,boardLimit,maxPage,startPage,endPage);
				
				// GET 요청으로부터 검색 조건과 검색어 값을 가져옴
		        String searchField = request.getParameter("searchField");
		        String searchText = request.getParameter("searchText");
		        
		        System.out.println(searchField);
		        System.out.println(searchText);
		        
		        ArrayList<Board> list = new ArrayList<Board>(); // 검색 결과를 담을 List
		        
		        if ("title".equals(searchField)) {
		            // 제목으로 검색
		        	list = new BoardService().searchTitleList(pi, searchText);
		        	
		        } else if ("id".equals(searchField)) {
		        	list = new BoardService().searchIdList(pi, searchText);
		            // 작성자로 검색
		        } else if ("category".equals(searchField)) {
		        	list = new BoardService().searchCategoryList(pi, searchText);
		            // 카테고리로 검색
		        }
		        
		        System.out.println(list);


		        // JSON 형식으로 응답
		        response.setContentType("application/json");
		        response.setCharacterEncoding("UTF-8");
		        PrintWriter out = response.getWriter();
		        Gson gson = new Gson(); // Google Gson 라이브러리를 사용하여 JSON 변환
		        String json = gson.toJson(list);
		        out.write(json);
		        out.close();
		    
				
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
