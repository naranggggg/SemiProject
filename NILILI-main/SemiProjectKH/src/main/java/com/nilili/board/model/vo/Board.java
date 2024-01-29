package com.nilili.board.model.vo;

import java.util.Date;


public class Board {
	
//	BOARD_NO				NUMBER	
//	BOARD_TYPE				NUMBER	
//	BOARD_CATEGORY				VARCHAR2(100 BYTE)	
//	BOARD_TITLE				VARCHAR2(100 BYTE)	
//	BOARD_CONTENT				VARCHAR2(4000 BYTE)	
//	BOARD_WRITER				NUMBER	
//	COUNT				NUMBER	
//	DESCRIPTION				VARCHAR2(1000 BYTE)	
//	REGI_DATE				DATE	
//	MODI_DATE				DATE	
//	USE_YN				VARCHAR2(1 BYTE)	
//	
	
	private int boardNo;
	private int boardType;
	private String boardCategory;
	private String boardTitle;
	private String boardContent;
	private String boardWriter;
	private int count;
	private String description;
	private Date regiDate;
	private Date modiDate;
	private String useYn;
	private String memberId;
	
	public Board() {
		super();
	}

	public Board(int boardNo, int boardType, String boardCategory, String boardTitle, String boardContent,
			String boardWriter, int count, String description, Date regiDate, Date modiDate, String useYn) {
		super();
		this.boardNo = boardNo;
		this.boardType = boardType;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.count = count;
		this.description = description;
		this.regiDate = regiDate;
		this.modiDate = modiDate;
		this.useYn = useYn;
	}
	
	
	

	public Board(int boardNo, String boardCategory, String boardTitle, String boardContent, String boardWriter,
			Date regiDate) {
		super();
		this.boardNo = boardNo;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.boardContent = boardContent;
		this.boardWriter = boardWriter;
		this.regiDate = regiDate;
	}

	public Board(int boardNo, String boardCategory, String boardTitle, String memberId, int count, Date regiDate) {
		super();
		this.boardNo = boardNo;
		this.boardCategory = boardCategory;
		this.boardTitle = boardTitle;
		this.memberId = memberId;
		this.count = count;
		this.regiDate = regiDate;
		
	}
	

	public int getBoardNo() {
		return boardNo;
	}

	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}

	public int getBoardType() {
		return boardType;
	}

	public void setBoardType(int boardType) {
		this.boardType = boardType;
	}

	public String getBoardCategory() {
		return boardCategory;
	}

	public void setBoardCategory(String boardCategory) {
		this.boardCategory = boardCategory;
	}

	public String getBoardTitle() {
		return boardTitle;
	}

	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}

	public String getBoardContent() {
		return boardContent;
	}

	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}

	public String getBoardWriter() {
		return boardWriter;
	}

	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
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
	
	

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "Board [boardNo=" + boardNo + ", boardType=" + boardType + ", boardCategory=" + boardCategory
				+ ", boardTitle=" + boardTitle + ", boardContent=" + boardContent + ", boardWriter=" + boardWriter
				+ ", count=" + count + ", description=" + description + ", regiDate=" + regiDate + ", modiDate="
				+ modiDate + ", useYn=" + useYn + "]";
	}


	
	
	
	
	
}
