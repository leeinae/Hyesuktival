package kr.co.fedal.vo;

public class ArtistVO {
	private String aid;
	private String aname;
	private String src;
	
	@Override
	public String toString() {
		return "ArtistVO [aid=" + aid + ", aname=" + aname + ", src=" + src + "]";
	}
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getAname() {
		return aname;
	}
	public void setAname(String aname) {
		this.aname = aname;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	
}
