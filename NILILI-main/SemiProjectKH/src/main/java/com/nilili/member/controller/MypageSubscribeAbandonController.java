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
import com.nilili.subscribe.model.service.SubscribeService;
import com.nilili.subscribe.model.vo.Subscribe;

/**
 * Servlet implementation class MypageAbandonController
 */

//주석
@WebServlet("/abandon.mb")
public class MypageSubscribeAbandonController extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MypageSubscribeAbandonController() {
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
		
		String memberName = request.getParameter("memberName");
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		
		//회원 구독 해지 N 으로 바꾸는 메소드 --은지
		int result = new MemberService().mypageAbandon(memberName,memberNo);
		
		//세션영역에 구독 해지 했다고 바꾸는 거 (실시간으로 바꾸기 로그아웃안하면 구독자들만 사용할수있는거 바로 막아버리기)-- 재혁
		Member loginMember = new MemberService().updateLoginMember(memberNo);
		//메인인덱스로 갈시에 구독기간에 해지한 구독날짜가 그대로 떠서 아예 안나오게 할용도의 메소드 --재혁
		Subscribe sub = new SubscribeService().updateSubscribe(memberNo);
		
		HttpSession session = request.getSession();
		session.setAttribute("loginMember", loginMember);
		session.setAttribute("sub", sub);
		
		response.setContentType("text/html;charset=UTF-8");
		response.getWriter().print(result);
}

}
