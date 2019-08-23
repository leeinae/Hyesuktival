package kr.co.fedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fedal.dao.FreviewDAO;
import kr.co.fedal.vo.FreviewVO;

@Service
public class FreviewServiceImpl implements FreviewService {

	@Autowired
	private FreviewDAO freviewDao;

	public void insertFestivalComment(FreviewVO fvo) {
		freviewDao.insertFestivalComment(fvo);
	}

	@Override
	public List<FreviewVO> selectFestivalComments(String fid) {
		List<FreviewVO> list = freviewDao.selectFestivalComments(fid);
		return list;
	}

	@Override
	public void deleteFestivalComment(int no) {
		freviewDao.deleteFestivalComment(no);
	}

	@Override
	public void updateFestivalComment(FreviewVO fvo) {
		freviewDao.updateFestivalComment(fvo);
	}

	@Override
	public int countFestivalComments(String fid) {
		int count = freviewDao.countFestivalComments(fid);
		return count;
	}

	@Override
	public List<FreviewVO> selectFestivalCommentsPaging(String fid, int start, int end) {
		List<FreviewVO> list = freviewDao.selectFestivalCommentsPaging(fid, start, end);
		return list;
	}
	
	

}
