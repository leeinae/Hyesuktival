package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.FreviewVO;

public interface FreviewDAO {
	public void insertFestivalComment(FreviewVO fvo);
	public List<FreviewVO> selectFestivalComments(String fid);
}
