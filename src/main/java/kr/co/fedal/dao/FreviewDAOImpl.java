package kr.co.fedal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.vo.FreviewVO;
@Repository
public class FreviewDAOImpl implements FreviewDAO {
	
	@Autowired
	private SqlSessionTemplate session;

	@Override
	public void insertFestivalComment(FreviewVO fvo) {
		session.insert("kr.co.fedal.dao.FestivalDAO.insertFestivalComment", fvo);
	}

	@Override
	public List<FreviewVO> selectFestivalComments(String fid) {
		List<FreviewVO> commentsList = session.selectList("kr.co.fedal.dao.FestivalDAO.selectFestivalComments", fid);
		return commentsList;
	}
	
	

}
