package com.nilili.member.vo;

import java.sql.Date;

public class Member {
//주석 
private int memberNO;//회원 번호
private String memberId;//회원아이디
private String memberPwd;//회원비번
private String memberName;//회원이름
private String memberBirth;//회원생일
private String memberGender;//회원성별
private String memberPhone;//회원폰번
private String memberEmail;//회원이메일
private String memberAddress;//	회원집주소
private String memberSubscribe;//구독여부 Y/N
private String memberDescription;//회원특징(관리자가 기숧)
private Date memberRegiDate;//최초 회원가입일
private Date memberModidate;//수정일
private String memberUseYn;//탈퇴한 회원들 정보 조회 x (컨셉은 몇일뒤 삭제)






public Member(int memberNO, String memberId, String memberPhone, String memberEmail, String memberAddress) {
	super();
	this.memberNO = memberNO;
	this.memberId = memberId;
	this.memberPhone = memberPhone;
	this.memberEmail = memberEmail;
	this.memberAddress = memberAddress;
}



public Member(String memberId, String memberPhone, String memberEmail, String memberAddress) {
	super();
	this.memberId = memberId;
	this.memberPhone = memberPhone;
	this.memberEmail = memberEmail;
	this.memberAddress = memberAddress;
}





public Member(String memberId, String memberPwd, String memberName, String memberBirth, String memberGender,
		String memberPhone, String memberEmail, String memberAddress) {
	super();
	this.memberId = memberId;
	this.memberPwd = memberPwd;
	this.memberName = memberName;
	this.memberBirth = memberBirth;
	this.memberGender = memberGender;
	this.memberPhone = memberPhone;
	this.memberEmail = memberEmail;
	this.memberAddress = memberAddress;
}










public Member(int memberNO, String memberId, String memberPwd, String memberName, String memberBirth,
		String memberGender, String memberPhone, String memberEmail, String memberAddress, String memberSubscribe,
		String memberDescription, Date memberRegiDate, Date memberModidate, String memberUseYn) {
	super();
	this.memberNO = memberNO;
	this.memberId = memberId;
	this.memberPwd = memberPwd;
	this.memberName = memberName;
	this.memberBirth = memberBirth;
	this.memberGender = memberGender;
	this.memberPhone = memberPhone;
	this.memberEmail = memberEmail;
	this.memberAddress = memberAddress;
	this.memberSubscribe = memberSubscribe;
	this.memberDescription = memberDescription;
	this.memberRegiDate = memberRegiDate;
	this.memberModidate = memberModidate;
	this.memberUseYn = memberUseYn;
}





public int getMemberNO() {
	return memberNO;
}

public void setMemberNO(int memberNO) {
	this.memberNO = memberNO;
}

public String getMemberId() {
	return memberId;
}

public void setMemberId(String memberId) {
	this.memberId = memberId;
}

public String getMemberPwd() {
	return memberPwd;
}

public void setMemberPwd(String memberPwd) {
	this.memberPwd = memberPwd;
}

public String getMemberName() {
	return memberName;
}

public void setMemberName(String memberName) {
	this.memberName = memberName;
}

public String getMemberBirth() {
	return memberBirth;
}

public void setMemberBirth(String memberBirth) {
	this.memberBirth = memberBirth;
}

public String getMemberGender() {
	return memberGender;
}

public void setMemberGender(String memberGender) {
	this.memberGender = memberGender;
}

public String getMemberPhone() {
	return memberPhone;
}

public void setMemberPhone(String memberPhone) {
	this.memberPhone = memberPhone;
}

public String getMemberEmail() {
	return memberEmail;
}

public void setMemberEmail(String memberEmail) {
	this.memberEmail = memberEmail;
}

public String getMemberAddress() {
	return memberAddress;
}

public void setMemberAddress(String memberAddress) {
	this.memberAddress = memberAddress;
}





public String getMemberSubscribe() {
	return memberSubscribe;
}





public void setMemberSubscribe(String memberSubscribe) {
	this.memberSubscribe = memberSubscribe;
}





public String getMemberDescription() {
	return memberDescription;
}





public void setMemberDescription(String memberDescription) {
	this.memberDescription = memberDescription;
}





public Date getMemberRegiDate() {
	return memberRegiDate;
}





public void setMemberRegiDate(Date memberRegiDate) {
	this.memberRegiDate = memberRegiDate;
}





public Date getMemberModidate() {
	return memberModidate;
}





public void setMemberModidate(Date memberModidate) {
	this.memberModidate = memberModidate;
}





public String getMemberUseYn() {
	return memberUseYn;
}





public void setMemberUseYn(String memberUseYn) {
	this.memberUseYn = memberUseYn;
}





@Override
public String toString() {
	return "Member [memberNO=" + memberNO + ", memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName="
			+ memberName + ", memberBirth=" + memberBirth + ", memberGender=" + memberGender + ", memberPhone="
			+ memberPhone + ", memberEmail=" + memberEmail + ", memberAddress=" + memberAddress + ", memberSubscribe="
			+ memberSubscribe + ", memberDescription=" + memberDescription + ", memberRegiDate=" + memberRegiDate
			+ ", memberModidate=" + memberModidate + ", memberUseYn=" + memberUseYn + "]";
}







	
	
	
	
}
