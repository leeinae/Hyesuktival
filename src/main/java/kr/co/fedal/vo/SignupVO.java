package kr.co.fedal.vo;

public class SignupVO {
	int no;
	String id, email, nickname, password, password2;

	public boolean isPwEqualToCheckPw() {
		return password.equals(password2);
	}

	public boolean matchPassword(String pw) {
		return this.password.equals(pw);
	}

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

	public String getPassword2() {
		return password2;
	}

	public void setPassword2(String password2) {
		this.password2 = password2;
	}

	@Override
	public String toString() {
		return "SignupVO [no=" + no + ", id=" + id + ", email=" + email + ", nickname=" + nickname + ", password="
				+ password + ", password2=" + password2 + "]";
	}

	public SignupVO(int no, String id, String email, String nickname, String password, String password2) {
		super();
		this.no = no;
		this.id = id;
		this.email = email;
		this.nickname = nickname;
		this.password = password;
		this.password2 = password2;
	}

	public SignupVO() {
		super();
		// TODO Auto-generated constructor stub
	}
}