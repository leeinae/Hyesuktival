package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.MusicVO;

public interface FestivalService {
	//페스티벌 정보
	public List<FestivalVO> selectAll();
	public FestivalVO selectDetail(String fid);
	
	//아티스트 정보
	public List<ArtistVO> selectAllArtist(String fid); 
	
	//음원정보
	public List<MusicVO> selectAllMusic(String aid);
}
