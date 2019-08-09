package kr.co.fedal.vo;

public class FreviewVO {
	private int no;
	private String content;
	private String regDate;
	private String writer;
	private String fid;
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	
	@Override
	public String toString() {
		return "FreviewVO [no=" + no + ", content=" + content + ", regDate=" + regDate + ", writer=" + writer + ", fid="
				+ fid + "]";
	}
	
}
