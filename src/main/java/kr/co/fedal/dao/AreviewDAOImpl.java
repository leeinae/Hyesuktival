package kr.co.fedal.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.fedal.vo.AreviewVO;
import kr.co.fedal.vo.MusicVO;
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
	public void youtubeVoteCnt(int no) {
		session.update("kr.co.fedal.dao.FestivalDAO.youtubeVoteCnt", no);
		
	}

	@Override
	public void youtubeVoteCntCancel(int no) {
		session.update("kr.co.fedal.dao.FestivalDAO.youtubeVoteCntCancel", no);
		
	}

	@Override
	public AreviewVO selectNoCnt(int no) {
		AreviewVO vo = session.selectOne("kr.co.fedal.dao.FestivalDAO.selectNoCnt", no);
		return vo;
	}

	@Override
	public List<Integer> selectLikeCheck(String id) {
		List<Integer> list = session.selectList("kr.co.fedal.dao.FestivalDAO.YselectLikeCheck",id);
		return list;
	}

	@Override
	public void insertLike(Map<Integer, String> map) {
		session.insert("kr.co.fedal.dao.FestivalDAO.YinsertLikeCheck", map);
		
	}

}
