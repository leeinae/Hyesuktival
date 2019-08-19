package kr.co.fedal.service;

import java.util.List;

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
	public ArtistVO selectArtist(String aid) {
		ArtistVO vo = artistDao.selectArtist(aid);
		return vo;
	}

	@Override
	public List<FestivalVO> searchAllFestival(String keyword) {
		List<FestivalVO> list = festivalDao.searchFestival(keyword);
		return list;
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
}
