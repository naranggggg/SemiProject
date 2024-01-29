package com.nilili.member.service;

import java.sql.Connection;

import com.nilili.common.JDBCTemplate;
import com.nilili.member.dao.MemberDao;
import com.nilili.member.vo.Member;
import com.nilili.subscribe.model.dao.SubscribeDao;
import com.nilili.subscribe.model.vo.Subscribe;

public class MemberService {

	public int insertMember(Member member) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().insertMember(conn, member);

		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
 
		return result;

	}

	public int overLapCk(String idInput) {
		Connection conn = JDBCTemplate.getConnection();

		int count = new MemberDao().overLapCk(conn, idInput);

		JDBCTemplate.close(conn);

		return count;

	}

	public Member loginMember(String memberId, String memberPwd) {
		Connection conn = JDBCTemplate.getConnection();

		Member member = new MemberDao().loginMember(conn, memberId, memberPwd);

		JDBCTemplate.close(conn);

		return member;
	}

	public String findId(String userName, String userEmail) {

		Connection conn = JDBCTemplate.getConnection();

		String findId = new MemberDao().findId(conn, userName, userEmail);

		JDBCTemplate.close(conn);

		return findId;

	}

	public int findPwd(String userId, String userName, String userEmail) {
		Connection conn = JDBCTemplate.getConnection();

		int count = new MemberDao().findPwd(conn, userId, userName, userEmail);

		JDBCTemplate.close(conn);
		return count;
	}

	public int updatePwd(String userId, String userName, String userEmail, String updatePwd) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().updatePwd(conn, userId, userName, userEmail, updatePwd);

		if (result > 0) {

			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);

		}

		return result;

	}

	public int SubscribeChange(String memberName, int memberNo) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().SubscribeChange(conn, memberName, memberNo);

		if (result > 0) {

			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);

		return result;
	}

	public int overLapCkEmail(String email) {

		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().overLapCkEmail(conn, email);

		JDBCTemplate.close(conn);

		return result;

	}

	public Member updateMember(Member m) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().updateMember(conn, m);

		Member updateMem = null;

		if (result > 0) {
			JDBCTemplate.commit(conn);
			//밑에 selectMember2 랑 겹쳐서 둘중에 하나 지워도 될것같습니다. 돌아가는데 이상은 xxxxx - 재혁-
			updateMem = new MemberDao().selectMember(conn, m.getMemberId());
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);

		return updateMem;
	}

	public Member mypageUpdatePwd(int memberNo, String memberPwd, String updatePwd) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().mypageUpdatePwd(conn, memberNo, memberPwd, updatePwd);
		Member mpUpdateMem = null; // 회원정보 담을 변수
		if (result > 0) {
			JDBCTemplate.commit(conn);
			mpUpdateMem = new MemberDao().selectMember2(conn, memberNo);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		return mpUpdateMem;
	}

//주석
	public int mypageAbandon(String memberName, int memberNo) {
		Connection conn = JDBCTemplate.getConnection();

		int result = new MemberDao().mypageAbandon(conn, memberName, memberNo);

		if (result > 0) {
			
			int result2 =	new SubscribeDao().subscribeDelete(conn,memberNo);
			     
			if(result * result2>0) {
						JDBCTemplate.commit(conn);
			
			}else {
						JDBCTemplate.rollback(conn);
			}
			
			JDBCTemplate.close(conn);
				return result *result2; // 멤버에서 subscribe 도 n으로 고쳐지고 subscribe에서 use도 n으로 고쳐지면 보내라
		
		}else {
			JDBCTemplate.rollback(conn);
		}
		
		JDBCTemplate.close(conn);
		
		return 0;//만약에 이프문을 안타면 0으로 가라
		
	}

	public Subscribe findSubcribe(int memberNo) {

		Connection conn = JDBCTemplate.getConnection();

		Subscribe sub = new MemberDao().findSubcribe(conn, memberNo);

		JDBCTemplate.close(conn);

		return sub;
	}

	public int memberDelete(String memberName, String memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDao().memberDelete(conn, memberName, memberNo);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}

		JDBCTemplate.close(conn);
		return result;
	}

	public Member updateLoginMember(int memberNo) {
		Connection conn = JDBCTemplate.getConnection();
		//구독 업데이트나 회원 정보의 수정이 있을때 사용하는 메소드입니다(바로 세션영역의loginMember의 정보를 교체하는 작업)
	Member memberLogin = new MemberDao().selectMember2(conn, memberNo);
	System.out.println("재혁님 건강을 위해 흡연을 삼가하시고 키보드는 언젠가 훔쳐갑니다.");
	return memberLogin;
		
	}

	public int myPageMemberPwdCheck(int memberNo, String memberPwd) {
		
		Connection conn = JDBCTemplate.getConnection();
		
	int count =	new MemberDao().myPageMemberPwdCheck(conn,memberNo,memberPwd);
		
	JDBCTemplate.close(conn);
		
		
		return count;
		
	}



}
