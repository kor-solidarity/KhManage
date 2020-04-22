package com.kh.manage.chat.model.vo;

public class SearchKeyWord {
	private String keyWord;
	private String kind;
	
	public SearchKeyWord() {}
	
	public SearchKeyWord(String keyWord, String kind) {
		super();
		this.keyWord = keyWord;
		this.kind = kind;
	}

	public String getKeyWord() {
		return keyWord;
	}

	public void setKeyWord(String keyWord) {
		this.keyWord = keyWord;
	}

	public String getKind() {
		return kind;
	}

	public void setKind(String kind) {
		this.kind = kind;
	}

	@Override
	public String toString() {
		return "SearchKeyWord [keyWord=" + keyWord + ", kind=" + kind + "]";
	}
	
	

}
