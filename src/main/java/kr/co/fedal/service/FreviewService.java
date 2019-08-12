package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.vo.FreviewVO;

public interface FreviewService {
	// 페스티벌 댓글 insert
	public void insertFestivalComment(FreviewVO fvo);

	// 페스티벌 댓글 select
	public List<FreviewVO> selectFestivalComments(String fid);
}
