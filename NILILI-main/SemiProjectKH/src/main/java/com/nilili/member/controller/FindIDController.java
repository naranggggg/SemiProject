package com.nilili.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.member.service.MemberService;

/**
 * Servlet implementation class FindIController
 */
@WebServlet("/findId.mb")
public class FindIDController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FindIDController() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String userName = request.getParameter("userName");
		String userEmail = request.getParameter("userEmailId").concat(request.getParameter("userDomain"));

		String findId = new MemberService().findId(userName, userEmail);
		if (findId != null) {// 찾는아이디가 있을때

				//찾은 아이디 다 안보여주고 일부 가려서 보여주는 작업입니다
			int blindNum = 3; // 가려질 문자의 수
			int length = findId.length();// 문자열의 길이
			int lengthHalf = length / 2;// 반으로 나눈 문자열의 길이

			String plus = "*".repeat(blindNum);// 문자열 반복 ("***")

			String blindId = findId.substring(0, lengthHalf) + plus + findId.substring(lengthHalf + blindNum);
			// findId의 length의 반까지 짜르고 더하고 repeat으로 ***붙여주고 다시 반짜른 이상부터 끝까지 문자열을 더해줍니다

			response.setContentType("text/html;charset =UTF-8");// 인코딩

			response.getWriter().print(blindId);// 서버에서 처리한 걸 jsp로 보내는 작업

		} else {// 찾는아이디가 없을떄

			response.setContentType("text/html;charset =UTF-8");// 인코딩

			response.getWriter().print(findId);// 서버에서 처리한 걸 jsp로 보내는 작업

		}

	}

}
