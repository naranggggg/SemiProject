package com.nilili.member.dao;

import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import com.nilili.common.JDBCTemplate;
import com.nilili.member.vo.Member;
import com.nilili.subscribe.model.vo.Subscribe;

public class MemberDao {

	private Properties prop = new Properties();
 
	// 기본생성자가 생성되는 시점(메소드호출시점)에 파일 읽어오기
	public MemberDao() {

		String filePath = MemberDao.class.getResource("/db/sql/member-mapper.xml").getPath();

		try {
			prop.loadFromXML(new FileInputStream(filePath));

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public int insertMember(Connection conn, Member member) {

		PreparedStatement pstmt = null;
		int result = 0;
		String sql = prop.getProperty("insertMember");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberBirth());
			pstmt.setString(5, member.getMemberGender());
			pstmt.setString(6, member.getMemberPhone());
			pstmt.setString(7, member.getMemberEmail());
			pstmt.setString(8, member.getMemberAddress());

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);

		}

		return result;

	}

	public int overLapCk(Connection conn, String idInput) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("overLapCk");
		int count = 0; // 아이디 있으면 1 없으면 0

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, idInput);
			rset = pstmt.executeQuery();

			if (rset.next()) {

				count = rset.getInt("COUNT");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return count;

	}

	public Member loginMember(Connection conn, String memberId, String memberPwd) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("loginMember");
		Member member = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);

			rset = pstmt.executeQuery();

			if (rset.next()) {
				member = new Member(rset.getInt("MEMBER_NO"), rset.getString("MEMBER_ID"), rset.getString("MEMBER_PWD"),
						rset.getString("MEMBER_NAME"), rset.getString("MEMBER_BIRTH"), rset.getString("MEMBER_GENDER"),
						rset.getString("MEMBER_PHONE"), rset.getString("MEMBER_EMAIL"),
						rset.getString("MEMBER_ADDRESS"), rset.getString("MEMBER_SUBSCRIBE"),
						rset.getString("MEMBER_DESCRIPTION"), rset.getDate("MEMBER_REGI_DATE"),
						rset.getDate("MEMBER_MODI_DATE"), rset.getString("MEMBER_USE_YN"));

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return member;

	}

	public String findId(Connection conn, String userName, String userEmail) {

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("findId");
		String findId = null;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userName);
			pstmt.setString(2, userEmail);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				findId = rset.getString("MEMBER_ID");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return findId;
	}

	public int findPwd(Connection conn, String userId, String userName, String userEmail) {

		ResultSet rset = null;
		PreparedStatement pstmt = null;
		int count = 0;
		String sql = prop.getProperty("findPwd");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userName);
			pstmt.setString(3, userEmail);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				count = rset.getInt("COUNT");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}

		return count;

	}

	public int updatePwd(Connection conn, String userId, String userName, String userEmail, String userPwd) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("updatePwd");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, userPwd);
			pstmt.setString(2, userId);
			pstmt.setString(3, userName);
			pstmt.setString(4, userEmail);

			result = pstmt.executeUpdate();
			// 주석

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);
		}
		return result;

	}

//주석
	public int SubscribeChange(Connection conn, String memberName, int memberNo) {

		PreparedStatement pstmt = null;
		String sql = prop.getProperty("SubscribeChange");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setInt(2, memberNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);
		}

		return result;

	}

	public int overLapCkEmail(Connection conn, String email) {

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("overLapCkEmail");

		try {
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, email);

			rset = pstmt.executeQuery();

			if (rset.next()) {

				count = rset.getInt("count");

			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return count;

	}

	public int updateMember(Connection conn, Member m) {

		int result = 0;
		PreparedStatement pstmt = null;

		String sql = prop.getProperty("updateMember");

		System.out.println("dao:" + m);

		try {

			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, m.getMemberPhone());
			pstmt.setString(2, m.getMemberEmail());
			pstmt.setInt(3, m.getMemberNO());

			result = pstmt.executeUpdate();

			System.out.println(result);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Member selectMember(Connection conn, String memberId) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;
		String sql = prop.getProperty("selectMember");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"), rset.getString("MEMBER_ID"), rset.getString("MEMBER_PWD"),
						rset.getString("MEMBER_NAME"), rset.getString("MEMBER_BIRTH"), rset.getString("MEMBER_GENDER"),
						rset.getString("MEMBER_PHONE"), rset.getString("MEMBER_EMAIL"),
						rset.getString("MEMBER_ADDRESS"), rset.getString("MEMBER_SUBSCRIBE"),
						rset.getString("MEMBER_DESCRIPTION"), rset.getDate("MEMBER_REGI_DATE"),
						rset.getDate("MEMBER_MODI_DATE"), rset.getString("MEMBER_USE_YN"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int mypageUpdatePwd(Connection conn, int memberNo, String memberPwd, String updatePwd) {

		int result = 0;
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("myUpdatePwd");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, updatePwd);
			pstmt.setString(2, memberPwd);
			pstmt.setInt(3, memberNo);

			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}

		return result;
	}

	public Member selectMember2(Connection conn, int memberNo) {
		ResultSet rset = null;
		PreparedStatement pstmt = null;
		Member m = null;

		String sql = prop.getProperty("selectMember2");

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {
				m = new Member(rset.getInt("MEMBER_NO"), rset.getString("MEMBER_ID"), rset.getString("MEMBER_PWD"),
						rset.getString("MEMBER_NAME"), rset.getString("MEMBER_BIRTH"), rset.getString("MEMBER_GENDER"),
						rset.getString("MEMBER_PHONE"), rset.getString("MEMBER_EMAIL"),
						rset.getString("MEMBER_ADDRESS"), rset.getString("MEMBER_SUBSCRIBE"),
						rset.getString("MEMBER_DESCRIPTION"), rset.getDate("MEMBER_REGI_DATE"),
						rset.getDate("MEMBER_MODI_DATE"), rset.getString("MEMBER_USE_YN"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}

	public int mypageSubscribeChange(Connection conn, String memberName, String memberNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mypageSubscribeChange");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			JDBCTemplate.close(pstmt);
		}

		return result;

	}

	public int mypageAbandon(Connection conn, String memberName, int memberNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("mypageAbandon");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setInt(2, memberNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}

	public Subscribe findSubcribe(Connection conn, int memberNo) {
		//원래 subscribe에 가야하지만 유지보수할때 애매모호해서 그냥 멤버dao에 해놨습니다(마이페이지에서 구독 정보 뜨는 메소드) --재혁

		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String sql = prop.getProperty("findSubcribe");
		Subscribe sub = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, memberNo);
			rset = pstmt.executeQuery();

			if (rset.next()) {

				sub = new Subscribe(rset.getInt("SUB_NO"), rset.getInt("MEMBER_NO"), rset.getInt("TASTE_1"),
						rset.getInt("TASTE_2"), rset.getInt("TASTE_3"), rset.getString("DESCRIPTION"),
						rset.getDate("REGI_DATE"), rset.getDate("MODI_DATE"), rset.getString("USE_YN"),
						rset.getDate("EXPIRATION_DATE"));

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);

		}
		return sub;
	}

	public int memberDelete(Connection conn, String memberName, String memberNo) {
		PreparedStatement pstmt = null;
		String sql = prop.getProperty("memberDelete");
		int result = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberName);
			pstmt.setString(2, memberNo);

			result = pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);

		}
		return result;
	}

	public int myPageMemberPwdCheck(Connection conn, int memberNo, String memberPwd) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int count = 0;
		String sql = prop.getProperty("myPageMemberPwdCheck");
		
		try {
			pstmt = conn.prepareStatement(sql);
		
			pstmt.setString(1, memberPwd);
			pstmt.setInt(2, memberNo);
		
			rset = pstmt.executeQuery();
			
			if(rset.next()) {
				
				count = rset.getInt("COUNT");
			
				
				
			}
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
			
		}
		return count;
		
		
		
		
		
		
	}



}
