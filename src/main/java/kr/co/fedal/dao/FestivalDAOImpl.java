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

}
