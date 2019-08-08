package kr.co.fedal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.vo.FestivalVO;

@Repository
public class FestivalDAOImpl implements FestivalDAO {
	

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<FestivalVO> selectAllFestival() {
		List<FestivalVO> festivalList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectFestival");
		return festivalList;		
	}

	@Override
	public FestivalVO selectDetailFestival(String fid) {
		FestivalVO vo = session.selectOne("kr.co.fedal.dao.FestivalDAO.searchFestivalDetail",fid);
		return vo;
	}
	
	@Override
	public List<FestivalVO> searchFestival(String keyword) {
		List<FestivalVO> searchList = session.selectList("kr.co.fedal.dao.FestivalDAO.searchFestival", keyword);
		return searchList;
	}
	

}
