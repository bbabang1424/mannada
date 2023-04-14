package kr.ac.kopo.mannada.model;

import java.util.Date;

public class Chat {
	private int id;
	private int mannaId;
	private int num;
	private String content;
	private Date regDate;
	
	private String nickname;
	
	
	
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getMannaId() {
		return mannaId;
	}
	public void setMannaId(int mannaId) {
		this.mannaId = mannaId;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	
}
