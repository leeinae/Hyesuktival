package kr.co.fedal.dao;

import java.util.List;

import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.SignupVO;

public interface FestivalDAO {
	/**
	 * @return : festival ��ü ����Ʈ ��ȯ
	 */
	List<FestivalVO> selectAllFestival();
	
	public SignupVO selectByEmail(String email);

	public SignupVO selectById(String id);

	public void insertUser(SignupRequest signReq);
}