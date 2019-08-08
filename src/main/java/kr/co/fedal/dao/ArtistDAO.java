package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.ArtistVO;

public interface ArtistDAO {
	public List<ArtistVO> selectAllArtist(String fid);
}
