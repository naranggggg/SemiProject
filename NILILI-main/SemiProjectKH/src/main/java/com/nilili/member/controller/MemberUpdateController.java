package com.nilili.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nilili.member.service.MemberService;
import com.nilili.member.vo.Member;

/**
 * Servlet implementation class MemberUpdateController
 */
@WebServlet("/update.mb")
public class MemberUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateController() {
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
		
		int memberNO = Integer.parseInt(request.getParameter("memberNo"));
		
		
		String memberId = request.getParameter("memberId");
		
		String fnum = request.getParameter("fnum");
		String lnum = request.getParameter("lnum");
		String memberPhone = "010-"+ fnum+"-"+ lnum;

		String eid=request.getParameter("eid");
		String domain = request.getParameter("domain");
	
		String memberEmail =eid+"@"+domain;
		String fads = request.getParameter("fads");
		String anum = request.getParameter("anum");
		String lads = request.getParameter("lads");
		String memberAddress = fads+anum+lads;
		
		
		
		Member m = new Member(memberNO, memberId,memberPhone,memberEmail,memberAddress);
		
		System.out.println(m);
		
		Member updateMem = new MemberService().updateMember(m);
		
		if(updateMem == null) {
			request.setAttribute("alertMsg", "회원정보 수정 실패");

		}else {
			HttpSession session =request.getSession();
			session.setAttribute("loginMember",updateMem);
			session.setAttribute("alertMsg", "정보수정 완료");
			response.sendRedirect(request.getContextPath()+"/mypage.mb");
		}

	}

}
