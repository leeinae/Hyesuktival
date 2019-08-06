package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.vo.FestivalVO;

public interface FestivalDAO {
	/**
	 * @return : festival 전체 리스트 반환
	 */
	List<FestivalVO> selectAllFestival();
}
