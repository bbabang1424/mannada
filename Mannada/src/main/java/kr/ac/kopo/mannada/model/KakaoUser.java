package kr.ac.kopo.mannada.model;

public class KakaoUser {
	private String id;
	private String nickname;

	
	public KakaoUser() {
		
	}
	
	public KakaoUser(String nickname, String profile_image) {
		super();
		this.id = id;
		this.nickname = nickname;
	}
	
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
