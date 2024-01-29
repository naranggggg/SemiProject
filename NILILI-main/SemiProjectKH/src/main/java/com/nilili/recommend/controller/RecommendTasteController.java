package com.nilili.recommend.controller;

import java.io.BufferedReader;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.nilili.member.vo.Member;
import com.nilili.recommend.model.service.RecommendService;
import com.nilili.recommend.model.vo.Recommend;

/**
 * Servlet implementation class RecommendTasteController
 */
@WebServlet("/reco.ts")
public class RecommendTasteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecommendTasteController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setCharacterEncoding("UTF-8");
		
        // 클라이언트에서 전송된 JSON 데이터 읽어오기
        BufferedReader reader = request.getReader();
        StringBuilder sb = new StringBuilder();
        String line;
        while ((line = reader.readLine()) != null) {
            sb.append(line);
        }
        
        String jsonData = sb.toString();
        
	    // JSON 데이터를 객체로 파싱 (Gson 사용)

	    int taste1;
	    int taste2;
	    int taste3;
        
        //int로 받아서 taste 컬럼에 숫자로 넣기
        //taste1 = 0:액티비티 / 1:식도락 / 2:힐링 / 3:쇼핑
        //taste2 = 0:유적지 / 1:관광지 / 2:체험 / 3:반려동물
        //taste3 = 0:사진명소 / 1:시끌벅적한 장소 / 2:자연 속 산책 / 3:카페와 맛집
        taste1 = Integer.parseInt(jsonData.substring(57,58));
        taste2 = Integer.parseInt(jsonData.substring(87,88));
        taste3 = Integer.parseInt(jsonData.substring(117,118));
        
//        System.out.println(taste1);
//        System.out.println(taste2);
//        System.out.println(taste3);
        
        
        response.setContentType("text/plain");
        response.getWriter().write("Data received on server: " + jsonData);

        //System.out.println(taste1+","+taste2+","+taste3);
        
        //현재 로그인 한 유저 정보 넘기기
        //memberNO에 맞춰서 taste(num) 컬럼 및 최종 추천지역(num) 업데이트 해야함
        HttpSession session = request.getSession(); 
        String memberNo = String.valueOf(((Member)session.getAttribute("loginMember")).getMemberNO());
		
        int memberNum = Integer.parseInt(memberNo);
        
        
        Recommend r = new Recommend(memberNum, taste1, taste2, taste3);
        
        
//        r.setMemberNo(Integer.parseInt(memberNo));
//        r.setTaste1(taste1);
//        r.setTaste2(taste2);
//        r.setTaste3(taste3);
//        System.out.println(r.getTaste1());
//        System.out.println(memberNo);
//        System.out.println("controller : " + r);
        
        
        int result = new RecommendService().updateTaste(r);
        

	
	}

}
