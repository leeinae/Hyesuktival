package kr.co.fedal.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.fedal.paging.Paging;
import kr.co.fedal.service.AreviewService;
import kr.co.fedal.vo.AreviewVO;

@Controller
@RequestMapping("/artist/comments")
@RestController
public class AReplyController {
	@Autowired
	private AreviewService service;
	
	//��� �Է� -> DB ����
	@RequestMapping(value="/{aid}", method=RequestMethod.POST)
	public void insertComment(@PathVariable("aid") String aid, AreviewVO review){	
		//��� db�� ����
		service.insertArtistComment(review);
		System.out.println("��� ���� �Ϸ�");
	}
	
	//DB�� ����� �ش� �佺Ƽ�� �ı� ��� �޾ƿ���
	@RequestMapping(value="/{aid}/{page}", method=RequestMethod.POST)
	public Map<String, Object> getComments(
			@PathVariable("aid") String aid,
			@PathVariable("page") Integer page)	
	{
		//db���� ��� ���� �޾ƿ���, paging ��ü ���� �� ���� ������, ��ü ������ �� ����
		int count = service.countArtistComments(aid);
		Paging paging = new Paging(count ,page);
		int start = paging.getPageBegin();
		int end = paging.getPageEnd();
		
		Map<String, Object> map = new HashMap<String, Object>();
		List<AreviewVO> cList = service.selectArtistCommentsPaging(aid, start, end);
		
		map.put("list",cList);
		map.put("paging",paging);

		return map;
	}
	
	@RequestMapping(value="/delete/{no}", method=RequestMethod.POST)
	public void deleteComment(@PathVariable("no") int no) {
		service.deleteArtistComment(no);		
	}
	
	@RequestMapping(value="/update/{no}", method=RequestMethod.POST)
	public void updateComment(@PathVariable("no") int no, AreviewVO avo) {
		service.updateArtistComment(avo);
	}
}
