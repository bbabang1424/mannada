package kr.ac.kopo.mannada.model;

public class KakaoUser {
	private String nickname;
	private String email;

	
	public KakaoUser() {
		
	}
	
	public KakaoUser(String nickname, String profile_image) {
		super();
		this.nickname = nickname;
		this.email = email;
	}
	
	


	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
}
