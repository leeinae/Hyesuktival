package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.vo.FreviewVO;
import kr.co.fedal.vo.SignupVO;

public interface FreviewService {
	// festival comment insert
	public void insertFestivalComment(FreviewVO fvo);

	// festival comment select
	public List<FreviewVO> selectFestivalComments(String fid);
	
	// festival comment delete 
	public void deleteFestivalComment(int no);
	
	//festival comment update
	public void updateFestivalComment(FreviewVO fvo);
	
	//count festival comments
	public int countFestivalComments(String fid);
	
	//festival comment insert between start and end
	public List<FreviewVO> selectFestivalCommentsPaging(String fid, int start, int end);

}
