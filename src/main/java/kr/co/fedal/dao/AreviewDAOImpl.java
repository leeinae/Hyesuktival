package kr.co.fedal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.vo.AreviewVO;
@Repository
public class AreviewDAOImpl implements AreviewDAO{

	
	@Autowired
	private SqlSessionTemplate session;
	
	@Override
	public void insertArtistComment(AreviewVO avo) {
		session.insert("kr.co.fedal.dao.AreviewDAO.insertArtistComment", avo);
		
	}

	@Override
	public List<AreviewVO> selectArtistComments(String aid) {
		List<AreviewVO> commentsList = session.selectList("kr.co.fedal.dao.AreviewDAO.selectArtistComments", aid);
		return commentsList;
	}

	@Override
	public void deleteArtistComment(int no) {
		session.delete("kr.co.fedal.dao.AreviewDAO.deleteArtistComment", no);
		
	}

	@Override
	public void updateArtistComment(AreviewVO avo) {
		session.update("kr.co.fedal.dao.AreviewDAO.updateArtistComment", avo);
		
	}

	@Override
	public int countArtistComments(String aid) {
		int count = session.selectOne("kr.co.fedal.dao.AreviewDAO.countArtistComments",aid);
		return count;
	}

	@Override
	public List<AreviewVO> selectArtistCommentsPaging(String aid, int start, int end) {
		Map<String,Object> map = new HashMap<>();
		map.put("aid",aid);
		map.put("start",start);
		map.put("end",end);
		
		return session.selectList("kr.co.fedal.dao.AreviewDAO.selectArtistCommentsPage", map);
	}

	@Override
	public List<String> YselectLikeCheck(String id) {
		List<String> list = session.selectList("kr.co.fedal.dao.AreviewDAO.YselectLikeCheck",id);
		return list;
	}

	@Override
	public void YinsertLike(Map<String, Object> map) {
		session.insert("kr.co.fedal.dao.AreviewDAO.YinsertLikeCheck",map);
		
	}

	@Override
	public void youtubeVoteCnt(String no) {
		session.insert("kr.co.fedal.dao.AreviewDAO.youtubeVoteCnt",no);
	}

	@Override
	public String selectYoutubeCnt(String no) {
		String cnt = session.selectOne("kr.co.fedal.dao.AreviewDAO.selectYoutubeCnt", no);
		return cnt;
	}
	
	
	
	
}
