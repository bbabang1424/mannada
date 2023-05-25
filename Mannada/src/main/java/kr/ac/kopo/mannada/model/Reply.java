package kr.ac.kopo.mannada.model;

import java.util.Date;

public class Reply {
	private int id;
	private int commuId;
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
	public int getCommuId() {
		return commuId;
	}
	public void setCommuId(int commuId) {
		this.commuId = commuId;
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
