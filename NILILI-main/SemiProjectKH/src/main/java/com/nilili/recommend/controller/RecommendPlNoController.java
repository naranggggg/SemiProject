package com.nilili.recommend.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nilili.member.vo.Member;
import com.nilili.recommend.model.service.RecommendService;
import com.nilili.recommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendPlNoController
 */
@WebServlet("/reco.no")
public class RecommendPlNoController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendPlNoController() {
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
		response.setCharacterEncoding("UTF-8");
		
		//사용자에게 보여준 최종 결과화면을 SUB_RECOMMEND 테이블의 plNo에 update
		//로그인 한 사용자 정보, 최종결과값인 point 필요
		
		  HttpSession session = request.getSession(); 
		  String memberNo = String.valueOf(((Member)session.getAttribute("loginMember")).getMemberNO());
		  int point = Integer.parseInt(request.getParameter("point"))+1;
		  
		  System.out.println(memberNo);
		  System.out.println(point);
		  
		  Recommend r = new Recommend(); 
		  r.setMemberNo(Integer.parseInt(memberNo));
		  r.setPlNo(point);
		  
		  System.out.println("plno업데이트 컨트롤러 : " + r);
		  
		  int result = new RecommendService().updatePlNo(r);
	}

}
