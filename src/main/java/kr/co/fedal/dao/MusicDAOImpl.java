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
		List<MusicVO> list = session.selectList("kr.co.fedal.dao.FestivalDAO.selectAllMusic", aid);
		return list;
	}

	@Override
	public List<MusicVO> selectMusic(String aid) {
		List<MusicVO> list = session.selectList("kr.co.fedal.dao.FestivalDAO.selectMusic", aid);
		return list;
	}

	@Override
	public void voteCnt(String mid) {
		session.update("kr.co.fedal.dao.FestivalDAO.voteCnt", mid);
	}

	@Override
	public void voteCntCancel(String mid) {
		session.update("kr.co.fedal.dao.FestivalDAO.voteCntCancel", mid);
	}

	@Override
	public MusicVO selectCnt(String mid) {
		MusicVO vo = session.selectOne("kr.co.fedal.dao.FestivalDAO.selectCnt", mid);
		return vo;
	}
}
