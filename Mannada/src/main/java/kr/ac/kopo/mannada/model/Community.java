package kr.ac.kopo.mannada.model;

import java.util.Date;

public class Community {
	private int id;
	private int num;
	private int category;
	private String title;
	private Date regDate;
	private String content;
	private int viewCnt;
	
	private String nickname;
	
	private int rnum;

	/*category와 status 한글 처리 : 데이터베이스가 처리하지 못할 시 제한을 두는 역할*/
	public String getCategory_() {
		if(category==1)
			return "후기";
		else if(category==2)
			return "소통";
		else
			return "없음";
	}
	
	public int getCategory() {
		return category;
	}
	
	public void setCategory(int category) {
		this.category = category;
	}
	
	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
