package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.ArtistVO;

public interface ArtistDAO {
	//fid로 검색
	public List<ArtistVO> selectAllArtist(String fid);
	
	//aid로 검색
	public ArtistVO selectArtist(String aid);
}
