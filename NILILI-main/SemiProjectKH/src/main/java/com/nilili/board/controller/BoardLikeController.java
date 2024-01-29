package com.nilili.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.nilili.board.model.service.BoardService;

/**
 * Servlet implementation class BoardLikeController
 */
@WebServlet("/likeInsert.bo")
public class BoardLikeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardLikeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		int num = 0;
		
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		
		// 동일 게시글에 대한 이전 추천 여부 검색
		int result = new BoardService().checkLike(bno, memberNo);
		
		if(result == 0){ // 추천하지 않았다면 추천 추가
			num = new BoardService().updateLike(bno, memberNo);
		}else{ // 추천을 하였다면 추천 삭제
			num = new BoardService().deleteLike(bno, memberNo);
		}
		
	}

}
