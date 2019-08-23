package kr.co.fedal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fedal.service.AreviewService;
import kr.co.fedal.service.FestivalService;
import kr.co.fedal.vo.AreviewVO;
import kr.co.fedal.vo.MusicVO;

@Controller
public class YoutubeVoteController {
	@Autowired
	private FestivalService service;
	private AreviewService aservice;

	@RequestMapping(value = "/artist/{aid}/{no}/yup", method = RequestMethod.POST)
	@ResponseBody
	public int voteUp(@PathVariable("no") int no, HttpSession session) {
		System.out.println("no: " + no);
		String id;
		
		if(session.getAttribute("AuthInfoId")== null ) {
			id = (String) session.getAttribute("sessionName");
		} else {
			id = (String) session.getAttribute("AuthInfoId");
		}
		
		/*Map<Integer, String> map = new HashMap<>();
		map.put(no, "no");
		map.put("id", id);
		System.out.println("map:"+map);
		aservice.insertLike(map);*/
		
		/*List<Integer> list = new ArrayList<>();
		list.add(no);
		System.out.println(list);
		aservice.insertLike(map);*/
		
		AreviewVO areviewVO = service.selectNoCnt(no);
		int cnt = areviewVO.getCnt();
		cnt++;
		service.youtubeVoteCnt(no);

		return cnt;
	}

	
	
	
	
	
	
	
	
	
	
	
	/*@Autowired
	private FestivalService service;

	@RequestMapping(value = "/artist/{aid}/{no}/yup", method = RequestMethod.POST)
	@ResponseBody
	public int voteUp(@PathVariable("no") int no) {
		System.out.println("no: " + no);
		
		AreviewVO areviewVO = service.selectNoCnt(no);

		int cnt = areviewVO.getCnt();
		cnt++;
		service.youtubeVoteCnt(no);

		return cnt;*/
	

	/*@RequestMapping(value = "/artist/{aid}/{no}/ydown", method = RequestMethod.POST)
	@ResponseBody
	public int voteDown(@PathVariable("no") int no) {
		System.out.println("no: " + no);
		
		AreviewVO areviewVO = service.selectNoCnt(no);		
		int cnt = areviewVO.getCnt();
		cnt--;
		service.youtubeVoteCntCancel(no);

		return cnt;
	}*/

}
