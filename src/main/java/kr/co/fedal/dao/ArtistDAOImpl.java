package kr.co.fedal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.vo.ArtistVO;
@Repository
public class ArtistDAOImpl implements ArtistDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public List<ArtistVO> selectAllArtist(String fid) {
		List<ArtistVO> artistList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectArtistList", fid);
		
		return artistList;
	}

	@Override
	public ArtistVO selectArtist(String aid) {
		ArtistVO vo = session.selectOne("kr.co.fedal.dao.FestivalDAO.selectArtist", aid);
		return vo;
	}

	@Override
	public List<ArtistVO> searchArtist(String keyword) {
		List<ArtistVO> searchArtistList = session.selectList("kr.co.fedal.dao.FestivalDAO.searchArtist", keyword);
		return searchArtistList;
	}

}
