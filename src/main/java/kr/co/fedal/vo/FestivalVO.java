package kr.co.fedal.vo;

public class FestivalVO {
	private String fid;
	private String fname;
	private String startDate;
	private String endDate;
	private String floc;
	private String genre;
	private String src;
	
	public String getFid() {
		return fid;
	}
	public void setFid(String fid) {
		this.fid = fid;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public String getFloc() {
		return floc;
	}
	public void setFloc(String floc) {
		this.floc = floc;
	}
	public String getGenre() {
		return genre;
	}
	public void setGenre(String genre) {
		this.genre = genre;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	
	@Override
	public String toString() {
		return "FestivalVO [fid=" + fid + ", fname=" + fname + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", floc=" + floc + ", genre=" + genre + ", src=" + src + "]";
	}
	
	
}
