package kr.ac.kopo.mannada.model;

import java.util.Date;

public class Manna {
	
	private int id;
	private int category;
	private int num;
	private int status;
	private String title;
	private String address;
	private String dDay;
	private int member;
	private Date regDate;
	private String content;
	private int viewpoint;
	
	private String name;
	
	private int rnum;
	
	
	public String getCategory_() {
		String category_ = null;
		
		if(category == 1) {
			category_ = "공동구매";
			
		} else if(category == 2) {
			category_ = "운동";
			
		} else if(category == 3) {
			category_ = "게임";
			
		} else if(category == 4) {
			category_ = "식사";
			
		} else if (category == 5) {
			category_ = "기타";
		}
		
		return category_;
		
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getCategory() {
		return category;
	}

	public void setCategory(int category) {
		this.category = category;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getdDay() {
		return dDay;
	}

	public void setdDay(String dDay) {
		this.dDay = dDay;
	}

	public int getMember() {
		return member;
	}

	public void setMember(int member) {
		this.member = member;
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

	public int getViewpoint() {
		return viewpoint;
	}

	public void setViewpoint(int viewpoint) {
		this.viewpoint = viewpoint;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	
}
