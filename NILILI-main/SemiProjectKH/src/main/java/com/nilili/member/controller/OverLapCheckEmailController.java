package com.nilili.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.member.service.MemberService;

/**
 * Servlet implementation class OverLapCheckEmailController
 */
@WebServlet("/overLapEmail.mb")
public class OverLapCheckEmailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OverLapCheckEmailController() {
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
		
		String emailId = request.getParameter("emailId");
		String custEmailDomain = request.getParameter("custEmailDomain");

		
	
		String email=	emailId+"@"+custEmailDomain;
			
		int count =	new MemberService().overLapCkEmail(email);
		
		if(count>0) {
			response.getWriter().print("NNNNN");
		}else {
			response.getWriter().print("NNNNY");
		}
		

	
		
		
		
	}

}
