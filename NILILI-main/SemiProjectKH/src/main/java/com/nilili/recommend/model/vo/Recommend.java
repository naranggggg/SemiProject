package com.nilili.recommend.model.vo;

import java.sql.Date;

public class Recommend {
//	OUTPUT
//	PLACE 테이블
//	PL_NO
//	PL_NAME
//	PL_ADDRESS
//	PL_LOCATION
//	PL_PHOTO_PATH
//	PL_INFO
//	PREFERENCE
//	DESCRIPTION
//	REGI_DATE
//	MODI_DATE
//	USE_YN
//	
//	INPUT
//	SUB_RECOMMEND 테이블
//	RECOMMEND_NO
//	MEMBER_NO
//	LETTER_NO
//	SUBSCRIBE 테이블
//	SUB_NO
//	TASTE_1
//	TASTE_2
//	TASTE_3
//	EXPIRATION_DATE
	
	private int plNo;
	private String plName;
	private String plAddress;
	private String plLocation;
	private String plPhotoPath;
	private String plInfo;
	private String preference;
	private String description;
	private Date regiDate;
	private Date modiDate;
	private String useYn;
	private int recommendNo;
	private int memberNo;
	private int letterNo;
	private int subNo;
	private int taste1;
	private int taste2;
	private int taste3;
	private Date expirationDate;
	
	
	
	public Recommend() {
		super();
	}



	public Recommend(int memberNo, int taste1, int taste2, int taste3) {
		super();
		this.memberNo = memberNo;
		this.taste1 = taste1;
		this.taste2 = taste2;
		this.taste3 = taste3;
	}



	public Recommend(int plNo, String plName, String plAddress, String plLocation, String plPhotoPath, String plInfo,
			String preference, String description, Date regiDate, Date modiDate, String useYn, int recommendNo,
			int memberNo, int letterNo, int subNo, int taste1, int taste2, int taste3, Date expirationDate) {
		super();
		this.plNo = plNo;	
		this.plName = plName;
		this.plAddress = plAddress;
		this.plLocation = plLocation;
		this.plPhotoPath = plPhotoPath;
		this.plInfo = plInfo;
		this.preference = preference;
		this.description = description;
		this.regiDate = regiDate;
		this.modiDate = modiDate;
		this.useYn = useYn;
		this.recommendNo = recommendNo;
		this.memberNo = memberNo;
		this.letterNo = letterNo;
		this.subNo = subNo;
		this.taste1 = taste1;
		this.taste2 = taste2;
		this.taste3 = taste3;
		this.expirationDate = expirationDate;
	}

	//결과화면 조회 vo 
	public Recommend(int plNo, String plName, String plAddress, String plInfo, String useYn) {
		this.plNo = plNo;
		this.plName = plName;
		this.plAddress = plAddress;
		this.plInfo = plInfo;
		this.useYn = useYn;
	}

	public int getPlNo() {
		return plNo;
	}



	public void setPlNo(int plNo) {
		this.plNo = plNo;
	}



	public String getPlName() {	
		return plName;
	}



	public void setPlName(String plName) {
		this.plName = plName;
	}



	public String getPlAddress() {
		return plAddress;
	}



	public void setPlAddress(String plAddress) {
		this.plAddress = plAddress;
	}



	public String getPlLocation() {
		return plLocation;
	}



	public void setPlLocation(String plLocation) {
		this.plLocation = plLocation;
	}



	public String getPlPhotoPath() {
		return plPhotoPath;
	}



	public void setPlPhotoPath(String plPhotoPath) {
		this.plPhotoPath = plPhotoPath;
	}



	public String getPlInfo() {
		return plInfo;
	}



	public void setPlInfo(String plInfo) {
		this.plInfo = plInfo;
	}



	public String getPreference() {
		return preference;
	}



	public void setPreference(String preference) {
		this.preference = preference;
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



	public int getRecommendNo() {
		return recommendNo;
	}



	public void setRecommendNo(int recommendNo) {
		this.recommendNo = recommendNo;
	}



	public int getMemberNo() {
		return memberNo;
	}



	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
	}



	public int getLetterNo() {
		return letterNo;
	}



	public void setLetterNo(int letterNo) {
		this.letterNo = letterNo;
	}



	public int getSubNo() {
		return subNo;
	}



	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}



	public int getTaste1() {
		return taste1;
	}



	public void setTaste1(int taste1) {
		this.taste1 = taste1;
	}



	public int getTaste2() {
		return taste2;
	}



	public void setTaste2(int taste2) {
		this.taste2 = taste2;
	}



	public int getTaste3() {
		return taste3;
	}



	public void setTaste3(int taste3) {
		this.taste3 = taste3;
	}



	public Date getExpirationDate() {
		return expirationDate;
	}



	public void setExpirationDate(Date expirationDate) {
		this.expirationDate = expirationDate;
	}



	@Override
	public String toString() {
		return "Recommend [plNo=" + plNo + ", plName=" + plName + ", plAddress=" + plAddress + ", plLocation="
				+ plLocation + ", plPhotoPath=" + plPhotoPath + ", plInfo=" + plInfo + ", preference=" + preference
				+ ", description=" + description + ", regiDate=" + regiDate + ", modiDate=" + modiDate + ", useYn="
				+ useYn + ", recommendNo=" + recommendNo + ", memberNo=" + memberNo + ", letterNo=" + letterNo
				+ ", subNo=" + subNo + ", taste1=" + taste1 + ", taste2=" + taste2 + ", taste3=" + taste3
				+ ", expirationDate=" + expirationDate + "]";
	}
	

	
	
	
	
	
	
	
	

}
