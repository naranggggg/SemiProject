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
 * Servlet implementation class MypageUpdatePwdController
 */
@WebServlet("/updatePwd.mp")
public class MypageUpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
         
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageUpdatePwdController() {
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
	//주석
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
		
		String memberPwd = request.getParameter("memberPwd");
		String updatePwd = request.getParameter("updatePwd");
		String updateChkPwd = request.getParameter("updateChkPwd");
		
		HttpSession session = request.getSession();
		Member loginMember = (Member)session.getAttribute("loginMember");
		int memberNo = loginMember.getMemberNO();
		
		Member updateMem = new MemberService().mypageUpdatePwd(memberNo,memberPwd,updatePwd);
		
		if(updateMem != null) {
			session.setAttribute("loginMember", updateMem);
			session.setAttribute("alertMsg", "비밀번호 변경 성공");
			response.sendRedirect(request.getContextPath()+"/mypage.mb");
			
		}else {
			request.setAttribute("alertMsg", "비밀번호 수정 실패");
		}
	}

}
