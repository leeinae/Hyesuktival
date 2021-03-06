package kr.co.fedal.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fedal.dao.ArtistDAO;
import kr.co.fedal.dao.FestivalDAO;
import kr.co.fedal.dao.FestivalDAOImpl;
import kr.co.fedal.dao.FreviewDAO;
import kr.co.fedal.dao.MusicDAO;
import kr.co.fedal.exception.AlreadyExistingEmailException;
import kr.co.fedal.exception.AlreadyExistingIdException;
import kr.co.fedal.exception.IdPasswordNotMatchingException;
import kr.co.fedal.util.AuthInfo;
import kr.co.fedal.util.LoginCommand;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.MusicVO;
import kr.co.fedal.vo.SignupVO;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDAO festivalDao;

	@Autowired
	private ArtistDAO artistDao;

	@Autowired
	private MusicDAO musicDao;

	@Autowired
	private FreviewDAO freviewDao;

	@Resource(name = "festivalDAOImpl")
	private FestivalDAOImpl festivalDAOImpl;

	@Override
	public List<FestivalVO> selectAll() {
		List<FestivalVO> list = festivalDao.selectAllFestival();
		return list;
	}

	@Override
	public FestivalVO selectDetail(String fid) {
		FestivalVO vo = festivalDao.selectDetailFestival(fid);
		return vo;
	}

	@Override
	public List<ArtistVO> selectAllArtist(String fid) {
		List<ArtistVO> list = artistDao.selectAllArtist(fid);
		return list;
	}

	@Override
	public List<MusicVO> selectAllMusic(String aid) {
		List<MusicVO> list = musicDao.selectAllMusic(aid);
		return list;
	}

	@Override
	public List<MusicVO> selectMusic(String aid) {
		List<MusicVO> list = musicDao.selectMusic(aid);
		return list;
	}

	@Override
	public ArtistVO selectArtist(String aid) {
		ArtistVO vo = artistDao.selectArtist(aid);
		return vo;
	}

	@Override
	public List<FestivalVO> searchAllFestival(String keyword) {
		List<FestivalVO> list = festivalDao.searchFestival(keyword);
		return list;
	}
	
	@Override
	public List<ArtistVO> searchAllArtist(String keyword) {
		List<ArtistVO> list = artistDao.searchArtist(keyword);
		return list;
	}


	@Override
	public Map<String, List<FestivalVO>> partiFestival(List<ArtistVO> fidList) {
		Map<String, List<FestivalVO>> map = new HashMap<>();
		for(ArtistVO a: fidList) {
			List<String> aidList = festivalDao.findFids(a.getAid());
			List<FestivalVO> festVOList = new ArrayList<>();
			for(String s: aidList) {
				festVOList.add(festivalDao.searchRes(s));
			}
			map.put(a.getAid(), festVOList);
		}
		
		return map;
		
	}

	public void insertFestivalComment(FreviewVO fvo) {
		freviewDao.insertFestivalComment(fvo);
	}

	@Override
	public void signup(SignupRequest signReq) throws Exception {
		SignupVO email = festivalDAOImpl.selectByEmail(signReq.getEmail());
		if (email != null) {
			throw new AlreadyExistingEmailException(signReq.getEmail() + " is duplicate email.");
		}
		SignupVO id = festivalDAOImpl.selectById(signReq.getId());
		if (id != null) {
			throw new AlreadyExistingIdException(signReq.getId() + " is duplicate id.");
		}
		festivalDAOImpl.insertUser(signReq);
	}

	@Override
	public AuthInfo loginAuth(LoginCommand loginCommand) throws Exception {
		SignupVO user = festivalDAOImpl.selectAllById(loginCommand.getId());
		if (user == null) {
			throw new IdPasswordNotMatchingException();
		}
		if (!user.matchPassword(loginCommand.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}

		return new AuthInfo(user.getId(), user.getNickname());
	}

	@Override
	public void voteCnt(String mid) {
		musicDao.voteCnt(mid);
	}

	@Override
	public void voteCntCancel(String mid) {
		musicDao.voteCntCancel(mid);
	}

	@Override
	public MusicVO selectCnt(String mid) {
		MusicVO vo = musicDao.selectCnt(mid);
		return vo;
	}

	@Override
	public SignupVO selectUserDataById(String id) {
		SignupVO vo = festivalDao.selectAllById(id);
		return vo;
	}

	@Override
	public void updateUserInfo(SignupVO vo) {
		festivalDao.updateUserInfo(vo);
	}

	@Override
	public List<Map<String,String>> selectLikeCheck(String id) {
		List<Map<String,String>> list = musicDao.selectLikeCheck(id);
		return list;
	}

	@Override
	public void insertLike(Map<String, String> map) {
		musicDao.insertLike(map);
	}
	
	

}
