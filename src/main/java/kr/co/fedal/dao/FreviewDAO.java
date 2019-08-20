package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.FreviewVO;

public interface FreviewDAO {
	public void insertFestivalComment(FreviewVO fvo);

	public List<FreviewVO> selectFestivalComments(String fid);

	public void deleteFestivalComment(int no);

	public void updateFestivalComment(FreviewVO fvo);

	public int countFestivalComments(String fid);

	public List<FreviewVO> selectFestivalCommentsPaging(String fid, int start, int end);
}
