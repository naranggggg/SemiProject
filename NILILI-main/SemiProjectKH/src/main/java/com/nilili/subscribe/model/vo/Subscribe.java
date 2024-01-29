package com.nilili.subscribe.model.vo;

import java.sql.Date;

public class Subscribe {
/* 
 * 
 * SUB_NO	NUMBER
MEMBER_NO	NUMBER
TASTE_1	NUMBER
TASTE_2	NUMBER
TASTE_3	NUMBER
DESCRIPTION	VARCHAR2(4000 BYTE)
REGI_DATE	DATE
MODI_DATE	DATE
USE_YN	VARCHAR2(1 BYTE)
EXPIRATION_DATE	DATE
 * 
 * 
 * */
	
	
	private int subNo;//구독번호
	private int memberNo;//회원번호
	private int tasteFirst;//여행취향1
	private int tasteSecond;//여행취향2
	private int tasteThird;//여행취향3
	private String description;//정보..?
	private Date regiDate;//최초시작일
	private Date modiDate;// 수정일 (필요할까?)
	private String useYn;//구독해지
	private Date expirationDate;//마감날짜
	public Subscribe() {
		super();
	}
	
	
	
	
	
	public Subscribe(int subNo, int memberNo, int tasteFirst, int tasteSecond, int tasteThird, String description,
			Date regiDate, Date modiDate, String useYn, Date expirationDate) {
		super();
		this.subNo = subNo;
		this.memberNo = memberNo;
		this.tasteFirst = tasteFirst;
		this.tasteSecond = tasteSecond;
		this.tasteThird = tasteThird;
		this.description = description;
		this.regiDate = regiDate;
		this.modiDate = modiDate;
		this.useYn = useYn;
		this.expirationDate = expirationDate;
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	public int getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}
	public int getTasteFirst() {
		return tasteFirst;
	}
	public void setTasteFirst(int tasteFirst) {
		this.tasteFirst = tasteFirst;
	}
	public int getTasteSecond() {
		return tasteSecond;
	}
	public void setTasteSecond(int tasteSecond) {
		this.tasteSecond = tasteSecond;
	}
	public int getTasteThird() {
		return tasteThird;
	}
	public void setTasteThird(int tasteThird) {
		this.tasteThird = tasteThird;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getRegiDate() {
		return regiDate;
	}
	public void setRegiDate(Date regiDate) {
		this.regiDate = regiDate;
	}
	public Date getModiDate() {
		return modiDate;
	}
	public void setModiDate(Date modiDate) {
		this.modiDate = modiDate;
	}
	public String getUseYn() {
		return useYn;
	}
	public void setUseYn(String useYn) {
		this.useYn = useYn;
	}
	public Date getExpirationDate() {
		return expirationDate;
	}
	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}
	//주석
	
	
	
}
