package kr.ac.kopo.mannada.model;

import java.util.Date;

public class Mannada {
	
	private int id;
	private int category;
	private int category_;
	private String userId;
	private int status;
	private String title;
	private String address;
	private Date date;
	private int member;
	private Date regDate;
	private String content;
	private int viewpoint;
	
	
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
	public int getCategory_() {
		return category_;
	}
	public void setCategory_(int category_) {
		this.category_ = category_;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
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
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
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
	
	
}
