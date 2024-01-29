package com.nilili.board.model.vo;

public class Like {
	
	private int bno;

	private int mno;

	public Like() {
		super();
		// TODO Auto-generated constructor stub
	}

	public Like(int boardNo, int memberNo) {
		super();
		this.bno = boardNo;
		this.mno = memberNo;
	}

	public int getBoardNo() {
		return bno;
	}

	public void setBoardNo(int boardNo) {
		this.bno = boardNo;
	}

	public int getMemberNo() {
		return mno;
	}

	public void setMemberNo(int memberNo) {
		this.mno = memberNo;
	}

	@Override
	public String toString() {
		return "Like [boardNo=" + bno + ", memberNo=" + mno + "]";
	}
	
	 

}
