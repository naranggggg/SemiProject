package com.nilili.board.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.nilili.board.model.service.BoardService;

/**
 * Servlet implementation class LikeCheck
 */
@WebServlet("/likeCheck.bo")
public class LikeCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LikeCheck() {
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
		
		System.out.println("일로왔나");
		
		int bno = Integer.parseInt(request.getParameter("bno"));
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		int result = new BoardService().likeMemCheck(bno, memberNo);
		
		// JSON 형식으로 응답
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        PrintWriter out = response.getWriter();
        Gson gson = new Gson(); // Google Gson 라이브러리를 사용하여 JSON 변환
        String json = gson.toJson(result);
        out.write(json);
        out.close();
	}

}
