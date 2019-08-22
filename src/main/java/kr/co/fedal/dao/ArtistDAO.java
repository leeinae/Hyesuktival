package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.ArtistVO;

public interface ArtistDAO {
	//fid濡� 寃��깋
	public List<ArtistVO> selectAllArtist(String fid);
	
	//aid濡� 寃��깋
	public ArtistVO selectArtist(String aid);
	
	public List<ArtistVO> searchArtist(String keyword);
}
