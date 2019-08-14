package kr.co.fedal.vo;

public class MusicVO {
	private String mid;
	private String aid;
	private String mname;
	private int mCnt;
	private String src;
	private String album;

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

	public String getSrc() {
		return src;
	}

	public void setSrc(String src) {
		this.src = src;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getMid() {
		return mid;
	}

	public void setMid(String mid) {
		this.mid = mid;
	}

	@Override
	public String toString() {
		return "MusicVO [mid=" + mid + ", aid=" + aid + ", mname=" + mname + ", mCnt=" + mCnt + ", src=" + src
				+ ", album=" + album + "]";
	}

}
