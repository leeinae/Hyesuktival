package kr.co.fedal.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.vo.MusicVO;
@Repository
public class MusicDAOImpl implements MusicDAO {

	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public List<MusicVO> selectAllMusic(String aid) {
		List<MusicVO> list = session.selectList("kr.co.fedal.dao.FestivalDAO.selectMusic",aid);
		return list;
	}

}
