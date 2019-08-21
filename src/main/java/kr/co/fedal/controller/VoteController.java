package kr.co.fedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fedal.service.FestivalService;
import kr.co.fedal.vo.MusicVO;

@Controller
public class VoteController {

	@Autowired
	private FestivalService service;
	
	@RequestMapping(value="/artist/{aid}/rank", method=RequestMethod.POST)
	@ResponseBody
	public List<MusicVO> rank(@PathVariable("aid") String aid) {
		System.out.println("rank 호출");
		List<MusicVO> list = service.selectMusic(aid);
		System.out.println(list);
		return list;
	}

	@RequestMapping(value = "/artist/{aid}/{mid}/{voteFlag}", method = RequestMethod.POST)
	@ResponseBody
	public int voteUp(@PathVariable("mid") String mid) {
		System.out.println("mid: " + mid);

		MusicVO musicVO = service.selectCnt(mid);
		int mCnt = musicVO.getmCnt();
		mCnt++;
		service.voteCnt(mid);

		return mCnt;
	}

	@RequestMapping(value = "/artist/{aid}/{mid}/down", method = RequestMethod.POST)
	@ResponseBody
	public int voteDown(@PathVariable("mid") String mid) {
		System.out.println("mid: " + mid);

		MusicVO musicVO = service.selectCnt(mid);
		int mCnt = musicVO.getmCnt();
		mCnt--;
		service.voteCntCancel(mid);

		return mCnt;
	}
}
