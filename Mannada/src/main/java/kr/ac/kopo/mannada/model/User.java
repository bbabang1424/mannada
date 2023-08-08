package kr.ac.kopo.mannada.model;

import java.util.Date;

public class User {
	private int num;
	private String id;
	private String pw;
	private String nickname;
	private String intro;
	private Date regDate;
	private int status;
	private Date delDate;
	 
	private String newPW;
	
	private Attach attach;
	private float starAvg;
	private int starCnt;

	public String getStatus_() {
		if(status==0)
			return "회원가입";
		else
			return "회원탈퇴";
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getIntro() {
		return intro;
	}

	public void setIntro(String intro) {
		this.intro = intro;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getDelDate() {
		return delDate;
	}

	public void setDelDate(Date delDate) {
		this.delDate = delDate;
	}

	public String getNewPW() {
		return newPW;
	}

	public void setNewPW(String newPW) {
		this.newPW = newPW;
	}

	public Attach getAttach() {
		return attach;
	}

	public void setAttach(Attach attach) {
		this.attach = attach;
	}

	public float getStarAvg() {
		return starAvg;
	}

	public void setStarAvg(float starAvg) {
		this.starAvg = starAvg;
	}

	public int getStarCnt() {
		return starCnt;
	}

	public void setStarCnt(int starCnt) {
		this.starCnt = starCnt;
	}
	
}
