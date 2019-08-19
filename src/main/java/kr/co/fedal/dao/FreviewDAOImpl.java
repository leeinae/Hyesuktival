package kr.co.fedal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		session.insert("kr.co.fedal.dao.FreviewDAO.insertFestivalComment", fvo);
	}

	@Override
	public List<FreviewVO> selectFestivalComments(String fid) {
		List<FreviewVO> commentsList = session.selectList("kr.co.fedal.dao.FreviewDAO.selectFestivalComments", fid);
		return commentsList;
	}

	@Override
	public void deleteFestivalComment(int no) {
		session.delete("kr.co.fedal.dao.FreviewDAO.deleteFestivalComment", no);
	}

	@Override
	public void updateFestivalComment(FreviewVO fvo) {
		session.update("kr.co.fedal.dao.FreviewDAO.updateFestivalComment", fvo);
	}

	@Override
	public int countFestivalComments(String fid) {
		int count = session.selectOne("kr.co.fedal.dao.FreviewDAO.countFestivalComments",fid);
		return count;
	}

	@Override
	public List<FreviewVO> selectFestivalCommentsPaging(String fid, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("fid",fid);
		map.put("start",start);
		map.put("end",end);
		
		return session.selectList("kr.co.fedal.dao.FreviewDAO.selectFestivalCommentsPage", map);
	}

	
}
