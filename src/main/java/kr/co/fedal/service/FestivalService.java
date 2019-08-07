package kr.co.fedal.service;

import java.util.List;

import kr.co.fedal.util.AuthInfo;
import kr.co.fedal.util.LoginCommand;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.SignupVO;

public interface FestivalService {
	List<FestivalVO> selectAll();

	void signup(SignupRequest signReq) throws Exception;

	AuthInfo loginAuth(LoginCommand loginCommand) throws Exception;
}
