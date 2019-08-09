package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;

public interface FestivalService {
	//�럹�뒪�떚踰� �젙蹂�
	public List<FestivalVO> selectAll();
	//fid媛� �씪移섑븯�뒗 �럹�뒪�떚踰� 
	public FestivalVO selectDetail(String fid);
	
	//fid媛� �룞�씪�븳 �럹�뒪�떚踰뚯뿉 李멸��븯�뒗 �븘�떚�뒪�듃
	public List<ArtistVO> selectAllArtist(String fid); 
	
	//�븘�떚�뒪�듃 �쓬�썝�젙蹂�
	public List<MusicVO> selectAllMusic(String aid);
	
	//�븘�떚�뒪�듃 �젙蹂�
	public ArtistVO selectArtist(String aid);
	
	//�럹�뒪�떚踰� 寃��깋
	public List<FestivalVO> searchAllFestival(String keyword);
	
	//�럹�뒪�떚踰� 由щ럭 insert
	public void insertFestivalComment(FreviewVO fvo);
	
	//페스티벌 댓글 select
	public List<FreviewVO> selectFestivalComments(String fid);
}
