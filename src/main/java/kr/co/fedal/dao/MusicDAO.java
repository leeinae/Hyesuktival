package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.MusicVO;

public interface MusicDAO {
	public List<MusicVO> selectAllMusic(String aid);
}
