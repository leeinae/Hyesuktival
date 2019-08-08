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
		List<ArtistVO> artistList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectArtist", fid);
		
		return artistList;
	}

}
