package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.MusicVO;

public interface MusicDAO {
	public List<MusicVO> selectAllMusic(String aid);
	
	public List<MusicVO> selectMusic(String aid);
	
	public void voteCnt(String mid);
	
	public void voteCntCancel(String mid);
	
	public MusicVO selectCnt(String mid);
}
