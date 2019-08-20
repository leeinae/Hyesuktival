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

	public List<FestivalVO> selectAll();

	public FestivalVO selectDetail(String fid);

	public List<ArtistVO> selectAllArtist(String fid);

	public List<MusicVO> selectAllMusic(String aid);

	public List<MusicVO> selectMusic(String aid);

	public ArtistVO selectArtist(String aid);

	public List<FestivalVO> searchAllFestival(String keyword);

	public void insertFestivalComment(FreviewVO fvo);

	void signup(SignupRequest signReq) throws Exception;

	AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;

	public void voteCnt(String mid);

	public void voteCntCancel(String mid);

	public MusicVO selectCnt(String mid);
}
