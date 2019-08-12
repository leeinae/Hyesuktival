package kr.co.fedal.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.fedal.service.FreviewService;
import kr.co.fedal.vo.FreviewVO;

@Controller
public class ReplyController {
	
	@Autowired
	private FreviewService service;
	
	//댓글 입력 -> DB 저장
	@RequestMapping(value="festival/comments/{fid}", method=RequestMethod.POST)
	@ResponseBody
	public void insertComment(@PathVariable("fid") String fid, FreviewVO review){	
		//댓글 db에 저장
		service.insertFestivalComment(review);
		System.out.println("댓글 저장 완료");
	}
	
	//DB에 저장된 해당 페스티벌 후기 댓글 받아오기
	@RequestMapping(value="festival/comments/{fid}", method=RequestMethod.GET)
	@ResponseBody
	public List<FreviewVO> getComments(@PathVariable("fid") String fid) {
		List<FreviewVO> cList = service.selectFestivalComments(fid);
		return cList;
	}
	
}
