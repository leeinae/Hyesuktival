package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.util.AuthInfo;
import kr.co.fedal.util.LoginCommand;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;

public interface FestivalService {
	// 페스티벌 정보
	public List<FestivalVO> selectAll();

	// fid가 일치하는 페스티벌
	public FestivalVO selectDetail(String fid);

	// fid가 동일한 페스티벌에 참가하는 아티스트
	public List<ArtistVO> selectAllArtist(String fid);

	// 아티스트 음원정보
	public List<MusicVO> selectAllMusic(String aid);

	// 아티스트 정보
	public ArtistVO selectArtist(String aid);

	// 페스티벌 검색
	public List<FestivalVO> searchAllFestival(String keyword);

	// 페스티벌 리뷰 insert
	public void insertFestivalComment(FreviewVO fvo);

	void signup(SignupRequest signReq) throws Exception;

	AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;
}
