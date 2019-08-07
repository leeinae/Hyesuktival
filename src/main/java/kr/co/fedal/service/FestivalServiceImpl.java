package kr.co.fedal.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fedal.dao.FestivalDAO;
import kr.co.fedal.dao.FestivalDAOImpl;
import kr.co.fedal.exception.AlreadyExistingEmailException;
import kr.co.fedal.exception.AlreadyExistingIdException;
import kr.co.fedal.exception.IdPasswordNotMatchingException;
import kr.co.fedal.util.AuthInfo;
import kr.co.fedal.util.LoginCommand;
import kr.co.fedal.util.SignupRequest;
import kr.co.fedal.vo.FestivalVO;
import kr.co.fedal.vo.SignupVO;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDAO festivalDAO;

	@Resource(name = "festivalDAOImpl")
	private FestivalDAOImpl festivalDAOImpl;

	@Override
	public List<FestivalVO> selectAll() {
		List<FestivalVO> list = festivalDAO.selectAllFestival();
		return list;
	}

	@Override
	public void signup(SignupRequest signReq) throws Exception {
		SignupVO email = festivalDAOImpl.selectByEmail(signReq.getEmail());
		if (email != null) {
			throw new AlreadyExistingEmailException(signReq.getEmail() + " is duplicate email.");
		}
		SignupVO id = festivalDAOImpl.selectById(signReq.getId());
		if (id != null) {
			throw new AlreadyExistingIdException(signReq.getId() + " is duplicate id.");
		}
		festivalDAOImpl.insertUser(signReq);
	}

	@Override
	public AuthInfo loginAuth(LoginCommand loginCommand) throws Exception {
		SignupVO user = festivalDAOImpl.selectAllById(loginCommand.getId());
		if (user == null) {
			throw new IdPasswordNotMatchingException();
		}
		if (!user.matchPassword(loginCommand.getPassword())) {
			throw new IdPasswordNotMatchingException();
		}

		return new AuthInfo(user.getId(), user.getNickname());
	}
}
