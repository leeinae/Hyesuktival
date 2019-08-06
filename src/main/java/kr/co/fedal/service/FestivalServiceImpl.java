package kr.co.fedal.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.fedal.dao.FestivalDAO;
import kr.co.fedal.vo.FestivalVO;

@Service
public class FestivalServiceImpl implements FestivalService {

	@Autowired
	private FestivalDAO festivalDao;
	
	@Override
	public List<FestivalVO> selectAll() {
		List<FestivalVO> list = festivalDao.selectAllFestival();
		return list;
	}

}
