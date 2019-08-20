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
	
	//��� �Է� -> DB ����
	@RequestMapping(value="/{fid}", method=RequestMethod.POST)
	public void insertComment(@PathVariable("fid") String fid, FreviewVO review){	
		//��� db�� ����
		service.insertFestivalComment(review);
	}
	
	//DB�� ����� �ش� �佺Ƽ�� �ı� ��� �޾ƿ���
	@RequestMapping(value="/{fid}/{page}", method=RequestMethod.POST)
	public Map<String, Object> getComments(
			@PathVariable("fid") String fid,
			@PathVariable("page") Integer page)	
	{
		//db���� ��� ���� �޾ƿ���, paging ��ü ���� �� ���� ������, ��ü ������ �� ����
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
