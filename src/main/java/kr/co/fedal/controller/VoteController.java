package kr.co.fedal.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fedal.dao.AreviewDAO;
import kr.co.fedal.service.AreviewService;
import kr.co.fedal.service.FestivalService;
import kr.co.fedal.vo.AreviewVO;
import kr.co.fedal.vo.MusicVO;

@Controller
public class VoteController {

	@Autowired
	private FestivalService service;
	
	@Autowired
	private AreviewService aservice;

	@RequestMapping(value = "/artist/{aid}/{mid}/up", method = RequestMethod.POST)
	@ResponseBody
	public int voteUp(@PathVariable("mid") String mid, HttpSession session) {
		System.out.println("mid: " + mid);
		String id;
		
		if(session.getAttribute("AuthInfoId")== null ) {
			id = (String) session.getAttribute("sessionName");
		} else {
			id = (String) session.getAttribute("AuthInfoId");
		}
		
		Map<String, String> map = new HashMap<>();
		map.put("mid",mid);
		map.put("id", id);

		service.insertLike(map);
		
		MusicVO musicVO = service.selectCnt(mid);
		int mCnt = musicVO.getmCnt();
		mCnt++;
		service.voteCnt(mid);

		return mCnt;
	}
	
	@RequestMapping(value = "/artist/{aid}/{no}/yup", method = RequestMethod.POST)
	@ResponseBody
	public int youtubeVoteUp(@PathVariable("no") String no, HttpSession session) {
		System.out.println("no: " + no);
		String id;
		
		if(session.getAttribute("AuthInfoId")== null ) {
			id = (String) session.getAttribute("sessionName");
		} else {
			id = (String) session.getAttribute("AuthInfoId");
		}
		
		Map<String, Object> map = new HashMap<>();
		map.put("no", no);
		map.put("id", id);

		aservice.insertLike(map);
		int yCnt =Integer.parseInt(aservice.selectYoutubeCnt(no));
		
		yCnt++;
		aservice.youtubeVoteCnt(no);

		return yCnt;
	}
}
