package kr.co.fedal.vo;

public class MusicVO {
	private String aid;
	private String mname;
	private int mCnt;
	
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public int getmCnt() {
		return mCnt;
	}
	public void setmCnt(int mCnt) {
		this.mCnt = mCnt;
	}
	
	@Override
	public String toString() {
		return "MusicVO [aid=" + aid + ", mname=" + mname + ", mCnt=" + mCnt + "]";
	}
	
	
}
