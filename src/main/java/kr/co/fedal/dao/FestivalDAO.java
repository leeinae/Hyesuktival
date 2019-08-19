package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.SignupVO;

public interface FestivalDAO {
	/**
	 * @return : festival 전체 리스트 반환
	 */
	List<FestivalVO> selectAllFestival();

	public SignupVO selectByEmail(String email);

	public SignupVO selectById(String id);

	public SignupVO selectAllById(String id);

	public void insertUser(SignupRequest signReq);

	public FestivalVO selectDetailFestival(String fid);

	public List<FestivalVO> searchFestival(String keyword);
}
