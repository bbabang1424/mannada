package kr.ac.kopo.mannada.model;

import java.util.Date;

public class Manna {
	private int id;
	private int num;
	private String title;
	private Date regDate;
	private int member;
	private String dDay;
	private String content;
	private int category;      //1.공동구매 2.운동 3.식사 4.게임 5.기타
	private int viewCnt;	
	private String postnum;       //우편번호
	private String address;    //주소
	private String detAddress;  //상세주소
	
	/*외래키*/
	private String userId;
	private String nickname;
	
	/*구성키*/
	private int rnum;
	
	/*category와 status 한글 처리 : 데이터베이스가 처리하지 못할 시 제한을 두는 역할*/
	public String getCategory_() {
		if(category==1)
			return "공동구매";
		else if(category==2)
			return "운동";
		else if(category==3)
			return "식사";
		else if(category==4)
			return "게임";
		else if(category==5)
			return "기타";
		else
			return "없음";
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

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
	}

	public String getdDay() {
		return dDay;
	}

	public void setdDay(String dDay) {
		this.dDay = dDay;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getPostnum() {
		return postnum;
	}

	public void setPostnum(String postnum) {
		this.postnum = postnum;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getDetAddress() {
		return detAddress;
	}

	public void setDetAddress(String detAddress) {
		this.detAddress = detAddress;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getRnum() {
		return rnum;
	}

	public void setRnum(int rnum) {
		this.rnum = rnum;
	}	
}
