package kr.co.fedal.service;

import java.util.List;
import java.util.Map;

import kr.co.fedal.util.AuthInfo;
import kr.co.fedal.util.LoginCommand;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;
import kr.co.fedal.vo.SignupVO;

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

	public SignupVO selectUserDataById(String id);

	public void updateUserInfo(SignupVO vo);
	
	public List<ArtistVO> searchAllArtist(String keyword);

	public Map<String, List<FestivalVO>> partiFestival(List<ArtistVO> fidList);
}
