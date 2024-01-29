package com.nilili.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.member.service.MemberService;

/**
 * Servlet implementation class UpdatePwdController
 */
@WebServlet("/updatePwd.mb")
public class UpdatePwdController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePwdController() {
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
		//id만 가지고 비밀번호를 update 할려했으나 
		//확실한 보안을 위해서 사용자 정보 다 담아온다
		String updatePwd = request.getParameter("updatePwd");
		String userId = request.getParameter("userId");
		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmailId").concat(request.getParameter("userDomain"));
		
		
		int result=  new MemberService().updatePwd(userId,userName,userEmail,updatePwd);
	
		response.setContentType("text/html;charset =UTF-8");//인코딩
		
		
		response.getWriter().print(result);//서버에서 처리한 걸 jsp로 보내는 작업
		
		
	}

}
