package com.nilili.subscribe.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.member.service.MemberService;
import com.nilili.subscribe.model.service.SubscribeService;

@WebServlet("/insert.sb")
public class SubInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public SubInsertController() {
        super();
    }
 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		
		String memberNo = request.getParameter("memberNo");
			
		int result=	new SubscribeService().SubscribeInsert(memberNo);
	
		response.setContentType("text/html;charset =UTF-8");//인코딩
	
		response.getWriter().print(result);
	}

}
