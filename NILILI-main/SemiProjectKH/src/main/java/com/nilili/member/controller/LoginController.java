package com.nilili.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nilili.member.service.MemberService;
import com.nilili.member.vo.Member;
import com.nilili.subscribe.model.service.SubscribeService;
import com.nilili.subscribe.model.vo.Subscribe;

/**
 * Servlet implementation class LoginController
 */
@WebServlet("/login.mb")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
	
		String memberId = request.getParameter("memberId");
		String memberPwd = request.getParameter("memberPwd");
		
		//아이디저장 
		String saveId = request.getParameter("saveId"); // on 아니면 null로 반환(체크하면 on 안하면 null)
	
		
		Cookie cookie = null;
		//사용자의 편의성을 위하여 비밀번호 잘못입력했을때를 대비하여
		//아이디창은 안지우고 그대로 냅둔다 
		//하지만 1초로 해놔서 새로고침시 지워짐--재혁
		if(memberId != null) {
			
			cookie = new Cookie("loginFailId",memberId);
			cookie.setMaxAge(1);//
			response.addCookie(cookie);
			
		}
		//아이디 저장 
		if(saveId != null && saveId.equals("on")) {
			
			cookie = new Cookie("memberId",memberId);
			
			cookie.setMaxAge(60*60*24);
			
			response.addCookie(cookie);
						
		}else {
			cookie = new Cookie("memberId",null);
			
			cookie.setMaxAge(0);
			response.addCookie(cookie);
			
		}
		//로그인 정보 저장 
		String loginSave = request.getParameter("loginSave");
		
		if(loginSave != null && loginSave.equals("on")) {
			
			cookie = new Cookie("memberPwd",memberPwd);
			
			cookie.setMaxAge(60*60*24);
			response.addCookie(cookie);
			
			
		}else {
			cookie = new Cookie("memberPwd",null);
			cookie.setMaxAge(0);
			response.addCookie(cookie);
		}
		
		
		
		
		
		
		String before = request.getHeader("referer");
		
		Member member = new MemberService().loginMember(memberId,memberPwd);
		//구독정보도 꺼내오기 (받아온 멤버객체에서 memberNO 꺼내오기)
		
		
		if(member != null) {
			
		int memberNo = member.getMemberNO();
		Subscribe sub =	new SubscribeService().updateSubscribe(memberNo);
		session.setAttribute("loginMember", member);
		session.setAttribute("sub", sub);
		response.sendRedirect(before);
		
		}else {
			session.setAttribute("alertMsg","아이디와 비밀번호를 다시 확인해주세요" );
			response.sendRedirect(before);
			
		}
		
		
		
	}

}
