package kr.co.fedal.util;

public class AuthInfo {

	private String id, nickname;

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

	public AuthInfo(String id, String nickname) {
		super();
		this.id = id;
		this.nickname = nickname;
	}

}
