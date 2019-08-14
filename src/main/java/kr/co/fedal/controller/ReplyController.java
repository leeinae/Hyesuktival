package kr.co.fedal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.co.fedal.paging.Paging;
import kr.co.fedal.service.FreviewService;
import kr.co.fedal.vo.FreviewVO;

@Controller
@RequestMapping("/festival/comments")
@RestController
public class ReplyController {
	
	@Autowired
	private FreviewService service;
	
	//댓글 입력 -> DB 저장
	@RequestMapping(value="/{fid}", method=RequestMethod.POST)
	public void insertComment(@PathVariable("fid") String fid, FreviewVO review){	
		//댓글 db에 저장
		service.insertFestivalComment(review);
		System.out.println("댓글 저장 완료");
	}
	
	//DB에 저장된 해당 페스티벌 후기 댓글 받아오기
	@RequestMapping(value="/{fid}/{page}", method=RequestMethod.POST)
	public Map<String, Object> getComments(
			@PathVariable("fid") String fid,
			@PathVariable("page") Integer page)	
	{
		//db에서 댓글 개수 받아오기, paging 객체 생성 후 현재 페이지, 전체 페이지 수 설정
		int count = service.countFestivalComments(fid);
		Paging paging = new Paging(count ,page);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<FreviewVO> cList = service.selectFestivalCommentsPaging(fid, start, end);
		
		map.put("list",cList);
		map.put("paging",paging);

		return map;
	}
	
	@RequestMapping(value="/delete/{no}", method=RequestMethod.POST)
	public void deleteComment(@PathVariable("no") int no) {
		service.deleteFestivalComment(no);		
	}
	
	@RequestMapping(value="/update/{no}", method=RequestMethod.POST)
	public void updateComment(@PathVariable("no") int no, FreviewVO fvo) {
		service.updateFestivalComment(fvo);
	}
	
}
