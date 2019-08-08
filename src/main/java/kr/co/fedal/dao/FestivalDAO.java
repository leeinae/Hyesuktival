package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.FestivalVO;

public interface FestivalDAO {
	/**
	 * @return : festival ��ü ����Ʈ ��ȯ
	 */
	List<FestivalVO> selectAllFestival();
	
	FestivalVO selectDetailFestival(String fid);
}
