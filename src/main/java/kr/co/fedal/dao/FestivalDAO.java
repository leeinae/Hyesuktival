package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.FestivalVO;

public interface FestivalDAO {
	/**
	 * @return : festival ��ü ����Ʈ ��ȯ
	 */
	public List<FestivalVO> selectAllFestival();
	
	public FestivalVO selectDetailFestival(String fid);
	
	public List<FestivalVO> searchFestival(String keyword);
}
