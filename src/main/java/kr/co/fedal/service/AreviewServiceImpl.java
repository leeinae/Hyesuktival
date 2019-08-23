package kr.co.fedal.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fedal.dao.AreviewDAO;
import kr.co.fedal.vo.AreviewVO;

@Service
public class AreviewServiceImpl implements AreviewService{

	@Autowired
	private AreviewDAO areviewDao;
	
	public void insertArtistComment(AreviewVO avo) {
		areviewDao.insertArtistComment(avo);
		
	}

	@Override
	public List<AreviewVO> selectArtistComments(String aid) {
		List<AreviewVO> list = areviewDao.selectArtistComments(aid);
		return list;
	}

	@Override
	public void deleteArtistComment(int no) {
		areviewDao.deleteArtistComment(no);
		
	}

	@Override
	public void updateArtistComment(AreviewVO avo) {
		areviewDao.updateArtistComment(avo);
		
	}

	@Override
	public int countArtistComments(String aid) {
		int count = areviewDao.countArtistComments(aid);
		return count;
	}

	@Override
	public List<AreviewVO> selectArtistCommentsPaging(String aid, int start, int end) {
		List<AreviewVO> list = areviewDao.selectArtistCommentsPaging(aid, start, end);
		return list;
	}

	@Override
	public List<Integer> selectLikeCheck(String id) {
		List<Integer> list = areviewDao.selectLikeCheck(id);
		return list;
	}

	@Override
	public void insertLike(Map<Integer, String> map) {
		areviewDao.insertLike(map);		
	}

}
