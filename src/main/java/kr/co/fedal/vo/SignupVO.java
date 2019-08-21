package kr.co.fedal.vo;

public class SignupVO {
	int no;
	String id, email, nickname, password;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	@Override
	public String toString() {
		return "SignupVO [no=" + no + ", id=" + id + ", email=" + email + ", nickname=" + nickname + ", password="
				+ password + "]";
	}

	public SignupVO(int no, String id, String email, String nickname, String password) {
		super();
		this.no = no;
		this.id = id;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
	}

	public SignupVO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public boolean matchPassword(String pw) {
		return this.password.equals(pw);
	}
}
