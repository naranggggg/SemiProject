package com.nilili.member.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.nilili.member.service.MemberService;
import com.nilili.member.vo.Member;

/**
 * 
 * Servlet implementation class EmrollController
 */
@WebServlet("/enrollForm.mb")
public class EmrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EmrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.getRequestDispatcher("views/member/EnrollForm.jsp").forward(request, response);	
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		
		String memberId = request.getParameter("userId");//아이디
		String memberPwd = request.getParameter("userPwd");//비번
		String memberName = request.getParameter("userName");//이름
		String beforeMemberBirth = request.getParameter("userYear")+"-"+request.getParameter("userMonth")+"-"
										+request.getParameter("userDay");//1998718
																		//이렇게 받아오면 1998-07-18 로 안됨
																		//밑에서 변환 작업 
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		java.util.Date date = null;
		
		try {
			date = dateFormat.parse(beforeMemberBirth);
				
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String memberBirth = dateFormat.format(date);		
		String memberGender = request.getParameter("userGender");
		String memberPhone = request.getParameter("firstPNum")
				.concat("-")
				.concat(request.getParameter("midPNum")
						.concat("-")
						.concat(request.getParameter("lastPNum")));//핸드폰 번호
		String memberEmail = request.getParameter("custId")+"@"+request.getParameter("domain");//이메일
		
		String memberAddress ="("+request.getParameter("memberPostCode")+")"
		+ "  "+request.getParameter("memberAddress")+
		", "+request.getParameter("memberDetailAddress")+
		request.getParameter("memberExtraAddress");//집주소
		
		Member member = new Member(memberId,memberPwd,memberName,memberBirth,memberGender,memberPhone,memberEmail,memberAddress);
		
		int result =new MemberService().insertMember(member);
		
		
		if(result>0) {
			
			request.getRequestDispatcher("views/member/afterEnroll.jsp").forward(request, response);//성공적으로 커밋되면
																									//회원가입 축하페이지
			
		}else {
			request.getRequestDispatcher("views/member/EnrollForm.jsp").forward(request, response);
																								//이상 생겨 롤백되면
																								//회원가입 페이지 그대로
			
		}
		
		
	}

}
