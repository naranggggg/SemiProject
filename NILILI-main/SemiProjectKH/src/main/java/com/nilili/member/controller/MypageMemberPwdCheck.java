package com.nilili.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.member.service.MemberService;

/**
 * Servlet implementation class MypageMemberPwdCheck
 */
@WebServlet("/memberPwdCk.mb")
public class MypageMemberPwdCheck extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageMemberPwdCheck() {
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
		
		request.setCharacterEncoding("UTF-8");
		
		String memberPwd = request.getParameter("memberPwd");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		  
		int count = new MemberService().myPageMemberPwdCheck(memberNo,memberPwd);
		
		response.setContentType("text/html;charset=UTF-8");// 인코딩

		response.getWriter().print(count);// 서버에서 처리한 걸 jsp로 보내는 작업
		
		
	}

}
