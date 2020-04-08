package com.kh.manage.admin.rank.model.vo;

public class Rank {

	private String rankNo;
	private String rankName;
	
	public Rank() {}

	public Rank(String rankNo, String rankName) {
		super();
		this.rankNo = rankNo;
		this.rankName = rankName;
	}

	public String getRankNo() {
		return rankNo;
	}

	public void setRankNo(String rankNo) {
		this.rankNo = rankNo;
	}

	public String getRankName() {
		return rankName;
	}

	public void setRankName(String rankName) {
		this.rankName = rankName;
	}

	@Override
	public String toString() {
		return "Rank [rankNo=" + rankNo + ", rankName=" + rankName + "]";
	}
	
	
}
