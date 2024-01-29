package com.nilili.member.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nilili.member.service.MemberService;
import com.nilili.member.vo.Member;
import com.nilili.subscribe.model.vo.Subscribe;

 
@WebServlet("/mypage.mb")
public class MyPageController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public MyPageController() {
        super();
        // TODO Auto-generated constructor stub
    }
 

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		HttpSession session = request.getSession();
		
		Member member =(Member)session.getAttribute("loginMember");
		
	    int memberNo = 	member.getMemberNO();
	  
	    Subscribe sub=	new MemberService().findSubcribe(memberNo);
	    
	  //마이페이지 에서 구독날짜가 년 월 호 까지 다나와서 년 월만 나오게 바꾸는 작업
	    if(sub!=null) {
	    
	    Date regiDate = sub.getRegiDate();
	  
	    SimpleDateFormat sdf = new SimpleDateFormat("yyyy MM");
	    
	    String fdate = sdf.format(regiDate);
	    
	    request.setAttribute("fdate", fdate);
	    //어짜피 마이페이지에서밖에 안보여질거니까 request영역에서 담는다
	    }
	    session.setAttribute("sub", sub);
	    
		request.getRequestDispatcher("views/member/myPage.jsp").forward(request, response);	
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
