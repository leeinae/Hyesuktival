package kr.co.fedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fedal.dao.ArtistDAO;
import kr.co.fedal.dao.FestivalDAO;
import kr.co.fedal.dao.MusicDAO;
import kr.co.fedal.vo.ArtistVO;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.MusicVO;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDAO festivalDao;
	
	@Autowired
	private ArtistDAO artistDao;
	
	@Autowired
	private MusicDAO musicDao;
	
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

	
}
