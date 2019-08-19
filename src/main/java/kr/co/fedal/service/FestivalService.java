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
<<<<<<< HEAD
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
=======
	// �佺Ƽ�� ����
	public List<FestivalVO> selectAll();

	// fid�� ��ġ�ϴ� �佺Ƽ��
	public FestivalVO selectDetail(String fid);

	// fid�� ������ �佺Ƽ���� �����ϴ� ��Ƽ��Ʈ
	public List<ArtistVO> selectAllArtist(String fid);

	// ��Ƽ��Ʈ ��������
	public List<MusicVO> selectAllMusic(String aid);

	// ��Ƽ��Ʈ ����
	public ArtistVO selectArtist(String aid);

	// �佺Ƽ�� �˻�
	public List<FestivalVO> searchAllFestival(String keyword);

	// �佺Ƽ�� ���� insert
	public void insertFestivalComment(FreviewVO fvo);

	void signup(SignupRequest signReq) throws Exception;

	AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;
	
	public void voteCnt(String mid);
	
	public void voteCntCancel(String mid);
	
	public MusicVO selectCnt(String mid);
>>>>>>> origin/Vote
}
