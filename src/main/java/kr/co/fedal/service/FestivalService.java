package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.MusicVO;

public interface FestivalService {
	//�佺Ƽ�� ����
	public List<FestivalVO> selectAll();
	public FestivalVO selectDetail(String fid);
	
	//��Ƽ��Ʈ ����
	public List<ArtistVO> selectAllArtist(String fid); 
	
	//��������
	public List<MusicVO> selectAllMusic(String aid);
}
